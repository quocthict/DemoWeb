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

  <title>Sign</title>

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
  <h4>List of signs</h4>
  <table class="table table-striped">
    <thead>
    <tr>
      <th>Id</th>
      <th>Booking ID</th>
      <th>Contact ID</th>
      <th>Type</th>
      <th>Sign time</th>
      <th>Signature</th>
      <th>Created date</th>
      <th>Modified date</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="x">
      <tr>
        <td>${x.getId()}</td>
        <td>${x.getBooking_id()}</td>
        <td>${x.getContact_id()}</td>

        <c:choose>
          <c:when test="${x.getType()==1}">
            <td>Sign_in</td>
          </c:when>
          <c:otherwise>
            <td>Sign_out</td>
          </c:otherwise>
        </c:choose>

        <td>${x.getSign_time()}</td>
        <td>${x.getSignature()}</td>
        <td>${x.getCreated_date()}</td>
        <td>${x.getModified_date()}</td>
        <td>
          <a href="/signs/signs_update?id=${x.getId()}" class="btn btn-default">Edit</a> &nbsp;
          <a href="/signs/signs_delete?id=${x.getId()}" class="btn btn-default">Delete</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<div>
  <a href="/signs/signs_add" class="btn btn-default">Create</a>
</div>
</body>
</html>
