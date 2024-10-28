
function confirmDelete(id) {
    const confirmDiv = document.getElementById('deleteChildModal');
    const deleteButton = document.getElementById('deleteButton');
    // console.log(contactId);
    // console.log(confirmDiv);
    // console.log(deleteButton);

    deleteButton.onclick = function() {
    window.location.href = '/child/child_delete?id=' + id;
};
    confirmDiv.style.display = 'block';
}

function showAddChildForm() {
    document.getElementById('addChildModal').style.display = 'block';
}

function showEditChildForm(id, firstName, lastName, gender, birthDate, createdDate, modifiedDate) {
    console.log(id, firstName, lastName, gender, birthDate, createdDate, modifiedDate);
    // console.log(firstName);
    // console.log(lastName);
    // console.log(relationship);
    document.getElementById('editChildId').value = id;
    document.getElementById('editFirstName').value = firstName;
    document.getElementById('editLastName').value = lastName;
    document.getElementById('editGender').value = gender;
    document.getElementById('editBirthDate').value = birthDate;
    document.getElementById('editCreatedDate').value = createdDate;
    document.getElementById('editModifiedDate').value = modifiedDate;

    document.getElementById('editChildModal').style.display = 'block';
    document.getElementById('addChildModal').style.display = 'none'; // Ẩn form thêm
}
