<%--

--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Welcome</title>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>" type="text/css" media="all"/>
</head>
<body>
<h1>Hello ${name}!</h1>

<a href="<c:url value='/contacts'/>">Contact List</a>
</body>
</html>
