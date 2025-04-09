@extends('layouts.admin')
@section('title', 'Purchase List')

@push('style')
    @include('import.css.datatable')
@endpush

@section('content')
    <x-breadcumb title="Purchase List"/>
    <div class="table-responsive">


        <div class="dashboard-card">
            <div class="card-header-section">
                <div class="table-title-section">
                    <div class="table-icon">
                        <i class="fas fa-project-diagram"></i>
                    </div>
                    <h5 class="table-title">Purchase Overview</h5>
                </div>
                <div class="header-actions">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#purchaseModal">
                        Add New Purchase
                    </button>

                </div>
            </div>
            <div class="table-responsive">
                <table id="example2" class="table table-hover">
                    <thead>
                    <tr>

                        <th>SL</th>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th>Purchase Date</th>
                        <th>Refrence No</th>
                         <!-- <th>Pay Term</th>
                        <th>Pay Type</th>   -->
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

@endsection

@push('script')
    @include('import.js.datatable')
    <script>
        loadTable();

        // Example usage:
        function loadTable() {
            const columnConfig = [
                {
                    data: 'DT_RowIndex',
                    name: 'DT_RowIndex',
                    orderable: false,
                    searchable: false
                },
                {
                    data: 'products',
                    name: 'products'
                }, {
                    data: 'quantity',
                    name: 'quantity'
                },


                {
                    data: 'purchase_date',
                    name: 'purchase_date'
                },
                {
                    data: 'reference_no',
                    name: 'reference_no'
                },
                // {
                //     data: 'payment_term',
                //     name: 'payment_term'
                // },
                // {
                //     data: 'payment_term_type',
                //     name: 'payment_term_type'
                // },
                {
                    data: 'purchase_status',
                    name: 'purchase_status'
                },
                {
                    data: 'action',
                    name: 'action',
                    orderable: false,
                    searchable: false
                }
            ];

            initDataTable(
                '#example2',
                '{{ route($role . 'purchase.index') }}',
                columnConfig
            );
        }
    </script>
    @include('admin.purchase.create', [$supplier, $products])
    @include('admin.purchase.return-purchase', [$supplier, $products])

    @include('admin.purchase.edit')

    <script>
        $('.select2').select2();
    </script>
@endpush
