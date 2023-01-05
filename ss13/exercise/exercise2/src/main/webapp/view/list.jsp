<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>LIST USERS</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous">
<body style="background-color: #ddd">
<h1>LIST USER</h1>
<div>
    <form action="/user?action=find" method="post" class="d-flex" role="search">
        <input class="form-control me-2" type="text" name="country" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" name="action" value="find" type="submit">Search</button>
    </form>
</div>

<a href="/user?action=add" class="btn btn-outline-success">Add</a>
<p>${mess}</p>
<table class="table table-striped">
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="user" items="${userList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
            <td>
                <a href="/user?action=update&id=${user.id}" type="submit" class=" btn btn-outline-secondary">Update</a>
            </td>
            <td>
                <button onclick="deleteUser('${user.id}','${user.name}')" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Delete User</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/user?action=delete" method="post">
                <div class="modal-body">
                    <input hidden type="text" id="deleteId" name="id">
                    <span>You want delete user</span>
                    <span style="color:red;" id="deleteName"></span>
                </div>
                <div class="modal-footer">
                    <p hidden >${mess}</p>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function deleteUser(id,name){
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>