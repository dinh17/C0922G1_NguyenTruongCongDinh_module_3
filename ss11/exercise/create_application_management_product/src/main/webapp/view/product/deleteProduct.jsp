<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 1/3/2023
  Time: 11:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<form method="post" action="/product?action=?delete&id=${product.getId()}">
    Id: ${product.getId()}<br>
    Name: ${product.getName()}<br>
    Price: ${product.getPrice()}<br>
    Description: ${product.getDescriber()}<br>
    <button type="submit">Confirm</button>
</form>
</body>
</html>
