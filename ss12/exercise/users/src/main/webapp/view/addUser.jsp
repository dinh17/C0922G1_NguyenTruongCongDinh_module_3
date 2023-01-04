<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 1/4/2023
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
</head>
<body>
<h2>${mess}</h2>
<form action="/user?action=add" method="post">
    <div class="form-group">
        <label for="exampleInputEmail1">Name </label>
        <input type="text" class="form-control" id="exampleInputName1"  placeholder="Enter name" name="name">
        <small id="name" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group">
        <label for="exampleInputEmail1">Email </label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email">
        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Country</label>
        <input type="text" class="form-control" id="exampleInputPassword1" placeholder="Password" name="country">
    </div>

    <button type="submit" class="btn btn-primary">Submit</button>
</form>
<h2><a href="/user">quay lai</a></h2>
</body>
</html>
