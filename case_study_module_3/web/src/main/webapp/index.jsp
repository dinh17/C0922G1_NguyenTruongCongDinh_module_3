<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 12/20/2022
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist\css\bootstrap.css">

    <%--    <link rel="stylesheet" href="../bootstrap-5.1.3-dist\css\styleWeb.css">--%>

</head>





<%--  <c:redirect url="/view/customer/listCustomer.jsp"></c:redirect>--%>

    <%--header--%>
    <c:import url="view/include/header.jsp"></c:import>

<%--body--%>



    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" style="height: 800px">
                <img src="picture/06-2.jpg" class="d-block w-100 h-100" alt="...">
            </div>
            <div class="carousel-item" style="height: 800px">
                <img src="picture/DES-DANANG.jpg" class="d-block w-100 h-100" alt="...">
            </div>
            <div class="carousel-item" style="height: 800px">
                <img src="picture/Vietnam_Danang_Furama_Resort_Exterior-Furama-girl-with-pink-hat.jpg" class="d-block w-100 h-100"
                     alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>


<%--    footer --%>

    <c:import url="view/include/footer.jsp"></c:import>



<%--<script src="../bootstrap-5.1.3-dist\js\styleWeb.js"></script>--%>

<script src="../bootstrap-5.1.3-dist\js\bootstrap.js"></script>
</body>
</html>
