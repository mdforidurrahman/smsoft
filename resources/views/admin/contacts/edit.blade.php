{{-- Edit Modal --}}
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Edit Contacts</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editForm">
                    @csrf
                    @method('PUT')

                    <input type="hidden" id="editId" name="id">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="editContact_id" class="form-label">Contact Id</label>
                                <input type="text" class="form-control" id="editContact_id" name="contact_id" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="editName" class="form-label">Name</label>
                                <input type="text" class="form-control" id="editName" name="name" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="editFatherName" class="form-label">Father Name</label>
                                <input type="text" class="form-control" id="editFatherName" name="name" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="role" class="form-label">Role </label>
                                <select name="role" class="form-control " id="editRole">
                                    <option value="customer">Customer</option>
                                    <option value="supplier">Supplier</option>
                                </select>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <label for="editStore_id" class="form-label">Store*</label>
                            <div class="input-group">
                                <select name="store_id" class="form-select" id="editStore_id" required>
                                    <option value="">Please Select</option>
                                    @forelse($storeName as $key => $data)
                                        <option value="{{$data->id}}">{{$data->name}}</option>
                                    @empty
                                    @endforelse
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="nid" class="form-label">Nid</label>
                                <input type="text" class="form-control" id="editNid" name="nid" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="editPhone" class="form-label">Phone</label>

                                <input type="text" class="form-control" id="editPhone" name="phone" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="editDistrict" class="form-label">District</label>
                                <input type="text" class="form-control" id="editDistrict" name="district" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="editThana" class="form-label">Thana</label>
                                <input type="text" class="form-control" id="editThana" name="thana" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="editPostOffice" class="form-label">Post Office</label>
                                <input type="text" class="form-control" id="editPostOffice" name="post_office" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="mb-3">
                                <label for="editVillage" class="form-label">Village</label>
                                <input type="text" class="form-control" id="editVillage" name="village" required>
                            </div>
                        </div>
                        <div class="col-md-6">

                            <div class="mb-3">
                                <label for="status" class="form-label">Status</label>
                                <select class="form-select" id="status" name="status" required>
                                    <option value="0">Inactive</option>
                                    <option value="1">Active</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="updateStore()">Update Store</button>
            </div>
        </div>
    </div>
</div>


<script>
    function openEditModal(editUrl) {
        showLoader();
        console.log('Opening edit modal with URL:', editUrl);

        $.ajax({
            url: editUrl,
            method: 'GET',
            success: function (response) {
                console.log('Received response:', response);

                if (response && typeof response === 'object') {
                    $('#editId').val(response.id);
                    $('#editContact_id').val(response.contact_id);
                    $('#editStore_id').val(response.store_id);
                    $('#editName').val(response.name);
                    $('#editFatherName').val(response.father_name);
                    $('#editRole').val(response.role);
                    $('#editPhone').val(response.phone);
                    $('#editNid').val(response.nid);
                    $('#editDistrict').val(response.district);
                    $('#editThana').val(response.thana);
                    $('#editPostOffice').val(response.post_office);
                    $('#editVillage').val(response.village);
                    $('#editStatus').val(response.status);

                    $('#editModal').modal('show');
                } else {
                    console.error('Invalid response format:', response);
                    alert('Received invalid data from the server.');
                }

                hideLoader();
            },
            error: function (xhr, status, error) {
                console.error('Error fetching contact data:', {
                    status: status,
                    error: error,
                    responseText: xhr.responseText
                });
                hideLoader();
                alert('Error fetching contact data. Please check the console for more information.');
            }
        });
    }

    // Update Function
    function updateStore() {
        showLoader();
        const contactId = $('#editId').val();
        const updateUrl = `/admin/contacts/${contactId}`;

        console.log('Update URL:', updateUrl);
        console.log('Form data:', $('#editForm').serialize());

        $.ajax({
            url: updateUrl,
            method: 'POST', // Use POST, not PUT
            data: $('#editForm').serialize(),
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            success: function (response) {
                console.log('Update successful:', response);
                $('#editModal').modal('hide');
                hideLoader();
                location.reload();
            },
            error: function (xhr, status, error) {
                console.error('Error updating contact:', {
                    status: status,
                    error: error,
                    responseText: xhr.responseText,
                    xhr: xhr
                });
                hideLoader();
                if (xhr.responseJSON && xhr.responseJSON.errors) {
                    let errorMessage = 'Validation errors:\n';
                    for (let field in xhr.responseJSON.errors) {
                        errorMessage += `${field}: ${xhr.responseJSON.errors[field].join(', ')}\n`;
                    }
                    alert(errorMessage);
                } else {
                    alert('Error updating contact. Please check the console for more information.');
                }
            }
        });
    }
</script>