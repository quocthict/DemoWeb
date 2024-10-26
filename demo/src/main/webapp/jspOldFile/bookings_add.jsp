<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 9/20/2024
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c-rt" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Booking add</title>
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

    <%
        //create a room array and put it into a request-scop
        String[] roomList = { "1","2", "3", "4", "5"};
        request.setAttribute("roomList", roomList);
    %>

<div class="container" id="new-entry">
    <h3>Create a new booking</h3>
    <!-- action: to a corresponding controller /child/child_add ~ ChildAdd.java-->
    <form action="/bookings/bookings_add" method="post">

        <div class="form-group">
            <label class="inline-80">Child ID: </label> &nbsp;
            <input id="child_id" type="text" name="child_id" placeholder="Child_id" />
        </div>
        <br>

        <div class="form-group">
            <label class="inline-80" for="rooms">Room: </label> &nbsp;
            <select id="rooms" name="room">
                <c:forEach var="room" items="${roomList}">
                    <option value="${room}">${room}</option>
                </c:forEach>
            </select>
        </div>
        <br>


        <c:forEach var="category" items="${categoryList}">
            <option value="${category.id}"
                ${category.id == product.categoryId ? 'selected="selected"' : ''}>
                    ${category.name}
            </option>
        </c:forEach>

        <div>
            <label class="inline-80" for="booked_date">Booked date:</label>
            <input id="booked_date" type="date" name="booked_date">
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
            <input id="btn-add-role" type="submit" value="Create" class="btn btn-primary" />
        </div>
    </form>
</div>
</body>
</html>
