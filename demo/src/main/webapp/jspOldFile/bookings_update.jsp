<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 9/17/2024
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <title>Update the booking</title>
    <style>
        .inline-80 {
            display: inline-block;
            width: 80px;
        }
    </style>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
<div id="contact" style="height: 30px; text-align: right; padding: 10px 10px 10px 0">
    <span style="color: white">Contact us: 0123.456789 | abc.@gamil.com </span>
</div>

<table style="width: 100%; padding: 15px 100px;">
    <tbody>
    <tr>
        <td width="30%" style="font-size: 50px; font-family: Forte; display: grid">
            <span style="color: rgb(66,139,202)">Welcome!!!</span>
        </td>

        <td style="font-size: 20px; text-align: right">
            <br>
            <a href="/index.jsp" class="slidebar">Home</a>
            <a href="/contacts" class="slidebar">Contact</a>
            <a href="/child" class="slidebar">Child</a>
            <a href="/contactchild" class="slidebar">Contact-Child</a>
            <a href="/bookings" class="slidebar">Booking</a>
            <a href="/signs" class="slidebar">Sign</a>
        </td>
    </tr>
    </tbody>
</table>
<div class="container" id="new-entry">
    <h3>Update the booking</h3>

    <form action="/bookings/bookings_update" method="post">
        <input type="text" value="${booking.id}" name="id" hidden="hidden"/>

        <div class="form-group">
            <label class="inline-80">Child id: </label> &nbsp;
            <input type="text" value="${booking.child_id}" name="child_id" placeholder="Child_id" />
        </div>
        <br>

        <%
            //create a room array and put it into a request-scop
            Integer[] roomList = {1,2,3,4,5};
            request.setAttribute("roomList", roomList);
        %>

        <div class="form-group">
            <label class="inline-80" for="rooms">Room: </label> &nbsp;
            <select id="rooms" name="room">
                <c:forEach var="room" items="${roomList}">
                    <option value="${room}"
                        ${room == booking.room ? 'selected="selected"':""}>${room}</option>
                </c:forEach>
            </select>
        </div>
        <br>

        <div class="form-group">
            <label class="inline-80">Booked date: </label> &nbsp;
            <input type="date" value="${booking.booked_date}" name="booked_date" />
        </div>
        <br>

        <div>
            <label class="inline-80" for="booked_time_from">Booked time from:</label>
            <input id="booked_time_from" type="time" name="booked_time_from">
        </div>
        <br>

        <div>
            <label class="inline-80" for="booked_time_to">Booked time to:</label>
            <input id="booked_time_to" type="time" name="booked_time_to">
        </div>
        <br>

        <div class="form-group">
            <input id="btn-add-role" type="submit" value="Update" class="btn btn-primary" />
        </div>
    </form>
</div>
</body>
</html>


