{{--<!-- Invoice Details Content for Modal -->--}}

{{--<div class="container">--}}
{{--    <!-- Header Section -->--}}
{{--    <div class="row">--}}
{{--        <div class="col-6">--}}
{{--            <h3>From</h3>--}}
{{--            <p><strong>{{ $sell->store->name }}</strong></p>--}}
{{--            <p>{{ $sell->store->address }}</p>--}}
{{--        </div>--}}
{{--        <div class="col-6 text-end">--}}
{{--            <h3>Bill to</h3>--}}
{{--            <p>{{ $sell->contact->name }}</strong></p>--}}
{{--            <p>{{ $sell->contact->email }}</p>--}}
{{--            <p>{{ $sell->contact->phone }}</p>--}}
{{--            <p>{{ $sell->contact->address }}</p>--}}
{{--        </div>--}}
{{--    </div>--}}

{{--    <!-- Invoice Details -->--}}
{{--    <div class="row mt-4">--}}
{{--        <div class="col-6">--}}
{{--            <p><strong>Invoice No:</strong> {{ $sell->invoice_no }}</p>--}}
{{--            <p><strong>Invoice Date:</strong> {{ $sell->sell_date }}</p>--}}
{{--        </div>--}}
{{--    </div>--}}

{{--    <!-- Table Section -->--}}
{{--    <table class="table table-bordered mt-4">--}}
{{--        <thead class="table-light">--}}
{{--        <tr>--}}
{{--            <th>Description</th>--}}
{{--            <th>Amount</th>--}}
{{--            <th>Tax</th>--}}
{{--            <th>Total</th>--}}
{{--        </tr>--}}
{{--        </thead>--}}
{{--        <tbody>--}}
{{--        <tr>--}}
{{--            <td>${{ $sell->total_amount }}</td>--}}
{{--            <td>Included</td>--}}
{{--            <td>${{ $sell->paid_amount }}</td>--}}
{{--        </tr>--}}
{{--        </tbody>--}}
{{--    </table>--}}

{{--    <!-- Payment Details -->--}}
{{--    <div class="row mt-4">--}}
{{--        <div class="col-6">--}}
{{--            <h6>Payment Method:</h6>--}}
{{--            <p>{{ $sell->payment_method }}</p>--}}
{{--        </div>--}}
{{--        <div class="col-6 text-end">--}}
{{--            <h6>Balance Due:</h6>--}}
{{--            <p><strong>${{ number_format($sell->paid_amount - $sell->total_amount, 2) }}</strong></p>--}}
{{--        </div>--}}
{{--    </div>--}}

{{--    <!-- Notes -->--}}
{{--    <div class="row mt-4">--}}
{{--        <div class="col-12">--}}
{{--            <h6>Notes:</h6>--}}
{{--            <p>{{ $sell->note ?? 'No additional notes provided.' }}</p>--}}
{{--        </div>--}}
{{--    </div>--}}
{{--</div>--}}


<style>
    .invoice-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 30px;
        font-family: Arial, sans-serif;
    }

    .invoice-header {
        border-bottom: 2px solid #eee;
        padding-bottom: 20px;
        margin-bottom: 30px;
    }

    .company-details {
        float: left;
        width: 50%;
    }

    .invoice-details {
        float: right;
        width: 50%;
        text-align: right;
    }

    .clear {
        clear: both;
    }

    .customer-details {
        margin: 20px 0;
        padding: 20px 0;
        border-bottom: 1px solid #eee;
    }

    .billing-details {
        float: left;
        width: 50%;
    }

    .shipping-details {
        float: right;
        width: 50%;
    }

    .invoice-items {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }

    .invoice-items th {
        background: #f8f9fa;
        padding: 12px;
        text-align: left;
        border-bottom: 2px solid #dee2e6;
    }

    .invoice-items td {
        padding: 12px;
        border-bottom: 1px solid #dee2e6;
    }

    .totals {
        width: 300px;
        float: right;
        margin: 20px 0;
    }

    .totals table {
        width: 100%;
    }

    .totals td {
        padding: 8px;
    }

    .totals .final-total {
        font-weight: bold;
        font-size: 1.2em;
        border-top: 2px solid #dee2e6;
    }

    .payment-info {
        margin-top: 40px;
        padding-top: 20px;
        border-top: 1px solid #eee;
    }
</style>

<div class="invoice-container">
    <!-- Invoice Header -->
    <div class="invoice-header">
        <div class="company-details">
            <h2>{{ $sell->store->name }}</h2>
            <p>{{ $sell->store->address }}</p>
        </div>
        <div class="invoice-details">
            <h1>INVOICE</h1>
            <p><strong>Invoice No:</strong> {{ $sell->invoice_no }}</p>
            <p><strong>Date:</strong> {{ date('d M Y', strtotime($sell->sell_date)) }}</p>
            <p><strong>Reference:</strong> {{ $sell->reference_no }}</p>
        </div>
        <div class="clear"></div>
    </div>

    <!-- Customer Details -->
    <div class="customer-details">
        <div class="billing-details">
            <h3>Bill To:</h3>
            <p><strong>{{ $sell->contact->name }}</strong></p>
            <p>{{ $sell->contact->address }}</p>
            <p>Phone: {{ $sell->contact->phone }}</p>
            <p>Customer ID: {{ $sell->contact->contact_id }}</p>
        </div>
        <div class="shipping-details">
            <h3>Ship To:</h3>
            <p>{{ $sell->shipping_detail->shipping_address ?? '' }}</p>
            <p><strong>Shipping
                    Method:</strong> {{ ucfirst(str_replace('_', ' ', $sell->shipping_detail->shipping_method ?? '')) }}</p>
            <p><strong>Expected
                    Delivery:</strong> {{ date('d M Y', strtotime($sell->shipping_detail->expected_delivery_date ?? '')) }}
            </p>
            <p><strong>Tracking Number:</strong> {{ $sell->shipping_detail->tracking_number ?? '' }}</p>
        </div>
        <div class="clear"></div>
    </div>

    <!-- Invoice Items -->
    <table class="invoice-items">
        <thead>
        <tr>
            <th>Item Description</th>
            <th>Quantity</th>
            <th>Unit Price</th>
            <th>Tax</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody>
        @foreach($sell->items as $item)
            <tr>
                <td>
                    {{ $item->product->name ?? '' }}
                    <br>
                    <small>SKU: {{ $item->product->sku ?? ''}}</small>
                </td>
                <td>{{ $item->quantity }}</td>
                <td>${{ number_format($item->unit_cost_before_tax, 2) }}</td>
                <td>${{ number_format($item->tax_amount, 2) }}</td>
                <td>${{ number_format($item->net_cost, 2) }}</td>
            </tr>
        @endforeach
        </tbody>
    </table>

    <!-- Totals -->
    <div class="totals">
        <table>
            <tr>
                <td>Subtotal:</td>
                <td>${{ $sell->total_before_tax ?? '' }}</td>
            </tr>
            <tr>
                <td>Tax Amount:</td>
                <td>${{ $sell->tax_amount ?? ''}}</td>
            </tr>
            <tr>
                <td>Shipping:</td>
                <td>${{ $sell->shipping_detail->shipping_cost  ?? '' }}</td>
            </tr>
            <tr>
                <td>Discount:</td>
                <td>${{ number_format($sell->discount_amount, 2) }}</td>
            </tr>
            <tr class="final-total">
                <td>Total Due:</td>
                <td>${{ number_format($sell->payment_due, 2) }}</td>
            </tr>
        </table>
    </div>
    <div class="clear"></div>

    <!-- Payment Information -->
    <div class="payment-info">
        <h3>Payment Information</h3>
        <p><strong>Payment Status:</strong> {{ ucfirst($sell->payment_status  ?? '') }}</p>
        <p><strong>Payment Terms:</strong> {{ $sell->payment_term }} {{ $sell->payment_term_type ?? '' }}</p>
        <p><strong>Advance Balance:</strong> ${{ number_format($sell->advance_balance, 2) }}</p>
    </div>
</div>
