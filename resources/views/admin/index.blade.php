@extends('layouts.admin')

@section('title', 'Dashboard')

@push('style')
    <link href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2-bootstrap-5-theme@1.3.0/dist/select2-bootstrap-5-theme.min.css"
        rel="stylesheet">

    <style>
        .filter-dropdown {
            position: relative;
            display: inline-block;
        }

        .filter-menu {
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 1000;
            display: none;
            min-width: 200px;
            background: white;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .filter-menu.show {
            display: block;
        }

        .filter-item {
            padding: 8px 15px;
            cursor: pointer;
        }

        .filter-item:hover {
            background-color: #f8f9fa;
        }

        .select2-container {
            min-width: 200px;
        }
    </style>
@endpush

@section('content')
    <div class="mb-4 d-flex justify-content-between align-items-center">
        <h4 class="mb-0">Dashboard Overview</h4>

        <div class="row g-5 justify-between justify-content-between justify-items-center">
            <div class="col-md-6 ml-3">
                <div class="filter-dropdown">
                    <select id="storeSelect" class="select2">
                        <option value="">All Stores</option>
                        @foreach ($stores as $store)
                            <option value="{{ $store->id }}">{{ $store->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="col-md-6">
                <div class="filter-dropdown">
                    <button class="btn btn-primary" id="filterBtn">
                        <i class="bx bx-calendar"></i>
                        Filter by date
                    </button>
                    <div class="filter-menu" id="filterMenu">
                        <div class="filter-item" data-range="today">Today</div>
                        <div class="filter-item" data-range="yesterday">Yesterday</div>
                        <div class="filter-item" data-range="last_7_days">Last 7 Days</div>
                        <div class="filter-item" data-range="last_30_days">Last 30 Days</div>
                        <div class="filter-item" data-range="this_month">This Month</div>
                        <div class="filter-item" data-range="last_month">Last Month</div>
                        <div class="filter-item" data-range="this_year">This Year</div>
                        <div class="filter-item" data-range="last_year">Last Year</div>
                        <div class="filter-item" data-range="custom">Custom Range</div>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <div id="dashboardContent">
        <div class="row row-cols-1 row-cols-md-2 row-cols-xl-4">
            @foreach ($data as $item)
                <div class="col">
                    <div class="card radius-10 {{ $item['color'] }}">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <h5 class="mb-0 text-white">{{ $item['count'] }}</h5>
                                <div class="ms-auto">
                                    <i class='bx {{ $item['icon'] }} fs-3 text-white'></i>
                                </div>
                            </div>
                            <div class="progress my-3 bg-light-transparent" style="height:3px;">
                                <div class="progress-bar bg-white" role="progressbar" style="width: 55%" aria-valuenow="25"
                                    aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="d-flex align-items-center text-white">
                                <p class="mb-0">{{ $item['title'] }}</p>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection

@push('script')
    <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <script>
        $(document).ready(function() {
            const filterBtn = $('#filterBtn');
            const filterMenu = $('#filterMenu');
            let dateRangePicker = null;
            let currentDateRange = 'today';

            $('#storeSelect').select2({
                theme: 'bootstrap-5',
                placeholder: 'Select a store',
                allowClear: true,
                width: '100%'
            });

            $('#storeSelect').on('change', function() {
                const storeId = $(this).val();
                updateDashboard(currentDateRange, null, null, storeId);
            });

            filterBtn.on('click', function(e) {
                e.stopPropagation();
                filterMenu.toggleClass('show');
            });

            $(document).on('click', function(e) {
                if (!filterMenu.is(e.target) && !filterBtn.is(e.target) && filterMenu.has(e.target)
                    .length === 0) {
                    filterMenu.removeClass('show');
                }
            });

            $('.filter-item').on('click', function() {
                const range = $(this).data('range');
                currentDateRange = range;

                if (range === 'custom') {
                    if (!dateRangePicker) {
                        dateRangePicker = $('<input type="text" style="display:none;">').daterangepicker({
                            opens: 'left',
                            maxDate: moment(),
                            locale: {
                                format: 'YYYY-MM-DD'
                            }
                        });

                        dateRangePicker.on('apply.daterangepicker', function(ev, picker) {
                            const storeId = $('#storeSelect').val();
                            updateDashboard('custom',
                                picker.startDate.format('YYYY-MM-DD'),
                                picker.endDate.format('YYYY-MM-DD'),
                                storeId
                            );
                        });
                    }
                    dateRangePicker.trigger('click');
                } else {
                    const storeId = $('#storeSelect').val();
                    updateDashboard(range, null, null, storeId);
                }

                filterMenu.removeClass('show');
            });

            function updateDashboard(range, startDate = null, endDate = null, storeId = null) {
                // Show loading state
                $('#dashboardContent').addClass('opacity-50');

                $.ajax({
                    url: '{{ route($role . 'dashboard') }}',
                    method: 'GET',
                    data: {
                        date_range: range,
                        start_date: startDate,
                        end_date: endDate,
                        store_id: storeId
                    },
                    success: function(response) {
                        updateDashboardContent(response.data);
                        updateFilterButtonText(range, startDate, endDate);
                        // Remove loading state
                        $('#dashboardContent').removeClass('opacity-50');
                    },
                    error: function(xhr, status, error) {
                        console.error('Error updating dashboard:', error);
                        alert('Error updating dashboard. Please try again.');
                        // Remove loading state
                        $('#dashboardContent').removeClass('opacity-50');
                    }
                });
            }

            function updateDashboardContent(data) {
                let html = '<div class="row row-cols-1 row-cols-md-2 row-cols-xl-4">';

                data.forEach(item => {
                    html += `
                <div class="col">
                    <div class="card radius-10 ${item.color}">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <h5 class="mb-0 text-white">${item.count}</h5>
                                <div class="ms-auto">
                                    <i class='bx ${item.icon} fs-3 text-white'></i>
                                </div>
                            </div>
                            <div class="progress my-3 bg-light-transparent" style="height:3px;">
                                <div class="progress-bar bg-white" role="progressbar" style="width: 55%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="d-flex align-items-center text-white">
                                <p class="mb-0">${item.title}</p>
                            </div>
                        </div>
                    </div>
                </div>
            `;
                });

                html += '</div>';
                $('#dashboardContent').html(html);
            }

            function updateFilterButtonText(range, startDate = null, endDate = null) {
                let buttonText = 'Filter by date';

                switch (range) {
                    case 'today':
                        buttonText = 'Today';
                        break;
                    case 'yesterday':
                        buttonText = 'Yesterday';
                        break;
                    case 'last_7_days':
                        buttonText = 'Last 7 Days';
                        break;
                    case 'last_30_days':
                        buttonText = 'Last 30 Days';
                        break;
                    case 'this_month':
                        buttonText = 'This Month';
                        break;
                    case 'last_month':
                        buttonText = 'Last Month';
                        break;
                    case 'this_year':
                        buttonText = 'This Year';
                        break;
                    case 'last_year':
                        buttonText = 'Last Year';
                        break;
                    case 'custom':
                        buttonText = `${startDate} - ${endDate}`;
                        break;
                }

                filterBtn.html(`<i class="bx bx-calendar"></i> ${buttonText}`);
            }

            updateDashboard('today');
        });
    </script>
@endpush
