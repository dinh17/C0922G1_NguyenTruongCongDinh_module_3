<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 12/21/2022
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- thư viện jstl --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>ADD Customer</title>

    <%--    file bootstrap css --%>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/styleWeb.css.css">

</head>
<body>

<div class="row">
    <%--header--%>
    <c:import url="/view/include/header.jsp"></c:import>
</div>
<%--    body --%>
<h1 class="text-center">Thêm mới Khách hàng</h1>
<h2 class="text-success">${mess}</h2>
<%--form thêm mới khách hàng --%>

<form action="/customer?action=add" method="post">
    <%-- customer type  --%>
        <div class="m-2 row">
            <div class="col-sm-2">Customer Type Name</div>
            <div class="col-sm-10">
                <%--            thêm kiểu dữ liệu của class khác--%>
                <select class="form-select" name="customer_type_id">
                    <c:forEach var="ct" items="${customerTypeList}">
                        <option value="${ct.id}">${ct.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    <%--      name    --%>
        <div class="m-2 row">
            <label for="staticName" class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="staticName"  required   title="Tên Hợp Lệ  : VD (Nguyễn Trương Công Định),..." name="name">
            </div>
        </div>

    <%--          birthday      --%>
        <div class="m-2 row">
            <label for="staticDate" class="col-sm-2 col-form-label">Date Of Birth</label>
            <div class="col-sm-10">
                <input type="date" class="form-control" id="staticDate"  required name="date_of_birth">
            </div>
        </div>
    <%--           gender      --%>

        <div class="m-2 row">
            <div class="col-sm-2">Gender</div>
            <div class="col-sm-10">
                <label>
                    <input type="radio" name="gender" value="true">
                </label>Nam
                <label>
                    <input type="radio" name="gender" value="false">
                </label>Nữ
            </div>
        </div>
    <%--        ID Card      --%>
        <div class="m-2 row">
            <label for="staticIdCard" class="col-sm-2 col-form-label">ID Card</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="staticIdCard"  required name="id_card">
            </div>
        </div>
    <%--    Phone Number   --%>
        <div class="m-2 row">
            <label for="staticPhoneNumber" class="col-sm-2 col-form-label">Phone Number</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="staticPhoneNumber" required name="phone_number">
            </div>
        </div>
    <%--        email       --%>
        <div class="m-2 row">
            <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="staticEmail" required name="email">
            </div>
        </div>
    <%--         address   --%>

        <div class="m-2 row">
            <label for="staticAddress" class="col-sm-2 col-form-label">Address</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="staticAddress" required name="address">
            </div>
        </div>

        <button type="submit" class="d-flex justify-content-center button1 " style="margin: 0 auto">Save</button>
</form>
<div class="row">
    <%--    footer --%>
    <c:import url="/view/include/footer.jsp"></c:import>
</div>

<%--file bootstrap javascript --%>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
