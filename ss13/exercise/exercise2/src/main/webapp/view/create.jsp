<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Users</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous">

<body  style="background-color: #ddd">
<form action="/user?action=add" method="post">
    <h4>Add user</h4>
    <a class="btn btn-outline-primary" href="/user">List Users</a><br>
    Name: <input type="text" name="name" placeholder="Input name">
    Email: <input type="text" name="email" placeholder="Input email">
    Country: <input type="text" name="country" placeholder="Input country">
    <button class="btn btn-outline-success" type="submit">Add</button>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
</html>