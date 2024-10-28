<%@ page import="com.demo.repository.ContactsRepository" %>
<%@ page import="com.demo.model.Contact" %>
<%@ page import="java.util.List" %>
<!doctype html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <title>Contact Management</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!----css3---->
    <link rel="stylesheet" href="css/custom.css">


    <!--google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">


    <!--google material icon-->
    <link href="https://fonts.googleapis.com/css2?family=Material+Icons" rel="stylesheet">



    <script>
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
    </script>
</head>

<body>

<!-------complete html----------->
<div class="wrapper">
    <div class="body-overlay"></div>

    <!-------sidebar--design------------>
    <div id="sidebar">
        <div class="sidebar-header">
            <h3><img src="img/logo.png" class="img-fluid"/><span>vishweb design</span></h3>
        </div>
        <ul class="list-unstyled component m-0">
            <li class="active">
                <a href="/index.jsp" class="dashboard"><i class="material-icons">dashboard</i>Home </a>
            </li>

            <!-- Move the table at the top -->
            <li class="dropdown">
                <a href="#homeSubmenu6" data-toggle="collapse" aria-expanded="false"
                   class="dropdown-toggle">
                    <i class="material-icons">grid_on</i>Database
                </a>
                <!--<ul class="collapse list-unstyled menu" id="homeSubmenu6">-->
                <ul id="homeSubmenu6">
                    <li><a href="/contacts">- Contact Management</a></li>
                    <li><a href="/child">- Child Management</a></li>
                    <li><a href="/bookings">- Booking Management</a></li>
                    <li><a href="/signs">- Sign Management</a></li>
                    <li><a href="/contactchild">- Contact-Child Management</a></li>
                    <li><a href="#">- Other Management</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <a href="#homeSubmenu1" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="material-icons">aspect_ratio</i>Layouts
                </a>
                <ul class="collapse list-unstyled menu" id="homeSubmenu1">
                    <li><a href="#">layout 1</a></li>
                    <li><a href="#">layout 2</a></li>
                    <li><a href="#">layout 3</a></li>
                </ul>
            </li>


            <li class="dropdown">
                <a href="#homeSubmenu2" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="material-icons">apps</i>widgets
                </a>
                <ul class="collapse list-unstyled menu" id="homeSubmenu2">
                    <li><a href="#">Apps 1</a></li>
                    <li><a href="#">Apps 2</a></li>
                    <li><a href="#">Apps 3</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <a href="#homeSubmenu3" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="material-icons">equalizer</i>charts
                </a>
                <ul class="collapse list-unstyled menu" id="homeSubmenu3">
                    <li><a href="#">Pages 1</a></li>
                    <li><a href="#">Pages 2</a></li>
                    <li><a href="#">Pages 3</a></li>
                </ul>
            </li>


            <li class="dropdown">
                <a href="#homeSubmenu4" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="material-icons">extension</i>UI Element
                </a>
                <ul class="collapse list-unstyled menu" id="homeSubmenu4">
                    <li><a href="#">Pages 1</a></li>
                    <li><a href="#">Pages 2</a></li>
                    <li><a href="#">Pages 3</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <a href="#homeSubmenu5" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="material-icons">border_color</i>forms
                </a>
                <ul class="collapse list-unstyled menu" id="homeSubmenu5">
                    <li><a href="#">Pages 1</a></li>
                    <li><a href="#">Pages 2</a></li>
                    <li><a href="#">Pages 3</a></li>
                </ul>
            </li>

            <li class="dropdown">
                <a href="#homeSubmenu7" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">
                    <i class="material-icons">content_copy</i>Pages
                </a>
                <ul class="collapse list-unstyled menu" id="homeSubmenu7">
                    <li><a href="#">Pages 1</a></li>
                    <li><a href="#">Pages 2</a></li>
                    <li><a href="#">Pages 3</a></li>
                </ul>
            </li>


            <li class="">
                <a href="#" class=""><i class="material-icons">date_range</i>copy </a>
            </li>

            <li class="">
                <a href="#" class=""><i class="material-icons">library_books</i>calender </a>
            </li>
        </ul>
    </div>
    <!-------sidebar--design- close----------->


    <!-------page-content start----------->
    <div id="content">

        <!------top-navbar-start----------->
        <div class="top-navbar">
            <div class="xd-topbar">
                <div class="row">
                    <div class="col-2 col-md-1 col-lg-1 order-2 order-md-1 align-self-center">
                        <div class="xp-menubar">
                            <span class="material-icons text-white">signal_cellular_alt</span>
                        </div>
                    </div>

                    <div class="col-md-5 col-lg-3 order-3 order-md-2">
                        <div class="xp-searchbar">
                            <form>
                                <div class="input-group">
                                    <input type="search" class="form-control" placeholder="Search">
                                    <div class="input-group-append">
                                        <button class="btn" type="submit" id="button-addon2">Go
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>


                    <div class="col-10 col-md-6 col-lg-8 order-1 order-md-3">
                        <div class="xp-profilebar text-right">
                            <nav class="navbar p-0">
                                <ul class="nav navbar-nav flex-row ml-auto">
                                    <li class="dropdown nav-item active">
                                        <a class="nav-link" href="#" data-toggle="dropdown">
                                            <span class="material-icons">notifications</span>
                                            <span class="notification">4</span>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a href="#">You Have 4 New Messages</a></li>
                                            <li><a href="#">You Have 4 New Messages</a></li>
                                            <li><a href="#">You Have 4 New Messages</a></li>
                                            <li><a href="#">You Have 4 New Messages</a></li>
                                        </ul>
                                    </li>

                                    <li class="nav-item">
                                        <a class="nav-link" href="#">
                                            <span class="material-icons">question_answer</span>
                                        </a>
                                    </li>

                                    <li class="dropdown nav-item">
                                        <a class="nav-link" href="#" data-toggle="dropdown">
                                            <img src="img/user.jpg" style="width:40px; border-radius:50%;"/>
                                            <span class="xp-user-live"></span>
                                        </a>
                                        <ul class="dropdown-menu small-menu">
                                            <li>
                                                <a href="#">
                                                    <span class="material-icons">person_outline</span>Profile
                                                </a>
                                            </li>
                                            <li><a href="#">
                                                <span class="material-icons">settings</span>
                                                Settings
                                            </a></li>
                                            <li><a href="#">
                                                <span class="material-icons">logout</span>
                                                Logout
                                            </a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                </div>

                <div class="xp-breadcrumbbar text-center">
                    <h4 class="page-title">Welcome</h4>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Data management</a></li>
                        <li class="breadcrumb-item active" aria-curent="page">Dashboard</li>
                    </ol>
                </div>
            </div>
        </div>
        <!------top-navbar-end----------->


        <!------main-content-start----------->
        <div class="main-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-wrapper">

                        <%--start of table--%>
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
                                    <h2 class="ml-lg-2">Manage Children</h2>
                                </div>
                                <div class="col-sm-6 p-0 flex justify-content-lg-end justify-content-center">
                                    <a href="#addChildModal" onclick="showAddChildForm();" class="btn btn-success" data-toggle="modal">
                                        <i class="material-icons">&#xE147;</i>
                                        <span>Add New Child</span>
                                    </a>
                                    <a href="#deleteChildModal" class="btn btn-danger" data-toggle="modal">
                                        <i class="material-icons">&#xE15C;</i>
                                        <span>Delete</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <table class="table table-striped table-hover">
                            <%--Table header--%>
                            <thead>
                            <tr>
                                <th><span class="custom-checkbox">
                                    <input type="checkbox" id="selectAll">
                                    <label for="selectAll"></label>
                                </span></th>
                                <th>Id</th>
                                <th>First name</th>
                                <th>Last name</th>
                                <th>Gender</th>
                                <th>Birth date</th>
                                <th>Created date</th>
                                <th>Modified</th>
                            </tr>
                            </thead>

                            <tbody>
                            <%--Show list of items--%>
                            <c:forEach items="${list}" var="x">
                                <tr>
                                    <th>
                                    <span class="custom-checkbox">
                                    <input type="checkbox" id="checkbox1" name="option[]" value="1">
                                        <label for="checkbox1"></label></span>
                                    </th>
                                    <td>${x.getId()}</td>
                                    <td>${x.getFirst_name()}</td>
                                    <td>${x.getLast_name()}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test = "${x.getGender() == 1}">
                                                Male
                                            </c:when>
                                            <c:when test = "${x.getGender() == 0}">
                                                Female
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${x.getBirth_date()}</td>
                                    <td>${x.getCreated_date()}</td>
                                    <td>${x.getModified_date()}</td>
                                    <th>
                                        <a href="#editChildModal" onclick="showEditChildForm(${x.getId()},'${x.getFirst_name()}','${x.getLast_name()}','${x.getGender()}','${x.getBirth_date()}','${x.getCreated_date()}','${x.getModified_date()}'); return false;" class="edit" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                        </a>

                                        <a href="#deleteChildModal" onclick="confirmDelete(${x.getId()}); return false;"  class="delete" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i>
                                        </a>
                                    </th>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <%--Show list of page--%>
                        <div class="clearfix">
                            <div class="hint-text">showing <b>10</b> out of <b>25</b></div>
                            <ul class="pagination">
                                <li class="page-item disabled"><a href="#">Previous</a></li>
                                <li class="page-item active"><a href="#" class="page-link">1</a></li>
                                <li class="page-item "><a href="#" class="page-link">2</a></li>
                                <li class="page-item "><a href="#" class="page-link">3</a></li>
                                <li class="page-item "><a href="#" class="page-link">4</a></li>
                                <li class="page-item "><a href="#" class="page-link">5</a></li>
                                <li class="page-item "><a href="#" class="page-link">Next</a></li>
                            </ul>
                        </div>
                    </div>
                </div>


                <!----add-modal start--------->
                <div class="modal fade" tabindex="-1" id="addChildModal" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Child</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="/child/child_add" method="post">
                                <div class="modal-body">

                                    <div class="form-group">
                                        <label>First name</label>
                                        <input id="first_name" name="first_name" type="text" class="form-control" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Last name</label>
                                        <input id="last_name" name="last_name" type="text" class="form-control" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Gender</label> &nbsp;
                                        <input id="male" type="radio" name="gender" value="1" checked/>Male
                                        <input id="female" type="radio" name="gender" value="0" />Female
                                    </div>

                                    <div class="form-group">
                                        <label>Birth date</label>
                                        <input id="birth_date" name="birth_date" type="date" class="form-control" required>
                                    </div>

                                    <%
                                        //create a room array and put it into a request-scop
                                        ContactsRepository contactsRepository = new ContactsRepository();
                                        List<Contact> contactList = contactsRepository.getAllContact();
                                        request.setAttribute("contactList", contactList);
                                    %>
                                    <div class="form-group">
                                        <label>Contact Id</label> &nbsp;
                                        <select id="contacts" name="contact_id" class="form-control">
                                            <c:forEach var="contact" items="${contactList}">
                                                <option value="${contact.id}">${contact.first_name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-success">Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!----add-modal end--------->


                <!----edit-modal start--------->
                <div class="modal fade" tabindex="-1" id="editChildModal" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Child</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <form action="/child/child_update" method="post">
                                <div class="modal-body">
                                    <div class="form-group">
                                        <input id="editChildId" name="id" type="text" class="form-control" hidden="hidden">
                                    </div>
                                    <div class="form-group">
                                        <label>First name</label>
                                        <input id="editFirstName" name="first_name" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Last name</label>
                                        <input id="editLastName" name="last_name" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <input id="editGender" name="gender" type="text" class="form-control" required>
                                    </div>
                                    <div class="form-group">
                                        <label>Birth date</label>
                                        <input id="editBirthDate" name="birth_date" type="date" class="form-control" required>
                                    </div>
                                    <div class="form-group">
<%--                                        <label>Created date</label>--%>
                                        <input id="editCreatedDate" name="created_date" type="text" class="form-control" hidden="hidden">
                                    </div>
                                    <div class="form-group">
<%--                                        <label>Modified date</label>--%>
                                        <input id="editModifiedDate" name="modified_date" type="text" class="form-control" hidden="hidden">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-success">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!----edit-modal end--------->


                <!----delete-modal start OK--------->
                <div class="modal fade" tabindex="-1" id="deleteChildModal" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Delete Employees</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to delete this Records</p>
                                <p class="text-warning"><small>this action Cannot be Undone,</small></p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button id="deleteButton" type="button" class="btn btn-success">Delete</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!----delete-modal end--------->

            </div>
        </div>
        <!------main-content-end----------->


        <!----footer-design------------->
        <footer class="footer">
            <div class="container-fluid">
                <div class="footer-in">
                    <p class="mb-0">&copy 2021 Vishweb Design . All Rights Reserved.</p>
                </div>
            </div>
        </footer>

    </div>
</div>
<!-------complete html----------->


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $(".xp-menubar").on('click', function () {
            $("#sidebar").toggleClass('active');
            $("#content").toggleClass('active');
        });

        $('.xp-menubar,.body-overlay').on('click', function () {
            $("#sidebar,.body-overlay").toggleClass('show-nav');
        });
    });
</script>




</body>
</html>


