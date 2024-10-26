<%@ page import="com.demo.repository.ContactsRepository" %>
<%@ page import="com.demo.model.Contact" %>
<%@ page import="java.util.List" %><%--
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
    <title>Add a child</title>
    <link rel="stylesheet" href="./css/style.css">
</head>

<body>
    <%
        //create a room array and put it into a request-scop
        ContactsRepository contactsRepository = new ContactsRepository();
        List<Contact> contactList = contactsRepository.getAllContact();
        request.setAttribute("contactList", contactList);
    %>

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
        String[] months = { "January","February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
    %>

    <div class="container" id="new-entry">
        <h3>Create a new child</h3>
        <div> &nbsp; </div>

        <!-- action: to a corresponding controller /child/child_add ~ ChildAdd.java-->
        <form action="/child/child_add" method="post">
            <div class="form-group">
                <label class="inline-80">First name: </label> &nbsp;
                <input id="first_name" type="text" name="first_name" placeholder="First name" />
            </div>
            <br>

            <div class="form-group">
                <label class="inline-80">Last name: </label> &nbsp;
                <input id="last_name" type="text" name="last_name" placeholder="Last name" />
            </div>
            <br>

            <div class="form-group">
                <label class="inline-80">Gender:</label> &nbsp;
                <input id="male" type="radio" name="gender" value="1" checked/>Male
                <input id="female" type="radio" name="gender" value="0" />Female
            </div>
            <br>

            <div>
                <label class="inline-80" for="birth_date">Birth date:</label>
                <input id="birth_date" type="date" name="birth_date">
            </div>
            <br>

            <div class="form-group">
                <label class="inline-80" for="contacts">Room: </label> &nbsp;
                <select id="contacts" name="contact_id">
                    <c:forEach var="contact" items="${contactList}">
                        <option value="${contact.id}">${contact.first_name}</option>
                    </c:forEach>
                </select>
            </div>
            <br>

            <div class="form-group">
                <input id="btn-add-role" type="submit" value="Create" class="btn btn-primary" />
            </div>
        </form>
    </div>
</body>
</html>
