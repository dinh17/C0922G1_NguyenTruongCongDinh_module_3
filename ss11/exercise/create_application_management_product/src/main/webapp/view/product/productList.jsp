<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 1/3/2023
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>List  Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<a href="<c:url value="/product?action=add"/>">ADD</a>
<table class="table table-cell">
    <tr>
        <th>STT</th>

        <th>Name Product</th>
        <th>Price</th>
        <th>Describer</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach varStatus="stt" var="product" items="${productList}">
        <tr>
            <td>${stt.count}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescriber()}</td>

            <td><a href="/product?action=edit&id=${product.getId()}">Edit</a> </td>
            <td><a href="/product?action=delete&id=${product.getId()}">Delete</a> </td>
        </tr>
    </c:forEach>

</table>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
