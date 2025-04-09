<style>
    .modal-content {
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    }

    .modal-header {
        background: #4f46e5;
        color: white;
        border-radius: 12px 12px 0 0;
        padding: 1rem 1.5rem;
    }

    .payment-summary {
        background: #f8fafc;
        border-radius: 8px;
        padding: 1.5rem;
        margin-bottom: 1.5rem;
    }

    .payment-summary .row {
        margin-bottom: 0.5rem;
    }

    .amount-label {
        font-weight: 600;
        color: #1e293b;
    }

    .amount-value {
        font-size: 1.1rem;
        color: #4f46e5;
        font-weight: 600;
    }

    .zero-amount {
        color: #22c55e;
    }

    .due-amount {
        color: #ef4444;
    }

    .form-group {
        margin-bottom: 1.5rem;
    }

    .form-label {
        font-weight: 500;
        margin-bottom: 0.5rem;
        color: #1e293b;
    }

    .form-control {
        border-radius: 6px;
        border: 1px solid #e2e8f0;
        padding: 0.625rem;
    }

    .form-control:focus {
        border-color: #4f46e5;
        box-shadow: 0 0 0 2px rgba(79, 70, 229, 0.1);
    }

    .btn-save {
        background: #4f46e5;
        color: white;
        border: none;
        padding: 0.625rem 1.5rem;
        border-radius: 6px;
        font-weight: 500;
    }

    .btn-save:hover {
        background: #4338ca;
    }

    .btn-close {
        background: rgb(255, 255, 255);
        color: white;
        border: none;
        padding: 0.625rem 1.5rem;
        border-radius: 6px;
        font-weight: 500;
    }

    .required-field::after {
        content: "*";
        color: #ef4444;
        margin-left: 4px;
    }

    .file-upload {
        border: 2px dashed #e2e8f0;
        border-radius: 6px;
        padding: 1rem;
        text-align: center;
        cursor: pointer;
    }

    .file-upload:hover {
        border-color: #4f46e5;
    }

    .file-info {
        font-size: 0.875rem;
        color: #64748b;
        margin-top: 0.5rem;
    }
</style>


<div class="modal fade" id="addPaymentModal" tabindex="-1" aria-labelledby="addPaymentModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addPaymentModalLabel">Add Payment</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="paymentForm" method="POST" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" id="customerId" name="customer_id">

                    <!-- Customer Details -->
                    <div class="payment-summary">
                        <div class="row">
                            <div class="col-md-6">
                                <p class="mb-2">
                                    <span class="amount-label">Customer name:</span><br>
                                    <span id="customerName"></span>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <p class="mb-2">
                                    <span class="amount-label">Total Sale:</span><br>
                                    <span class="amount-value" id="totalSale"></span>
                                </p>
                            </div>
                            <div class="col-md-6">
                                <p class="mb-2">
                                    <span class="amount-label">Total Paid:</span><br>
                                    <span class="amount-value" id="totalPaid"></span>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <p class="mb-2">
                                    <span class="amount-label">Total Due:</span><br>
                                    <span class="amount-value due-amount" id="totalDue"></span>
                                </p>
                            </div>
                            <div class="col-md-6">
                                <p class="mb-2">
                                    <span class="amount-label">Opening Balance:</span><br>
                                    <span class="amount-value" id="openingBalance"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Payment Form -->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label required-field">Payment Method</label>
                                <select class="form-control" name="payment_method" required>
                                    <option value="">Select Method</option>
                                    <option value="cash">Cash</option>
                                    <option value="card">Card</option>
                                    <option value="bank_transfer">Bank Transfer</option>
                                    <option value="cheque">Cheque</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label required-field">Paid on</label>
                                <input type="datetime-local" class="form-control" name="paid_on" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label required-field">Amount</label>
                        <input type="number" class="form-control" name="amount" step="0.01" required>
                    </div>

                    <div class="form-group mb-0">
                        <label class="form-label">Payment Note</label>
                        <textarea class="form-control" name="payment_note" rows="3"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-close" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-save" onclick="submitPayment()">Save</button>
            </div>
        </div>
    </div>
</div>

<script>
    function openPaymentModal(customerId) {
        // Reset form
        $('#paymentForm')[0].reset();
        $('#customerId').val(customerId);

        // Show modal
        $('#addPaymentModal').modal('show');

        // Load customer payment details
        loadCustomerPaymentDetails(customerId);
    }

    function loadCustomerPaymentDetails(customerId) {
        $.ajax({
            url: `/customer/ledger/${customerId}/pay`,
            method: 'GET',
            success: function (response) {
                updatePaymentModalDetails(response);
            },
            error: function (xhr) {
                console.error('Error loading payment details:', xhr);
                alert('Error loading customer payment details');
            }
        });
    }

    function updatePaymentModalDetails(response) {
        console.log(response); // Log the entire response for debugging

        if (response.success) {
            $('#customerName').text(response.customer_name || '');
            $('#totalSale').text(formatCurrency(response.total_sale));
            $('#totalPaid').text(formatCurrency(response.total_paid));
            $('#totalDue').text(formatCurrency(response.total_due));
            $('#openingBalance').text(formatCurrency(response.opening_balance));

            // Set max amount in payment input
            $('input[name="amount"]').attr('max', response.total_due);
        } else {
            console.error('Error loading payment details:', response.message);
            alert('Error loading customer payment details');
        }
    }
    function formatCurrency(amount) {
        return new Intl.NumberFormat('en-US', {
            style: 'currency',
            currency: 'USD'
        }).format(amount || 0);
    }

    function submitPayment() {
        const form = $('#paymentForm')[0];
        const formData = new FormData(form);
        const customerId = $('#customerId').val();

        $.ajax({
            url: `/customer/ledger/${customerId}/pay`,
            method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                $('#addPaymentModal').modal('hide');
                // Reload ledger data if needed
                if (typeof loadLedgerData === 'function') {
                    loadLedgerData(`/customer/ledger/${customerId}`);
                }

                AjaxNotifications.success('Payment added successfully');
            },
            error: function(xhr) {
                let response = xhr.responseText;
                try {
                    response = JSON.parse(response);
                } catch (e) {
                    response = {
                        message: 'An error occurred'
                    };
                }

                if (xhr.status === 422) {
                    let errorMessages = [];
                    for (let field in response.errors) {
                        errorMessages = errorMessages.concat(response.errors[field]);
                    }
                    AjaxNotifications.error(errorMessages.join('<br>'));
                } else {
                    AjaxNotifications.error(response.message || 'An error occurred');
                }
                console.error('Error creating purchase:', response);
            }
        });
    }

    // File upload handling
    $('#documentUpload').change(function (e) {
        const fileName = e.target.files[0]?.name || 'No file chosen';
        $(this).siblings('label').text(fileName);
    });
</script>
