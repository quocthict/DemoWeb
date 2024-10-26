
// Lắng nghe sự kiện mở modal cho Edit
document.addEventListener('DOMContentLoaded', function() {
    const links = document.querySelectorAll('a[data-toggle="modal"]');

    links.forEach(link => {
        link.addEventListener('click', function(event) {
            const url = new URL(link.getAttribute('href'), window.location.origin);
            const id = url.searchParams.get('id');

            // if (link.innerText === "Edit") {
            //     loadEmployeeData(id);
            // } else if (link.innerText === "Delete") {
            //     document.getElementById('deleteEmployeeId').value = id;
            //     document.getElementById('deleteEmployeeModal').style.display = 'block';
            // }

            if (link.innerText === "&#xE254;") {
                loadEmployeeData(id);
            } else if (link.innerText === "&#xE872;") {
                document.getElementById('deleteEmployeeId').value = id;
                document.getElementById('deleteEmployeeModal').style.display = 'block';
            }
        });
    });
});

// Hàm tải thông tin nhân viên
function loadEmployeeData(id) {
    // Giả định dữ liệu nhân viên
    const employee = { id: id, name: `Employee ${id}` };
    document.getElementById('employeeId').value = employee.id;
    document.getElementById('employeeName').value = employee.name;

    // Hiển thị modal
    const modal = document.getElementById('editEmployeeModal');
    modal.style.display = 'block';
}

// Xử lý xác nhận xóa
document.getElementById('confirmDeleteButton').onclick = function() {
    const id = document.getElementById('deleteEmployeeId').value;
    deleteEmployee(id); // Giả định hàm để xóa nhân viên
    const modal = document.getElementById('deleteEmployeeModal');
    modal.style.display = 'none'; // Đóng modal sau khi xóa
};

// Đóng modal khi nhấn vào nút đóng
document.querySelectorAll('.close').forEach(closeButton => {
    closeButton.onclick = function() {
        const modal = this.closest('.modal');
        modal.style.display = 'none';
    };
});

function deleteEmployee(id) {
    // Xử lý xóa nhân viên (gọi API hoặc cập nhật mảng)
    console.log(`Deleted employee with ID: ${id}`);
}