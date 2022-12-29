<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 12/21/2022
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách dịch vụ </title>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist\css\bootstrap.css">
</head>
<body>
<c:import url="/view/include/header.jsp"></c:import>


<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#add">Thêm mới</button>

<!-- Modal add -->

<div class="modal fade" id="add" tabindex="-1" aria-labelledby="addModal" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="/facility?action=add" method="post" class="form-xl">
                <div class="modal-header">
                    <h5 class="modal-title" id="addModal">ADD</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="m-2 row">
                        <label class="col-sm-3 form-label"> Facility Type</label>
                        <div class="col-sm-9">
                            <input hidden type="text" name="facility_type_id" id="facilityTypeIdAdd">
                            <button type="button" onclick="addVilla()">Villa</button>
                            <button type="button" onclick="addHouse()">House</button>
                            <button type="button" onclick="addRoom()">Room</button>
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Facility Name</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="nameAdd" name="name">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Area</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="areaAdd" name="area">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Cost</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="costAdd" name="cost">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Max People</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="maxPeopleAdd" name="max_people">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Rent Type Name</label>
                        <div class="col-sm-9">
                            <select class="form-select" name="rent_type_id" id="rentTypeAdd">
                                <c:forEach var="rt" items="${rentTypeList}">
                                    <option value="${rt.id}">${rt.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div id="standardRoomAdd">
                        <div class="m-2 row">
                            <label class="col-sm-3 col-form-label">Standard Room</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="standard_room">
                            </div>
                        </div>
                    </div>

                    <div id="descriptionAdd">
                        <div class="m-2 row" >
                            <label class="col-sm-3 col-form-label">Description Other Convenience</label>
                            <div class="col-sm-9 ">
                                <input type="text" class="form-control" name="description_other_convenience">
                            </div>
                        </div>
                    </div>
                    <div id="poolAreaAdd">
                    <div class="m-2 row" >
                        <label class="col-sm-3 col-form-label">Pool Area</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" name="pool_area">
                        </div>
                    </div>
                    </div>
                    <div class="m-2 row" id="numberOfFloorsAdd">
                        <label class="col-sm-3 col-form-label">Number of Floors</label>
                        <div class="col-sm-9 ">
                            <input type="text" class="form-control" name="number_of_floors">
                        </div>
                    </div>
                    <div class="m-2 row" id="facilityFreeAdd">
                        <label class="col-sm-3  col-form-label">Facility Free</label>
                        <div class="col-sm-9 ">
                            <input type="text" class="form-control" name="facility_free">
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

<h2 class="d-flex justify-content-center text-danger">Facility List</h2>
<h3 class="text-success">${mess}</h3>
<%--Search--%>
<form class="d-flex" action="/facility?action=search" method="post">
    <input class="form-control me-2" type="search" placeholder="Search Name" aria-label="Search" name="name">
    <select class="form-select" name="rent_type_id">
        <c:forEach var="ft" items="${rentTypeList}">
            <option value="${ft.id}">${ft.name}</option>
        </c:forEach>
    </select>
    <button class="btn btn-outline-success" type="submit">Search</button>
</form>

<table class="table table-striped table-hover" id="tableStudent">
    <thead>
    <tr>
        <th scope="col">STT</th>
        <th scope="col">Facility Name</th>
        <th scope="col">Area</th>
        <th scope="col">Cost</th>
        <th scope="col">Max People</th>
        <th scope="col">Rent Type Name</th>
        <th scope="col">Facility Type Name</th>
        <th scope="col">Standard Room</th>
        <th scope="col">Description Other Convenience</th>
        <th scope="col">Pool Area</th>
        <th scope="col">Number Of Floors</th>
        <th scope="col">Facility free</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="facility" items="${facilityList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${facility.name}</td>
            <td>${facility.area}</td>
            <td>${facility.cost}</td>
            <td>${facility.maxPeople}</td>
            <td>${facility.rentType.name}</td>
            <td>${facility.facilityType.name}</td>
            <td>${facility.standardRoom}</td>
            <td>${facility.descriptionOtherConvenience}</td>
            <td>${facility.poolArea}</td>
            <td>${facility.numberOfFloors}</td>
            <td>${facility.facilityFree}</td>
            <td>
                <button onclick="infoEdit('${facility.getId()}','${facility.name}','${facility.area}','${facility.cost}',
                        '${facility.maxPeople}','${facility.rentType.getId()}','${facility.facilityType.getId()}',
                        '${facility.standardRoom}','${facility.descriptionOtherConvenience}','${facility.poolArea}','${facility.numberOfFloors}','${facility.facilityFree}')"
                        type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#edit">
                    Edit
                </button>
            </td>
            <td>
                <button onclick="infoDelete('${facility.getId()}','${facility.getName()}')" type="button"
                        class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<c:import url="/view/include/footer.jsp"></c:import>

<%-- modal delete--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="${pageContext.request.contextPath}/facility?action=delete" method="post">
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
            <form action="/facility?action=edit" method="post" class="form-xl">
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
                        <label for="areaEdit" class="col-sm-3 col-form-label">Area</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="areaEdit" name="area">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label for="costEdit" class="col-sm-3 col-form-label">Cost</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="costEdit" name="cost">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label for="maxPeopleEdit" class="col-sm-3 col-form-label">Max People</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="maxPeopleEdit" name="max_people">
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Rent Type Name</label>
                        <div class="col-sm-9">
                            <select class="form-select" name="rent_type_id" id="rentTypeIdEdit">
                                <c:forEach var="ft" items="${rentTypeList}">
                                    <option value="${ft.id}">${ft.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="m-2 row">
                        <label class="col-sm-3 col-form-label">Facility Type Name</label>
                        <div class="col-sm-9">
                            <select class="form-select" name="facility_type_id" id="facilityTypeIdEdit">
                                <c:forEach var="ft" items="${facilityTypeList}">
                                    <option value="${ft.id}">${ft.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                     <div id="newStandardRoom" >
                         <div class="m-2 row" >
                             <label for="standardRoomEdit" class="col-sm-3 col-form-label">Standard Room</label>
                             <div class="col-sm-9">
                            <input type="text" class="form-control" id="standardRoomEdit" name="standard_room">
                        </div>
                         </div>
                     </div>
                  <div id="newDescriptionOtherConvenience" >
                    <div class="m-2 row" >
                        <label for="descriptionOtherConvenienceEdit" class="col-sm-3 col-form-label"> Description
                            other</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="descriptionOtherConvenienceEdit"
                                   name="description_other_convenience">
                        </div>
                    </div>
                  </div>
                    <div id="newPoolArea" >
                        <div class="m-2 row" >
                            <label for="poolAreaEdit" class="col-sm-3 col-form-label">Pool Area</label>
                            <dic class="col-sm-9">
                            <input type="text" class="form-control" id="poolAreaEdit" name="pool_area">
                        </dic>
                        </div>
                    </div>
                       <div id="newNumberOfFloors" >
                           <div class="m-2 row" >
                               <label for="numberOfFloorsEdit" class="col-sm-3 col-form-label">Number Of Floors</label>
                               <div class="col-sm-9">
                                   <input type="text" class="form-control" id="numberOfFloorsEdit" name="number_of_floors">
                               </div>
                           </div>
                       </div>
                   <div id="newFacilityFree">
                       <div class="m-2 row" >
                           <label for="facilityFreeEdit" class="col-sm-3 col-form-label">Facility Free</label>
                           <div class="col-sm-9">
                               <input type="text" class="form-control" id="facilityFreeEdit" name="facility_free">
                           </div>
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

<script>
    function addVilla() {
        document.getElementById("facilityTypeIdAdd").value = 1;
        document.getElementById("standardRoomAdd").style.display = 'block';
        document.getElementById("descriptionAdd").style.display = 'block';
        document.getElementById("poolAreaAdd").style.display = 'block';
        document.getElementById("numberOfFloorAdd").style.display = 'block';
        document.getElementById("facilityFreeAdd").style.display = 'none';
    }

    function addHouse() {
        document.getElementById("facilityTypeIdAdd").value = 2;
        document.getElementById("standardRoomAdd").style.display = 'block';
        document.getElementById("descriptionAdd").style.display = 'block';
        document.getElementById("poolAreaAdd").style.display = 'none';
        document.getElementById("numberOfFloorAdd").style.display = 'block';
        document.getElementById("facilityFreeAdd").style.display = 'none';
    }

    function addRoom() {
        document.getElementById("facilityTypeIdAdd").value = 3;
        document.getElementById("standardRoomAdd").style.display = "none";
        document.getElementById("descriptionAdd").style.display = "none";
        document.getElementById("poolAreaAdd").style.display = "none";
        document.getElementById("numberOfFloorAdd").style.display = "none";
        document.getElementById("facilityFreeAdd").style.display = "block";
    }

    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }

    function infoEdit(id, name, area, cost, maxPeople, rentTypeId, facilityTypeId, standardRoom,
                      descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree) {
        document.getElementById("idEdit").value = id;
        document.getElementById("nameEdit").value = name;
        document.getElementById("areaEdit").value = area;
        document.getElementById("costEdit").value = cost;
        document.getElementById("maxPeopleEdit").value = maxPeople;
        document.getElementById("rentTypeIdEdit").value = rentTypeId;
        document.getElementById("facilityTypeIdEdit").value = facilityTypeId;
        document.getElementById("standardRoomEdit").value = standardRoom;
        document.getElementById("descriptionOtherConvenienceEdit").value = descriptionOtherConvenience;
        document.getElementById("poolAreaEdit").value = poolArea;
        document.getElementById("numberOfFloorsEdit").value = numberOfFloors;
        document.getElementById("facilityFreeEdit").value = facilityFree;
        let newStandardRoom = document.getElementById("newStandardRoom");
        let newDescriptionOtherConvenience = document.getElementById("newDescriptionOtherConvenience");
        let newPoolArea = document.getElementById("newPoolArea");
        let newNumberOfFloors = document.getElementById("newNumberOfFloors");
        let newFacilityFree = document.getElementById("newFacilityFree");
        if (facilityTypeId === 1) {
            newStandardRoom.style.display = 'block';
            newDescriptionOtherConvenience.style.display = 'block';
            newPoolArea.style.display = 'block';
            newNumberOfFloors.style.display = 'block';
            newFacilityFree.style.display = 'none';
        } else if (facilityTypeId === 2) {
            newStandardRoom.style.display = 'block';
            newDescriptionOtherConvenience.style.display = 'block';
            newPoolArea.style.display = 'none';
            newNumberOfFloors.style.display = 'block';
            newFacilityFree.style.display = 'none';
        } else if (facilityTypeId === 3) {
            newStandardRoom.style.display = 'none';
            newDescriptionOtherConvenience.style.display = 'none';
            newPoolArea.style.display = 'none';
            newNumberOfFloors.style.display = 'none';
            newFacilityFree.style.display = 'block';
        }
    }
</script>
<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>


<script src="../bootstrap-5.1.3-dist\js\bootstrap.js"></script>
</body>
</html>
