<?php

namespace App\Http\Controllers;

use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use App\Models\Pos;
use App\Models\Sell;
use App\Models\Store;
use App\Models\Contact;
use App\Models\SellPayment;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Auth;

class ContactController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $projects = Contact::latest();
        if (Auth::User()->hasRole('admin')) {
            $storeName = Store::where('status', 1)->latest()->get();
        } else {
            $storeName = Auth::User()->stores;
        }
        if (request()->ajax()) {
            return DataTables::of($projects)
                ->addIndexColumn()
                ->editColumn('contact_id', function ($row) {
                    return $row->contact_id;
                })
                ->addColumn('father_name', function ($row) {  // Add this
                    return $row->father_name ?? 'N/A';       // Handle null values
                })

                ->addColumn('status', function ($row) {
                    return view('components.status-toggle', [
                        'id' => $row->id,
                        'model' => 'contact',
                        'status' => $row->status
                    ])->render();
                })
                ->addColumn('action', function ($row) {
                    return view('components.action-buttons', [
                        'id' => $row->id,
                        'model' => 'contact',
                        'editModal' => 'editStoreModal',
                        'editModalRoute' => 'contacts.edit',
                        'deleteRoute' => 'contacts.destroy',
                    ])->render();
                })
                ->rawColumns(['action', 'status'])
                ->make(true);
        }

        return view('admin.contacts.index', compact('storeName'));
    }


    public function customers()
    {
        $projects = Contact::whereRole('customer')->latest();

        if (Auth::User()->hasRole('admin')) {
            $storeName = Store::where('status', 1)->latest()->get();
        } else {
            $storeName = Auth::User()->stores;
        }

        if (request()->ajax()) {
            return DataTables::of($projects)
                ->addIndexColumn()
                ->editColumn('contact_id', function ($row) {
                    return $row->contact_id;
                })

                ->addColumn('father_name', function ($row) {  // Add this
                    return $row->father_name ?? 'N/A';       // Handle null values
                })

                ->addColumn('status', function ($row) {
                    return view('components.status-toggle', [
                        'id' => $row->id,
                        'model' => 'contact',
                        'status' => $row->status
                    ])->render();
                })
                ->addColumn('action', function ($row) {
                    return view('components.action-buttons', [
                        'id' => $row->id,
                        'model' => 'contact',
                        'ledgerModal' => 'viewLedgerModal',
                        'ledgerModalRoute' => 'customer.ledger',

                        'payLedgerModal' => 'payLedgerModal',
                        'payLedgerModalRoute' => 'customer.pay.debt',

                        'editModal' => 'editStoreModal',
                        'editModalRoute' => 'contacts.edit',
                        'deleteRoute' => 'contacts.destroy',
                    ])->render();
                })
                ->rawColumns(['action', 'status'])
                ->make(true);
        }

        return view('admin.contacts.customer-index', compact('storeName'));
    }

    public function downloadLedgerPdf($customerId)
    {
        try {
            // Fetch the same data as in the ledger view
            $customer = Contact::findOrFail($customerId);
            // Get date range and store from request
            $dateRange = request('date_range');
            $storeId = request('store_id', 'all');

            // Parse the date range
            $dates = explode(' - ', $dateRange);
            $startDate = Carbon::createFromFormat('m/d/Y', $dates[0])->startOfDay();
            $endDate = Carbon::createFromFormat('m/d/Y', $dates[1])->endOfDay();

            // Fetch transactions
            $query = Transaction::where('customer_id', $customerId)
                ->whereBetween('date', [$startDate, $endDate]);

            // Filter by store/location if specified
            if ($storeId !== 'all') {
                $query->where('store_id', $storeId);
            }

            // Order transactions by date
            $transactions = $query->orderBy('date', 'asc')->get();

            // Calculate summary
            $summary = [
                'total_invoice' => $transactions->sum('debit'),
                'total_paid' => $transactions->sum('credit'),
                'balance_due' => $transactions->sum('debit') - $transactions->sum('credit')
            ];

            // Generate PDF
            $pdf = PDF::loadView('admin.contacts.pdfs.customer_ledger', [
                'customer' => $customer,
                'transactions' => $transactions,
                'summary' => $summary,
                'dateRange' => $dateRange
            ])->setPaper('a4')->setOption('margin-top', 10);

            return $pdf->download($customer->name . '_ledger_' . now()->format('Ymd') . '.pdf');
        } catch (\Exception $e) {
            Log::error('PDF Download Error: ' . $e->getMessage());
            return back()->with('error', 'Unable to generate PDF. Please try again.');
        }
    }


    public function supplier()
    {
        $projects = Contact::whereRole('supplier')->latest();
        if (Auth::User()->hasRole('admin')) {
            $storeName = Store::where('status', 1)->latest()->get();
        } else {
            $storeName = Auth::User()->stores;
        }
        if (request()->ajax()) {
            return DataTables::of($projects)
                ->addIndexColumn()
                ->editColumn('contact_id', function ($row) {
                    return $row->contact_id;
                })

                ->addColumn('father_name', function ($row) {  // Add this
                    return $row->father_name ?? 'N/A';       // Handle null values
                })


                ->addColumn('status', function ($row) {
                    return view('components.status-toggle', [
                        'id' => $row->id,
                        'model' => 'contact',
                        'status' => $row->status
                    ])->render();
                })
                ->addColumn('action', function ($row) {
                    return view('components.action-buttons', [
                        'id' => $row->id,
                        'model' => 'contact',
                        'editModal' => 'editStoreModal',
                        'editModalRoute' => 'contacts.edit',
                        'deleteRoute' => 'contacts.destroy',
                    ])->render();
                })
                ->rawColumns(['action', 'status'])
                ->make(true);
        }

        return view('admin.contacts.supplier-index', compact('storeName'));
    }


    // ContactController.php







    public function getLedgerPay(Request $request, $id)
    {
        try {
            // Get regular sales
            $sells = Sell::with(['payments', 'store'])
                ->where('customer_id', $id)
                ->get();

            // Combine and format transactions for ledger
            $transactions = collect();

            // Add sells to transactions
            foreach ($sells as $sell) {
                // Add sale entry
                $transactions->push([
                    'date' => $sell->sell_date,
                    'type' => 'Sell',
                    'location' => optional($sell->store)->name ?? '-',
                    'payment_status' => $sell->payment_status,
                    'debit' => $sell->net_total,
                    'credit' => 0,
                    'payment_method' => '-',
                    'others' => "Invoice: {$sell->invoice_no}"
                ]);

                // Add payment entries
                foreach ($sell->payments as $payment) {
                    $transactions->push([
                        'date' => $payment->paid_on,
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
                'total_invoice' => $transactions->where('type', 'Sale')->sum('debit')->sum('debit'),
                'total_paid' => $transactions->sum('credit'),
            ];

            // Calculate overall summary (all time)
            $overallQuery = Sell::where('customer_id', $id);

            if ($request->store_id !== 'all') {
                $overallQuery->where('store_id', $request->store_id);
            }

            $overallSells = $overallQuery->sum('net_total');

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
                    'father_name' => $customer->father_name,
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



    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        try {
            $contact = Contact::create([
                'name' => $request->name,
                'father_name' => $request->father_name,
                'role' => $request->role,
                'phone' => $request->phone,
                'district' => $request->district,
                'thana' => $request->thana,
                'post_office' => $request->post_office,
                'village' => $request->village,
                'nid' => $request->nid,
                'store_id' => $request->store_id,
                'contact_id' => $request->contact_id ?? uuid_create('mb'),
                'created_by' => auth()->user()->id,
            ]);

            if ($request->ajax()) {
                return response()->json(['success' => true, 'message' => 'Contact created successfully']);
            }
            return response()->json(['message' => 'Contact created successfully', 'contact' => $contact], 201);
        } catch (\Exception $e) {
            flash()->error($e->getMessage());
            if ($request->ajax()) {
                return response()->json(['success' => false, 'message' => 'Something Went wrong: ' . $e->getMessage()], 500);
            }

            return response()->json(['error' => 'Something went wrong'], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Contact $contact)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $data = Contact::findOrFail($id);
        return response()->json($data);
    }


    public function update(Request $request, $id)
    {
        try {
            $validatedData = $request->validate([
                'name' => 'required|string|max:255',
                'father_name' => 'required|string|max:255',
                'district' => 'required|string',
                'thana' => 'required|string',
                'post_office' => 'required|string',
                'village' => 'required|string',
                'role' => 'required|string',
                'phone' => 'required|string',
                'nid' => 'required|string',
                'contact_id' => 'required|string',
                'store_id' => 'required|exists:stores,id',
                'status' => 'required|integer|in:0,1',
            ]);

            $data = Contact::findOrFail($id);
            $data->name = $validatedData['name'];
            $data->father_name = $validatedData['father_name'];
            $data->role = $validatedData['role'];
            $data->nid = $validatedData['nid'];
            $data->phone = $validatedData['phone'];
            $data->district = $validatedData['district'];
            $data->thana = $validatedData['thana'];
            $data->post_office = $validatedData['post_office'];
            $data->village = $validatedData['village'];
            $data->contact_id = $validatedData['contact_id'];
            $data->store_id = $validatedData['store_id'];
            $data->status = $validatedData['status'];
            $data->updated_by = Auth::id();


            $data->save();
            return response()->json(['message' => 'Contact updated successfully', 'contact' => $data]);
        } catch (\Exception $exception) {
            return response()->json(['message' => $exception->getMessage()], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     */

  
  public function storeImage(Request $request, $id)
{
    try {
        // Validate the uploaded image
        $request->validate([
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048', // adjust max size as needed
        ]);

        // Find the contact
        $contact = Contact::findOrFail($id);

        // Handle the image upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->getClientOriginalExtension();

            // Store the image in the 'public' disk (usually storage/app/public directory)
            $path = $image->storeAs('contacts/images', $imageName, 'public');

            // Optionally save the image path in the database
            $contact->image_path = $path;
            $contact->save();
        }

        return response()->json(['message' => 'Image uploaded successfully!', 'path' => $path]);

    } catch (\Exception $e) {
        return response()->json(['error' => 'Image upload failed: ' . $e->getMessage()], 500);
    }
}

  

    public function destroy(Request $request, $id)
    {
        try {
            Contact::findOrFail($id)->delete();
            $message = 'Contact deleted successfully';
            $type = 'success';
        } catch (\Exception $e) {
            $message = 'Error: ' . $e->getMessage();
            $type = 'error';
        }

        if ($request->ajax()) {
            return response()->json([
                'success' => $type === 'success',
                'message' => $message,
                'notification' => compact('type', 'message')
            ]);
        }

        return redirect()->back();
    }
}
