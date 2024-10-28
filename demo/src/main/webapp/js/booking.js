

function confirmDelete(id) {
    const confirmDiv = document.getElementById('deleteBookingModal');
    const deleteButton = document.getElementById('deleteButton');
    // console.log(contactId);
    // console.log(confirmDiv);
    // console.log(deleteButton);

    deleteButton.onclick = function() {
        window.location.href = '/bookings/bookings_delete?id=' + id;
    };
    confirmDiv.style.display = 'block';
}

function showAddBookingForm() {
    document.getElementById('addBookingModal').style.display = 'block';
}

function showEditBookingForm(id, childId, room, bookedDate, bookedTimeFrom, bookedTimeTo) {
    console.log(id, childId, room, bookedDate, bookedTimeFrom, bookedTimeTo);
    // console.log(child);
    // console.log(lastName);
    // console.log(relationship);
    document.getElementById('editBookingId').value = id;
    document.getElementById('editChildId').value = childId;

    document.getElementById('editRoom').value = room;

    // const defaultRoom = room;
    // const selected = document.getElementById('rooms');
    // selected.value = defaultRoom;

    document.getElementById('editBookedDate').value = bookedDate;
    document.getElementById('editBookedTimeFrom').value = bookedTimeFrom;
    document.getElementById('editBookedTimeTo').value = bookedTimeTo;
    document.getElementById('editBookingModal').style.display = 'block';
    document.getElementById('addBookingModal').style.display = 'none'; // Ẩn form thêm
}