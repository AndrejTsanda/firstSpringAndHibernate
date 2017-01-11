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
    <meta charset="utf-8">
    <title>Contact</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css" media="all"/>
    <!-- <script src="/js/script.js"/> -->
</head>
<body>
<a href="<c:url value="/"/> ">Back to main menu</a>
<br/>
<br/>

<div class="block">
<h1>Contact List</h1>
<c:if test="${!empty listContacts}">
    <table>
        <tr>
            <th width="80">Id</th>
            <th width="120">First name</th>
            <th width="120">Last name</th>
            <th width="200">Phone number</th>
            <th width="250">Email</th>
            <th width="200">Date of birth</th>
            <th width="60"></th>
            <th width="60"></th>
        </tr>
        <c:forEach items="${listContacts}" var="contact">
            <tr>
                <td>${contact.id}</td>
                <td><a href="<c:url value="/contactData/${contact.id}"/> ">${contact.firstName}</a></td>
                <td>${contact.lastName}</td>
                <td>${contact.phoneNumber}</td>
                <td>${contact.email}</td>
                <td>${contact.dateOfBirth}</td>
                <td><a href="<c:url value='/edit/${contact.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${contact.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
<br/>
<br/>
<div class="form">

<c:url var="addAction" value="/contacts/add"/>
<form:form action="${addAction}" commandName="contact">
    <table>
        <tr>
            <th colspan="2" align="center"><h1> Add a Contact </h1></th>
        </tr>
        <c:if test="${!empty contact.firstName}">
            <tr>
                <td>
                    <form:label path="id"><spring:message text="ID"/> </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="firstName">
                    <spring:message text="First name: "/>
                </form:label>
            </td>
            <td>
                <form:input path="firstName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="lastName">
                    <spring:message text="Last name: "/>
                </form:label>
            </td>
            <td>
                <form:input path="lastName"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="phoneNumber">
                    <spring:message text="Phone number "/>
                </form:label>
            </td>
            <td>
                <form:input path="phoneNumber"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="email">
                    <spring:message text="Email: "/>
                </form:label>
            </td>
            <td>
                <form:input path="email"/>
            </td>
        </tr>
        <tr>
            <td>
                <form:label path="dateOfBirth">
                    <spring:message text="Date of birth: "/>
                </form:label>
            </td>
            <td>
                <form:input path="dateOfBirth"/>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <c:if test="${!empty contact.firstName}">
                    <input type="submit" value="<spring:message text="Edit Contact"/> "/>
                </c:if>
                <c:if test="${empty contact.firstName}">
                    <input type="submit" value="<spring:message text="Add Contact"/> "/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>

</div>
</div>

</body>
</html>
