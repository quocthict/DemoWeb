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

<%--    <script src="js/contact.js"></script>--%>

    <script>
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
                        <li class="breadcrumb-item"><a href="#">Booking management</a></li>
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

                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6 p-0 flex justify-content-lg-start justify-content-center">
                                    <h2 class="ml-lg-2">Manage Bookings</h2>
                                </div>
                                <div class="col-sm-6 p-0 flex justify-content-lg-end justify-content-center">
                                    <a href="#addBookingModal" onclick="showAddBookingForm();" class="btn btn-success" data-toggle="modal">
                                        <i class="material-icons">&#xE147;</i>
                                        <span>Add New Contacts</span>
                                    </a>
                                    <a href="#deleteBookingModal" class="btn btn-danger" data-toggle="modal">
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
                                <th>Child ID</th>
                                <th>Room</th>
                                <th>Booked date</th>
                                <th>Book time from</th>
                                <th>Book time to</th>
                                <th>Created date</th>
                                <th>Modified date</th>
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
                                    <td>${x.getChild_id()}</td>
                                    <td>${x.getRoom()}</td>
                                    <td>${x.getBooked_date()}</td>
                                    <td>${x.getBooked_time_from()}</td>
                                    <td>${x.getBooked_time_to()}</td>
                                    <td>${x.getCreated_date()}</td>
                                    <td>${x.getModified_date()}</td>
                                    <th>
                                        <a href="#editBookingModal" onclick="showEditBookingForm(${x.getId()},'${x.getChild_id()}','${x.getRoom()}','${x.getBooked_date()}','${x.getBooked_time_from()}','${x.getBooked_time_to()}'); return false;" class="edit" data-toggle="modal">
                                            <i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i>
                                        </a>
<%--                                        <a href="#deleteEmployeeModal" class="delete" data-toggle="modal">--%>
                                        <a href="#deleteBookingModal" onclick="confirmDelete(${x.getId()}); return false;"  class="delete" data-toggle="modal">
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
                <div class="modal fade" tabindex="-1" id="addBookingModal" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Bookings</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="/bookings/bookings_add" method="post">
                                <div class="modal-body">
                                    <%--child-id--%>
                                    <div class="form-group">
                                        <label>Child Id</label>
                                        <input id="child_id" name="child_id" type="text" class="form-control" required>
                                    </div>

                                    <%--room--%>
                                    <%
                                        //create a room array and put it into a request-scop
                                        String[] roomList = { "1","2", "3", "4", "5"};
                                        request.setAttribute("roomList", roomList);
                                    %>
                                    <div class="form-group">
                                        <label>Room</label>
                                        <select id="rooms" name="room" class="form-control">
                                            <c:forEach var="room" items="${roomList}">
                                                <option value="${room}">${room}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <%--Booked date --%>
                                    <div class="form-group">
                                        <label>Booked date</label>
                                        <input id="booked_date" name="booked_date" type="date" class="form-control" required>
                                    </div>

                                    <%--Booked time from --%>
                                    <div class="form-group">
                                        <label>Booked time from</label>
                                        <input id="booked_time_from" name="booked_time_from" type="time" class="form-control" required>
                                    </div>

                                    <%--Booked time to --%>
                                    <div class="form-group">
                                        <label>Booked time to</label>
                                        <input id="booked_time_to" name="booked_time_to" type="time" class="form-control" required>
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
                <div class="modal fade" tabindex="-1" id="editBookingModal" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Bookings</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <form action="/bookings/bookings_update" method="post">
                                <div class="modal-body">

                                    <%--Booking_id--%>
                                    <input id="editBookingId" name="id" type="text" class="form-control" hidden="hidden">

                                    <%--Child id--%>
                                    <div class="form-group">
                                        <label>Child id</label>
                                        <input id="editChildId" name="child_id" type="text" class="form-control" required>
                                    </div>

                                    <%--Child id--%>
                                    <div class="form-group">
                                        <label>Room</label>
                                        <input id="editRoom" name="room" type="text" class="form-control" required>
                                    </div>

<%--                                    &lt;%&ndash;Room&ndash;%&gt;--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label>Room</label>--%>

<%--                                        <%--%>
<%--                                            //create a room array and put it into a request-scop--%>
<%--                                            Integer[] roomListUpdate = {1,2,3,4,5};--%>
<%--                                            request.setAttribute("roomListUpdate", roomListUpdate);--%>
<%--                                        %>--%>

<%--                                        <select id="rooms" name="room">--%>
<%--                                            <c:forEach var="room" items="${roomListUpdate}">--%>
<%--                                                <option value="${room}">${room}</option>--%>
<%--                                            </c:forEach>--%>
<%--                                        </select>--%>

<%--                                    </div>--%>

                                    <%--Booked date--%>
                                    <div class="form-group">
                                        <label>Booked date</label>
                                        <input id="editBookedDate" name="booked_date" type="date" class="form-control" required>
                                    </div>

                                    <%--Booked time from--%>
                                    <div class="form-group">
                                        <label>Booked time from</label>
                                        <input id="editBookedTimeFrom" name="booked_time_from" type="time" class="form-control" required>
                                    </div>

                                    <%--Booked time to--%>
                                    <div class="form-group">
                                        <label>Booked time to</label>
                                        <input id="editBookedTimeTo" name="booked_time_to" type="time" class="form-control" required>
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
                <div class="modal fade" tabindex="-1" id="deleteBookingModal" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Delete Bookings</h5>
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

