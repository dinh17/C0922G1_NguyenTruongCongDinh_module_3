<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 12/20/2022
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>header</title>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist\css\bootstrap.css">
</head>
<body>
<%--logo --%>
<div class="m-2">
    <div class="d-flex  justify-content-between ">
        <span><img src="../picture/logo.png" height="100" width="63" alt="logo lỗi"/></span>
        <span class="d-flex align-items-center ">Công Định</span>
    </div>
</div>
<%--header--%>
<nav class="navbar navbar-expand-lg navbar-light " style="background: #046056">
    <div class="container-fluid">
        <%--        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02"--%>
        <%--                aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">--%>
        <%--            <span class="navbar-toggler-icon"></span>--%>
        <%--        </button>--%>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0  ">
                <li class="nav-item ">
                    <a class="nav-link active" aria-current="page" href="index.jsp" >Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#"></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/customer">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/facility">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/employee">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="#">Contract</a>
                </li>
            </ul>

        </div>
    </div>
</nav>


<script src="../bootstrap-5.1.3-dist\js\bootstrap.js"></script>
</body>
</html>
