<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use App\Models\CustomerPayment;
use App\Models\PaymentAccount;
use App\Models\Sell;
use App\Models\SellPayment;
use App\Models\Store;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class CustomerPaymentController extends Controller
{
    public function getLedger(Request $request, $id)
    {
        try {
            // Get default date range if not provided
            $startDate = Carbon::now()->startOfYear();
            $endDate = Carbon::now()->endOfYear();

            // If date range is provided, parse it
            if ($request->has('date_range') && !empty($request->date_range)) {
                $dateRange = explode(' - ', $request->date_range);
                if (count($dateRange) == 2) {
                    $startDate = Carbon::parse($dateRange[0])->startOfDay();
                    $endDate = Carbon::parse($dateRange[1])->endOfDay();
                }
            }

            // Get regular sales
//            $sells = Sell::with(['payments', 'store'])
            $sells = Sell::with(['payments', 'store'])
                ->where('customer_id', $id)
                ->whereBetween('sell_date', [$startDate, $endDate])
                ->when($request->store_id !== 'all', function ($query) use ($request) {
                    return $query->where('store_id', $request->store_id);
                })
                ->get();

            // Combine and format transactions for ledger
            $transactions = collect();

            // Add sells to transactions
            foreach ($sells as $sell) {
                // Add sale entry
                $transactions->push([
                    'date' => $sell->sell_date,
                    'reference_no' => $sell->reference_no,
                    'type' => 'Sale',
                    'location' => optional($sell->store)->name ?? '-',
                    'payment_status' => $sell->payment_status,
                    'debit' => $sell->net_total,
                    'credit' => 0,
                    'payment_method' => '-',
                    'others' => "Invoice: $sell->invoice_no"
                ]);

                // Add payment entries
                foreach ($sell->payments as $payment) {
                    $transactions->push([
                        'date' => $payment->paid_on,
                        'reference_no' => $payment->transaction_reference ?? '-',
                        'type' => 'Payment',
                        'location' => optional($sell->store)->name ?? '-',
                        'payment_status' => $payment->payment_status,
                        'debit' => 0,
                        'credit' => $payment->amount,
                        'payment_method' => $payment->payment_method,
                        'others' => $payment->payment_note ?? ''
                    ]);
                }
            }

            // Sort transactions by date
            $transactions = $transactions->sortBy('date');

            // Calculate summary
            $summary = [
                'period' => $startDate->format('Y-m-d') . ' - ' . $endDate->format('Y-m-d'),
                'total_invoice' => $transactions->where('type', 'Sale')->sum('debit') +
                    $transactions->where('type', 'POS Sale')->sum('debit'),
                'total_paid' => $transactions->sum('credit'),
            ];

            // Calculate overall summary (all time)
            $overallQuery = Sell::where('customer_id', $id);


            // Apply store filter to overall totals if specific store is selected
            if ($request->store_id !== 'all') {
                $overallQuery->where('store_id', $request->store_id);
                // $posQuery->where('store_id', $request->store_id);
            }

            $overallSells = $overallQuery->sum('net_total');
            // $overallPosTotal = $posQuery->sum('total');

            // Get sell IDs for payments calculation
            $sellIds = $overallQuery->pluck('id');
            $overallPayments = SellPayment::whereIn('sell_id', $sellIds)->sum('amount');

            $summary['overall_invoice'] = $overallSells;
            $summary['overall_paid'] = $overallPayments;
            $summary['balance_due'] = $summary['overall_invoice'] - $summary['overall_paid'];

            // Get customer details
            $customer = Contact::findOrFail($id);

            $stores = Store::whereStatus(1)->select('id', 'name')->get();

            return response()->json([
                'customer' => [
                    'id' => $customer->id,
                    'name' => $customer->name,
                    'district' => $customer->district,
                    'thana' => $customer->thana,
                    'post_office' => $customer->post_office,
                    'village' => $customer->village,
                    'phone' => $customer->phone,
                    'business_name' => $customer->business_name ?? '-'
                ],
                'transactions' => $transactions->values(),
                'summary' => $summary,
                'stores' => $stores
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => true,
                'message' => $e->getMessage()
            ], 500);
        }
    }

    public function pay($id)
    {
        try {
            $customer = Contact::findOrFail($id);

            // Calculate total sale (net total of all sells)
            $totalSale = $customer->sells()->sum('net_total');

            // Calculate total paid amount
            $totalPaid = $customer->payments()->sum('amount');

            // Calculate total due
            $totalDue = $totalSale - $totalPaid;

            return response()->json([
                'success' => true,
                'customer_name' => $customer->name,
                'total_sale' => $totalSale,
                'total_paid' => $totalPaid,
                'total_due' => $totalDue,
                'opening_balance' => $customer->opening_balance ?? 0,
                'customer_id' => $customer->id,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error fetching customer payment details',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function store(Request $request, $id)
    {
        try {
            // Validate request
            $validated = $request->validate([
                'amount' => 'required|numeric|min:0.01',
                'payment_method' => 'required|in:cash,card,bank_transfer,cheque',
                'paid_on' => 'required|date',
                'payment_account' => 'nullable|exists:payment_accounts,id',
                'payment_note' => 'nullable|string|max:500'
            ]);

            DB::beginTransaction();

            // Get customer
            $customer = Contact::findOrFail($id);

            // Amount to be allocated
            $remainingAmount = $validated['amount'];

            // Create payment record for customer
            $customerPayment = CustomerPayment::create([
                'customer_id' => $customer->id,
                'amount' => $validated['amount'],
                'payment_method' => $validated['payment_method'],
                'paid_on' => $validated['paid_on'],
                'payment_note' => $validated['payment_note'] ?? null,
                'created_by' => auth()->id()
            ]);

            // Fetch sells with pending payment, ordered by sell date
            $pendingSells = Sell::where('customer_id', $customer->id)
                ->where('payment_due', '>', 0)
                ->orderBy('sell_date')
                ->get();

            // Prepare array to track sell payments
            $sellPayments = [];

            foreach ($pendingSells as $sell) {
                // If no remaining amount, break the loop
                if ($remainingAmount <= 0) {
                    break;
                }

                // Determine amount to allocate to this sell
                $allocatedAmount = min($remainingAmount, $sell->payment_due);

                // Create sell payment record
                $sellPayment = SellPayment::create([
                    'sell_id' => $sell->id,
                    'amount' => $allocatedAmount,
                    'paid_on' => $validated['paid_on'],
                    'payment_method' => $validated['payment_method'],
                    'payment_note' => $validated['payment_note'] ?? null,
                    'transaction_reference' => $customerPayment->id
                ]);

                // Update sell payment due
                $sell->payment_due -= $allocatedAmount;

                // Update payment status
                if ($sell->payment_due <= 0) {
                    $sell->payment_status = 'paid';
                } elseif ($sell->payment_due < $sell->net_total) {
                    $sell->payment_status = 'partial';
                }

                $sell->save();

                // Reduce remaining amount
                $remainingAmount -= $allocatedAmount;

                // Store sell payment for response
                $sellPayments[] = $sellPayment;
            }

            // Update customer balance
            $customer->update([
                'balance' => DB::raw('balance - ' . $validated['amount'])
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Payment recorded successfully',
                'data' => [
                    'customer_payment' => $customerPayment,
                    'sell_payments' => $sellPayments,
                    'new_customer_balance' => $customer->fresh()->balance,
                    'remaining_unallocated_amount' => max(0, $remainingAmount)
                ]
            ]);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Validation error',
                'errors' => $e->errors()
            ], 422);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Error recording payment',
                'error' => $e->getMessage()
            ], 500);
        }
    }


    public function downloadLedgerPdf($customerId, Request $request)
    {
        try {
            $ledgerResponse = $this->getLedger($request, $customerId);
            $ledgerData = $ledgerResponse->getData(true);

            // Extract required data
            $customer = $ledgerData['customer'];
            $transactions = $ledgerData['transactions'];
            $summary = $ledgerData['summary'];
            $dateRange = $summary['period'];


            //            return response()->json([
//                'success' => true,
//                'ledger_data' => $ledgerData,
//                'transactions' => $transactions,
//                'summary' => $summary,
//                'date_range' => $dateRange
//
//            ]);


            // Generate PDF
            $pdf = PDF::loadView('admin.contacts.pdfs.customer_ledger', [
                'customer' => $customer,
                'transactions' => $transactions,
                'summary' => $summary,
                'dateRange' => $dateRange
            ])->setPaper('a4');

            $filename = "{$customer['name']}_ledger_" . now()->format('Ymd') . '.pdf';

            // Return PDF with proper headers
            return $pdf->download($filename);
        } catch (\Exception $e) {
            Log::error('Ledger PDF Download Error: ' . $e->getMessage());
            return back()->with('error', 'Unable to generate PDF: ' . $e->getMessage());
        }
    }

}
