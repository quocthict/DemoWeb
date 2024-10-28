<%@ page import="com.demo.model.StyleType" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 9/20/2024
  Time: 11:16 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign add</title>
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
    <h3>Create a new booking</h3>
    <!-- action: to a corresponding controller /child/child_add ~ ChildAdd.java-->
    <form action="/signs/signs_add" method="post">

        <div class="form-group">
            <label class="inline-80">Booking ID: </label> &nbsp;
            <input id="booking_id" type="text" name="booking_id" placeholder="booking_id" />
        </div>
        <br>

        <div class="form-group">
            <label class="inline-80">Contact ID: </label> &nbsp;
            <input id="contact_id" type="text" name="contact_id" placeholder="contact_id" />
        </div>
        <br>

        <div class="form-group">
            <label for="types" class="inline-80">Type: </label> &nbsp;
            <select id="types" name="type">
                <c:forEach var="type" items="${typeList}">
                    <option value="${type.numberType}">
                            ${type.stringType}
                    </option>
                </c:forEach>
            </select>
        </div>
        <br>

        <div>
            <label class="inline-80" for="sign_time">Sing time: </label>
            <input id="sign_time" type="time" name="sign_time">
        </div>
        <br>

        <div class="form-group">
            <input id="btn-add-role" type="submit" value="Create" class="btn btn-primary" />
        </div>
    </form>
</div>
</body>
</html>
