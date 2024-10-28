<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 9/19/2024
  Time: 9:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<html>
<head>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

  <title>Booking</title>

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


<div class="container" id="listing">
  <h4>List of bookings</h4>
  <table class="table table-striped">
    <thead>
    <tr>
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
    <c:forEach items="${listBookings}" var="x">
      <tr>
        <td>${x.getId()}</td>
        <td>${x.getChild_id()}</td>
        <td>${x.getRoom()}</td>
        <td>${x.getBooked_date()}</td>
        <td>${x.getBooked_time_from()}</td>
        <td>${x.getBooked_time_to()}</td>
        <td>${x.getCreated_date()}</td>
        <td>${x.getModified_date()}</td>
        <td>
          <a href="/bookings/bookings_update?id=${x.getId()}" class="btn btn-default">Edit</a> &nbsp;
          <a href="/bookings/bookings_delete?id=${x.getId()}" class="btn btn-default">Delete</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<div>
  <a href="bookings_add.jsp" class="btn btn-default">Create</a>
</div>
</body>
</html>
