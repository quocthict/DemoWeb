<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 9/17/2024
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <title>Update contact</title>
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
    <h3>Update Child</h3>
    <div> &nbsp; </div>
    <form action="/child/child_update" method="post">

        <input type="text" value="${child.id}" name="id" placeholder="First name" hidden="hidden"/>

        <div class="form-group">
            <label class="inline-80">First name: </label> &nbsp;
            <input type="text" value="${child.first_name}" name="first_name" placeholder="First name" />
        </div>

        <div class="form-group">
            <label class="inline-80">Last name: </label> &nbsp;
            <input type="text" value="${child.last_name}" name="last_name" placeholder="Last name" />
        </div>

        <div class="form-group">
            <label class="inline-80">Gender:</label> &nbsp;
            <input id="male" type="radio" name="gender" value="1" ${child.gender == 1 ? "checked" : ""}/>Male
            <input id="female" type="radio" name="gender" value="0" ${child.gender == 0 ? "checked" : ""} />Female
        </div>

        <div class="form-group">
            <label class="inline-80">Birth date: </label> &nbsp;
            <input type="date" value="${child.birth_date}" name="birth_date" placeholder="Birth date" />
        </div>

        <input type="text" value="${child.created_date}" name="created_date" placeholder="Created date" hidden="hidden"/>
        <input type="text" value="${child.modified_date}" name="modified_date" placeholder="Modified name" hidden="hidden"/>

        <div class="form-group">
            <input id="btn-add-role" type="submit" value="Update" class="btn btn-primary" />
        </div>
    </form>
</div>
</body>
</html>


