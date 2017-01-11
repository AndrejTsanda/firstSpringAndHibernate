<%--

--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page session="false" %>
<html>
<head>
    <title>Contact Details</title>
</head>
<body>
<h1> Contact Details</h1>

<table>
    <tr>
        <th width="80">Id</th>
        <th width="120">First name</th>
        <th width="120">Last name</th>
        <th width="200">Phone number</th>
        <th width="250">Email</th>
        <th width="200">Date of birth</th>
    </tr>
    <tr>
        <td>${contact.id}</td>
        <td>${contact.firstName}</td>
        <td>${contact.lastName}</td>
        <td>${contact.phoneNumber}</td>
        <td>${contact.email}</td>
        <td>${contact.dateOfBirth}</td>
    </tr>
</table>
</body>
</html>
