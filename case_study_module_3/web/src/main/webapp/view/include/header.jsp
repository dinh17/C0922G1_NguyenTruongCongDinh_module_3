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
<div class="m-2 row">
    <div class="d-flex  justify-content-between ">
        <div class="col-2"><span><img src="../picture/logo.png" height="100" width="63" alt="logo lỗi"/></span></div>


        <div class="col-3 widget-tripadvisor">
            <div class="inside">
                <div class="widget-tripadvisor-logo"><img
                        src="https://smartdata.tonytemplates.com/bestel/wp-content/uploads/2018/05/widget-tripadvisor-logo.png"
                        alt=""></div>
                <div class="widget-tripadvisor-rating"><img
                        src="https://furamavietnam.com/wp-content/uploads/2018/08/widget-tripadvisor-rating.png" alt="">
                </div>
                <div class="widget-tripadvisor-text">2,746 Reviews</div>
            </div>
        </div>

        <div class=" col-3 header-contact-txt">
            <p>
                103 - 105 Vo Nguyen Giap Street, Khue My Ward, Ngu Hanh Son District, Danang City, Vietnam </p>
            <p class="txt-sm">
                <span>7,0 km</span> from Danang Airport </p>
        </div>
        <div class="col-3">

            <div class="header-contact d-flex">
                <div class="header-contact-icon"><i class="icon-telephone"></i></div>
                <div class="header-contact-txt">
                    <p class="txt-lg">
                        84-236-3847 333/888 </p>
                </div>
            </div>
            <div class="header-contact d-flex">
                <div class="header-contact-icon"><i class="icon-closed-envelope"></i></div>
                <div class="header-contact-txt">
                    <a href="mailto:reservation@furamavietnam.com">
                        reservation@furamavietnam.com </a>
                </div>
            </div>
        </div>

        <span class="d-flex align-items-center ">Công Định</span>
    </div>
</div>
<%--header--%>

<nav class="navbar navbar-expand-lg navbar-light  sticky" style="background: #046056">
    <div class="container-fluid">

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02"
                aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="col-md-3">
        </div>

        <div class="d-flex col-md-6 justify-content-center ">
           <div class="justify-content-sm-between">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <div class="d-flex container-fluid">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/customer">Customer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/facility">Service</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/employee">Employee</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/contract">Contract</a>
                        </li>
                    </ul>
                </div>
            </div>
           </div>
        </div>
        <div class="col-md-3">

        </div>
    </div>
</nav>

<script src="../bootstrap-5.1.3-dist\js\bootstrap.js"></script>
</body>
</html>
