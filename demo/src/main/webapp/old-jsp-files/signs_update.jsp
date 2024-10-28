<%@ page import="com.demo.model.StyleType" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
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

    <title>Update the sign</title>
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
    <h3>Update the sign</h3>

    <form action="/signs/signs_update" method="post">
        <input type="text" value="${sign.id}" name="id" hidden="hidden"/>

        <div class="form-group">
            <label class="inline-80">Booking id: </label> &nbsp;
            <input type="text" value="${sign.booking_id}" name="booking_id" />
        </div>
        <br>

        <div class="form-group">
            <label class="inline-80">Contact id: </label> &nbsp;
            <input type="text" value="${sign.contact_id}" name="contact_id" />
        </div>
        <br>

        <%
            List<StyleType> list = new ArrayList<>();
            list.add(new StyleType(1,"Sign in"));
            list.add(new StyleType(0, "Sign out"));
            request.setAttribute("typeList",list);
        %>

        <div class="form-group">
            <label class="inline-80" for="types">Room: </label> &nbsp;
            <select id="types" name="type">
                <c:forEach var="type" items="${typeList}">
                    <option value="${type.numberType}"
                        ${type.numberType == sign.type ? 'selected="selected"':""}>${type.stringType}</option>
                </c:forEach>
            </select>
        </div>
        <br>

        <div>
            <label class="inline-80" for="sign_time">Sign time:</label>
            <input id="sign_time" type="time" name="sign_time">
        </div>
        <br>

        <div class="form-group">
            <input id="btn-add-role" type="submit" value="Update" class="btn btn-primary" />
        </div>
    </form>
</div>
</body>
</html>


