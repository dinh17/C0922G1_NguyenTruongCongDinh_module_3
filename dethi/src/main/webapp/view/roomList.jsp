<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 1/11/2023
  Time: 2:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Room List </title>
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/styleWeb.css">
</head>
<body>
<div>
    <%--header--%>
    <c:import url="/view/include/header.jsp"></c:import>
</div>

<div class="row">
    <div class="col-md-3">
        <div class="d-flex justify-content-center  align-content-center mt-3 ">
            <button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#add" style="width: 25% ; height: 50%">

                <img src="picture/3592854_add%20user_business%20man_employee_general_human_icon.png" height="100%"
                     width="90%">
            </button>
        </div>
    </div>
    <div class="col-md-6">
        <div class="d-flex  justify-content-center m-md-3 ">
            <h1 class=" text-danger ">Student  List</h1>
        </div>
    </div>
    <div class="col-md-3">

    </div>
</div>


<form class="d-flex" action="/student?action=search" method="post">
    <input class="form-control me-2" type="search" placeholder="Search Name" aria-label="Search" name="name">
    <input class="form-control me-2" type="search" placeholder="Search Phone Number" aria-label="Search"
           name="number_phone">
    <select name="customer_type_id">
        <option value="">Chọn loai Hoc Sinh </option>
        <c:forEach var="st" items="${studentTypeList}">
            <option value="${st.id}">${st.name}</option>
        </c:forEach>
    </select>
    <%--    <input class="form-control me-2" type="search" placeholder="Search Address" aria-label="Search" name="address">--%>
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>

<h2 class="text-success">${mess}</h2>
<h2 class="text-danger">${messDelete}</h2>

<!-- Modal add -->

<div class="modal fade" id="add" tabindex="-1" aria-labelledby="addModal" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="/student?action=add" method="post" class="form-xl">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModal">ADD</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label"> Name</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="nameAdd" name="name">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <div class="col-sm-3">Gender</div>
                        <div class="col-sm-9">
                            <label>
                                <input type="radio" name="gender" value="true">
                            </label>Nam
                            <label>
                                <input type="radio" name="gender" value="false">
                            </label>Nữ
                        </div>
                    </div>


                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Age</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" id="ageAdd" name="age">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Number Phone</label>
                        <div class="col-sm-9">
                            <input type="number" class="form-control" id="numberPhoneAdd" name="number_phone">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Class </label>
                        <div class="col-sm-9">
                            <select class="form-select" name="class_id" id="classIdAdd">
                                <c:forEach var="c" items="${classList}">
                                    <option value="${c.id}">${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>


                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Student Type </label>
                        <div class="col-sm-9">
                            <select class="form-select" name="student_type_id" id="studentTypeIdAdd">
                                <c:forEach var="st" items="${studentTypeList}">
                                    <option value="${st.id}">${st.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>


<%--danh sách--%>
<table class="table table-striped " style="background: #c6c7c8" id="tableCustomer">
    <thead>
    <tr class="bg-black text-white text-center">
        <th>STT</th>
        <th>Name</th>
        <th>gender</th>
        <th>Age</th>
        <th>Number Phone</th>
        <th>Class</th>
        <th>Type</th>
        <th>Edit</th>
        <th>Delete</th>
        <th>Detail</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="student" items="${studentList}" varStatus="status">
        <tr class=" text-center ">
            <td>${status.count}</td>

            <td>${student.name}</td>
            <c:if test="${student.gender}">

                <td>Nam</td>
            </c:if>
            <c:if test="${!student.gender}">
                <td>Nữ</td>
            </c:if>
            <td>${student.age}</td>
            <td>${student.numberPhone}</td>
            <td>${student.classType.name}</td>
            <td>${student.studentType.name}</td>


            <td>
                <button onclick="infoEdit('${student.getId()}','${student.getName()}','${student.isGender()}'
                        ,'${student.getAge()}', '${student.getNumberPhone()}','${student.classType.getId()}','${student.studentType.getId()}')"
                        type="button" class=" button2 " data-bs-toggle="modal" data-bs-target="#edit">
                    Edit
                </button>
            </td>
            <td>
                <button onclick="infoDelete('${student.getId()}','${student.getName()}')" type="button"
                        class=" button1 " data-bs-toggle="modal" data-bs-target="#exampleModal">

                    Delete
                </button>
            </td>
            <td>
                <button onclick="infoDetail('${student.getId()}','${student.getName()}','${student.isGender()}'
                        ,'${student.getAge()}', '${student.getNumberPhone()}','${student.classType.getId()}','${student.studentType.getId()}')"
                        type="button" class=" button2 " data-bs-toggle="modal" data-bs-target="#detail">
                    Detail
                </button>
            </td>


        </tr>
    </c:forEach>

    </tbody>

</table>

<%-- modal delete--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/student?action=delete" method="post">
                <div class="modal-body">
                    <label for="deleteId"></label><input type="text" hidden id="deleteId" name="id">
                    Bạn có muốn xóa <span id="deleteName" style="color: brown; font-weight: bold"></span>
                    không ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Confirm</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!---------------------------------------- Modal edit -->
<div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="/student?action=edit" method="post" class="form-xl">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Chỉnh sửa</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input name="id" hidden id="idEdit" type="text">
                    <div class="m-2 row">
                        <label for="nameEdit" class="col-sm-3 col-form-label">Name</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="nameEdit" name="name">
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
                        <label for="ageEdit" class="col-sm-3 col-form-label">Age</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="ageEdit" name="age">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <label for="numberPhoneEdit" class="col-sm-3 col-form-label">NumberPhone</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="numberPhoneEdit" name="number_phone">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Class </label>
                        <div class="col-sm-9">
                            <select class="form-select" name="class_id" id="classIdEdit">
                                <c:forEach var="c" items="${classList}">
                                    <option value="${c.id}">${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>


                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Student Type </label>
                        <div class="col-sm-9">
                            <select class="form-select" name="student_type_id" id="studentTypeIdEdit">
                                <c:forEach var="st" items="${studentTypeList}">
                                    <option value="${st.id}">${st.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!---------------------------------------- Modal detail -->
<div class="modal fade" id="detail" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form method="post" class="form-xl">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Chi tiet</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input name="id" hidden id="idDetail" type="text">
                    <div class="m-2 row">
                        <label for="nameEdit" class="col-sm-3 col-form-label">Name</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="nameDetail" name="name">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <div class="col-sm-3">Gender</div>
                        <div class="col-sm-9">

                            <label>
                                <input type="radio" name="gender" value="true" id="male1">
                            </label> Nam
                            <label>
                                <input type="radio" name="gender" value="false" id="female2">
                            </label> Nữ
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label for="ageEdit" class="col-sm-3 col-form-label">Age</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="ageDetail" name="age">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <label for="numberPhoneEdit" class="col-sm-3 col-form-label">NumberPhone</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="numberPhoneDetail" name="number_phone">
                        </div>
                    </div>

                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Class </label>
                        <div class="col-sm-9">
                            <select class="form-select" name="class_id" id="classIdDetail">
                                <c:forEach var="c" items="${classList}">
                                    <option value="${c.id}">${c.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>


                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Student Type </label>
                        <div class="col-sm-9">
                            <select class="form-select" name="student_type_id" id="studentTypeIdDetail">
                                <c:forEach var="st" items="${studentTypeList}">
                                    <option value="${st.id}">${st.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
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
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }

    function infoEdit(id, name, gender, age, number_phone, class_id, student_type_id) {
        document.getElementById("idEdit").value = id;
        document.getElementById("nameEdit").value = name;
        if (gender === "true") {
            document.getElementById("male").checked = true;
            document.getElementById("female").checked = false;
        } else {
            document.getElementById("male").checked = false;
            document.getElementById("female").checked = true;
        }
        document.getElementById("ageEdit").value = age;
        document.getElementById("numberPhoneEdit").value = number_phone;
        document.getElementById("classIdEdit").value = class_id;
        document.getElementById("studentTypeIdEdit").value = student_type_id;


    }

    function infoDetail(id, name, gender, age, number_phone, class_id, student_type_id) {
        document.getElementById("idDetail").value = id;
        document.getElementById("nameDetail").value = name;
        if (gender === "true") {
            document.getElementById("male1").checked = true;
            document.getElementById("female2").checked = false;
        } else {
            document.getElementById("male1").checked = false;
            document.getElementById("female2").checked = true;
        }
        document.getElementById("ageDetail").value = age;
        document.getElementById("numberPhoneDetail").value = number_phone;
        document.getElementById("classIdDetail").value = class_id;
        document.getElementById("studentTypeIdDetail").value = student_type_id;
    }
</script>
<%-- file  bootstrap javascript--%>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>



</body>
</html>
