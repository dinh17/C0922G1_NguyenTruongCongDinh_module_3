
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Employee</title>

    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/styleWeb.css">
</head>
<body>
<div>
    <%--header--%>
    <c:import url="/view/include/header.jsp"></c:import>
</div>
<%--<h2 class="text-success">${mess}</h2>--%>
<%--<h2 class="text-danger">${messDelete}</h2>--%>
<div class="row">
    <%--    thêm mới   --%>
    <div class="col-md-3">
        <div class="d-flex justify-content-center  align-content-center mt-3 ">
            <button class=" button  " style="width: 25% ; height: 50%">
                <a class="text-decoration-none  text-success">
                    <img src="picture/3592854_add%20user_business%20man_employee_general_human_icon.png" height="100%"
                         width="90%"></a>
            </button>
        </div>
    </div>

    <div class="col-md-6">
        <div class="d-flex  justify-content-center m-md-3 ">
            <h1 class=" text-danger ">Employee List</h1>
        </div>
    </div>
    <div class="col-md-3">

    </div>
</div>

<table class="table table-striped " style="background: #c6c7c8" id="tableEmployee">
    <thead>
    <tr class="bg-black text-white text-center">
        <th>STT</th>
        <th>Name</th>
        <th>BirthDay</th>
        <th>ID Card</th>
        <th>Salary</th>
        <th>Phone Number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Division</th>
        <th>Position</th>
        <th>Education Degree</th>
        <th>Edit</th>
        <th>Delete</th>

    </tr>
    </thead>
    <tbody>
    <c:forEach var="employee" items="${employeeList}" varStatus="stt">
        <tr>
            <td>${stt.count}</td>
            <td>${employee.name}</td>
            <td>${employee.dateOfBirth}</td>
            <td>${employee.idCard}</td>
            <td>${employee.salary}</td>
            <td>${employee.phoneNumber}</td>
            <td>${employee.email}</td>
            <td>${employee.address}</td>
            <td>${employee.division.name}</td>
            <td>${employee.position.name}</td>
            <td>${employee.educationDegree.name}</td>

            <td>
                <img src="picture/3592832_general_office_repair_repair%20tool_screwdriver_icon.png"
                     height="25"
                     width="20">
            </td>
            <td>
                Delete
            </td>
        </tr>
    </c:forEach>
    </tbody>

</table>

<div>
    <%--    footer --%>
    <c:import url="/view/include/footer.jsp"></c:import>
</div>

<%--   Phân trang--%>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script style="align-content: center">
    $(document).ready(function () {
        $('#tableEmployee').dataTable({
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

            <form action="" method="post">
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
            <form action="" method="post" class="form-xl">
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
    // function infoDelete(id, name) {
    //     document.getElementById("deleteId").value = id;
    //     document.getElementById("deleteName").innerText = name;
    // }
    //
    // function infoEdit(id) {
    //
    //     document.getElementById("idEdit").value = id;
    //     document.getElementById("customerTypeId").value = customer_type_id;
    //     document.getElementById("nameEdit").value = name;
    //     document.getElementById("dateEdit").value = date_of_birth;
    //     document.getElementById("idCardEdit").value = id_card;
    //     document.getElementById("phoneNumberEdit").value = phone_number;
    //     document.getElementById("emailEdit").value = email;
    //     document.getElementById("addressEdit").value = address;
    // }
</script>

<%-- file  bootstrap javascript--%>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
