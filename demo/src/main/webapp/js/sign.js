

function confirmDelete(id) {
    const confirmDiv = document.getElementById('deleteSignModal');
    const deleteButton = document.getElementById('deleteButton');
    // console.log(contactId);
    // console.log(confirmDiv);
    // console.log(deleteButton);

    deleteButton.onclick = function() {
        window.location.href = '/signs/signs_delete?id=' + id;
    };
    confirmDiv.style.display = 'block';
}

function showAddSignForm() {
    document.getElementById('addSignModal').style.display = 'block';
}

function showEditSignForm(id, bookingId, contactId, type, signTime, signature) {
    console.log(id, bookingId, contactId, type, signTime, signature);
    document.getElementById('editId').value = id;
    document.getElementById('editBookingId').value = bookingId;
    document.getElementById('editContactId').value = contactId;
    document.getElementById('editType').value = type;
    document.getElementById('editSignTime').value = signTime;
    document.getElementById('editSignature').value = signature;
    document.getElementById('editSignModal').style.display = 'block';
    document.getElementById('addSignModal').style.display = 'none'; // Ẩn form thêm
}