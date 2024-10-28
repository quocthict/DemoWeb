

function confirmDelete(contactId) {
    const confirmDiv = document.getElementById('deleteContactModal');
    const deleteButton = document.getElementById('deleteButton');
    // console.log(contactId);
    // console.log(confirmDiv);
    // console.log(deleteButton);

    deleteButton.onclick = function() {
        window.location.href = 'contacts/contacts_delete?id=' + contactId;
    };
    confirmDiv.style.display = 'block';
}

function showAddContactForm() {
    document.getElementById('addContactModal').style.display = 'block';
}

function showEditContactForm(contactId, firstName, lastName, relationship) {
    // console.log(contactId);
    // console.log(firstName);
    // console.log(lastName);
    // console.log(relationship);
    document.getElementById('editContactId').value = contactId;
    document.getElementById('editFirstName').value = firstName;
    document.getElementById('editLastName').value = lastName;
    document.getElementById('editRelationship').value = relationship;
    document.getElementById('editContactModal').style.display = 'block';
    document.getElementById('addContactModal').style.display = 'none'; // Ẩn form thêm
}
