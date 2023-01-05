<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 1/5/2023
  Time: 8:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Find Country</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous">
<body  style="background-color: #ddd">
<h1>SEARCH BY COUNTRY</h1>
<a class="btn btn-outline-primary" href="/user"> LIST USER</a>
<table class="table table-striped">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="user" items="${userList}" >
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td>
                <a href="/user?action=update&id${user.id}" type="submit" class=" btn btn-outline-secondary">Update</a>
            </td>
            <td>
                <a href="/user?action=delete&id=${user.id}" type="submit" class=" btn btn-outline-danger">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>
