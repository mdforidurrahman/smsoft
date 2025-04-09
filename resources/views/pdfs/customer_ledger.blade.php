<!DOCTYPE html>
<html>
<head>
    <title>Customer Ledger - {{ $customer->name }}</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap');

        body {
            font-family: 'Inter', sans-serif;
            color: #333;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .header {
            background: #4338ca;
            color: white;
            padding: 15px;
            border-radius: 12px 12px 0 0;
            text-align: center;
            margin-bottom: 20px;
        }

        .header h1 {
            margin: 0;
            font-size: 1.5rem;
        }

        .customer-info {
            background: #f3f4f6;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .summary-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .summary-card {
            background: white;
            border-radius: 8px;
            padding: 15px;
            width: 48%;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .summary-value {
            color: #4338ca;
            font-weight: 600;
            font-size: 1.1rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            border: 1px solid #e5e7eb;
            padding: 10px;
            text-align: left;
        }

        th {
            background: #4338ca;
            color: white;
            font-weight: 500;
        }

        tr:nth-child(even) {
            background-color: #f9fafb;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Customer Ledger</h1>
    </div>

    <div class="customer-info">
        <h3>Customer Details</h3>
        <p><strong>Name:</strong> {{ $customer->name }}</p>
        <p><strong>Business Name:</strong> {{ $customer->business_name ?? 'N/A' }}</p>
        <p><strong>Phone:</strong> {{ $customer->phone ?? 'N/A' }}</p>
        <p><strong>Date Range:</strong> {{ $dateRange }}</p>
    </div>

    <div class="summary-section">
        <div class="summary-card">
            <h4>Period Summary</h4>
            <p>Total Invoice: <span class="summary-value">{{ number_format($summary['total_invoice'], 2) }}</span></p>
            <p>Total Paid: <span class="summary-value">{{ number_format($summary['total_paid'], 2) }}</span></p>
        </div>
        <div class="summary-card">
            <h4>Overall Summary</h4>
            <p>Balance Due: <span class="summary-value">{{ number_format($summary['balance_due'], 2) }}</span></p>
            <p>Total Transactions: {{ count($transactions) }}</p>
        </div>
    </div>

    <table>
        <thead>
        <tr>
            <th>Date</th>
            <th>Reference No</th>
            <th>Type</th>
            <th>Location</th>
            <th>Payment Status</th>
            <th>Debit</th>
            <th>Credit</th>
            <th>Payment Method</th>
        </tr>
        </thead>
        <tbody>
        @forelse($transactions as $transaction)
            <tr>
                <td>{{ \Carbon\Carbon::parse($transaction->date)->format('m/d/Y H:i') }}</td>
                <td>{{ $transaction->reference_no ?? 'N/A' }}</td>
                <td>{{ $transaction->type ?? 'N/A' }}</td>
                <td>{{ $transaction->location ?? 'N/A' }}</td>
                <td>{{ $transaction->payment_status ?? 'N/A' }}</td>
                <td>${{ number_format($transaction->debit ?? 0, 2) }}</td>
                <td>${{ number_format($transaction->credit ?? 0, 2) }}</td>
                <td>{{ $transaction->payment_method ?? 'N/A' }}</td>
            </tr>
        @empty
            <tr>
                <td colspan="8" style="text-align: center;">No transactions found</td>
            </tr>
        @endforelse
        </tbody>
    </table>
</div>
</body>
</html>