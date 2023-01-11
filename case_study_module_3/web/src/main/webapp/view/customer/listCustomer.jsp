<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 12/21/2022
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List Customer </title>


    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/styleWeb.css">

</head>
<body>
<div>
    <%--header--%>
    <c:import url="/view/include/header.jsp"></c:import>
</div>

<%--search--%>
<form class="d-flex" action="/customer?action=search" method="post">
    <input class="form-control me-2" type="search" placeholder="Search Name" aria-label="Search" name="name">
    <input class="form-control me-2" type="search" placeholder="Search Phone Number" aria-label="Search"
           name="phone_number">
        <select name="customer_type_id">
            <option value="">Chọn loai khach </option>
            <c:forEach var="customerType" items="${customerTypeList}">
                <option value="${customerType.id}">${customerType.name}</option>
            </c:forEach>
        </select>
<%--    <input class="form-control me-2" type="search" placeholder="Search Address" aria-label="Search" name="address">--%>
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>

<%--<form action="/student?action=search" method="post">--%>
<%--    <input name="searchName" placeholder="nhập tên">--%>
<%--    <select name="searchClassId">--%>
<%--        <option value="">Chọn lớp</option>--%>
<%--        <c:forEach var="clazz" items="${clazzList}">--%>
<%--            <option value="${clazz.id}">${clazz.name}</option>--%>
<%--        </c:forEach>--%>
<%--    </select>--%>


<%--    <button type="submit">Search</button>--%>
<%--</form>--%>

<%-- mess --%>
<h2 class="text-success">${mess}</h2>
<h2 class="text-danger">${messDelete}</h2>

<%--thêm--%>
<div class="row">
    <div class="col-md-3">
        <div class="d-flex justify-content-center  align-content-center mt-3 ">
            <button class=" button  " style="width: 25% ; height: 50%">
                <a href="<c:url value="/customer?action=add"/>" class="text-decoration-none  text-success">
                    <img src="picture/3592854_add%20user_business%20man_employee_general_human_icon.png" height="100%"
                         width="90%"></a>
            </button>
        </div>
    </div>
    <div class="col-md-6">
        <div class="d-flex  justify-content-center m-md-3 ">
            <h1 class=" text-danger ">Customer List</h1>
        </div>
    </div>
    <div class="col-md-3">

    </div>
</div>
<%--danh sách--%>
<table class="table table-striped " style="background: #c6c7c8" id="tableCustomer">
    <thead>
    <tr class="bg-black text-white text-center">
        <th>STT</th>
        <th>Customer Type ID</th>
        <th>Customer Name</th>
        <th>BirthDay</th>
        <th>Gender</th>
        <th>ID Card</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customerList}" varStatus="status">
            <tr class=" text-center ">
                    <td>${status.count}</td>
                    <td>${customer.customerType.name}</td>
                    <td>${customer.name}</td>
                    <td>${customer.dateOfBirth}</td>
                    <c:if test="${customer.gender}">

                        <td>Nam</td>
                    </c:if>
                    <c:if test="${!customer.gender}">
                        <td>Nữ</td>
                    </c:if>
                    <td>${customer.idCard}</td>
                    <td>${customer.phoneNumber}</td>
                    <td>${customer.email}</td>
                    <td>${customer.address}</td>
                    <td>
                        <button onclick="infoEdit('${customer.getId()}','${customer.customerType.getId()}','${customer.getName()}','${customer.getDateOfBirth()}',
                                '${customer.getIdCard()}','${customer.getPhoneNumber()}','${customer.getEmail()}','${customer.getAddress()}','${customer.isGender()}')"
                                type="button" class=" button2 " data-bs-toggle="modal" data-bs-target="#edit">
                            <img src="picture/3592832_general_office_repair_repair%20tool_screwdriver_icon.png"
                                 height="25"
                                 width="20">
                        </button>
                    </td>
                    <td>
                        <button onclick="infoDelete('${customer.getId()}','${customer.getName()}')" type="button"
                                class=" button1 " data-bs-toggle="modal" data-bs-target="#exampleModal">
                            <img src="../../picture/3592821_garbage%20can_general_office_recycle%20bin_rubbish%20bin_icon.png"
                                 height="25" width="20">
                        </button>
                    </td>
                </div>
            </tr>
    </c:forEach>

    </tbody>

</table>

<div>
    <%--    footer --%>
    <c:import url="/view/include/footer.jsp"></c:import>
</div>

<%--   Phân trang --%>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script style="align-content: center">
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

<%-- modal delete--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="/customer?action=delete" method="post">
                <div class="modal-body">
                    <label for="deleteId"></label><input type="text" hidden id="deleteId" name="id">
                    Bạn có muốn xóa khách hàng <span id="deleteName" style="color: brown; font-weight: bold"></span>
                    không ?
                </div>

                <div class="modal-footer">
                    <button type="button" class=" button1" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class=" button2">Confirm</button>
                </div>

            </form>
        </div>
    </div>
</div>

<!-- Modal edit -->
<div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="/customer?action=edit" method="post" class="form-xl">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Chỉnh sửa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input name="id" hidden id="idEdit" type="text">
                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Customer Type Name</label>
                        <div class="col-sm-9">
                            <select class="form-select" name="customer_type_id" id="customerTypeId">
                                <c:forEach var="ct" items="${customerTypeList}">
                                    <option value="${ct.id}">${ct.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="m-2 row  ">
                        <label for="nameEdit" class="col-sm-3 col-form-label">Name</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control bg-light " id="nameEdit" name="name">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label for="dateEdit" class="col-sm-3 col-form-label">BirthDay</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control bg-light " id="dateEdit" name="date_of_birth">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <div class="col-sm-3">Gender</div>
                        <div class="col-sm-9">

                            <label>
                                <input type="radio" name="gender" value="true" id="male">
                            </label> Nam
                            <label>
                                <input type="radio" name="gender" value="false" id="female">
                            </label> Nữ
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label for="idCardEdit" class="col-sm-3 col-form-label">ID Card</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control bg-light " id="idCardEdit" name="id_card">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label for="phoneNumberEdit" class="col-sm-3 col-form-label">Phone Number</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control bg-light " id="phoneNumberEdit" name="phone_number">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label for="emailEdit" class="col-sm-3 col-form-label">Email</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control bg-light" id="emailEdit" name="email">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label for="addressEdit" class="col-sm-3 col-form-label">Address</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control bg-light " id="addressEdit" name="address">
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class=" button1" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class=" button2">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }

    function infoEdit(id, customer_type_id, name, date_of_birth, id_card, phone_number, email, address, gender) {
        document.getElementById("idEdit").value = id;
        document.getElementById("customerTypeId").value = customer_type_id;
        document.getElementById("nameEdit").value = name;
        document.getElementById("dateEdit").value = date_of_birth;
        document.getElementById("idCardEdit").value = id_card;
        document.getElementById("phoneNumberEdit").value = phone_number;
        document.getElementById("emailEdit").value = email;
        document.getElementById("addressEdit").value = address;
        if (gender === "true") {
            document.getElementById("male").checked = true;
            document.getElementById("female").checked = false;
        } else {
            document.getElementById("male").checked = false;
            document.getElementById("female").checked = true;
        }
    }
</script>


<%-- file  bootstrap javascript--%>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
