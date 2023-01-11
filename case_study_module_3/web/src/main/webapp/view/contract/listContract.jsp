<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 1/5/2023
  Time: 10:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List ConTract</title>

    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/styleWeb.css">
</head>
<body>

<div class="container-fluid">

    <div class="row main vh-100">
        <div >
            <div class="row">
                <h4>Contract list</h4>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-4">
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
                <div class="col-lg-4">
                    <button type="button" class="btn btn-light" data-bs-toggle="modal"
                            data-bs-target="#addDetailContract">
                        <img src="https://img.icons8.com/offices/30/null/plus-2-math.png"/>
                    </button>
                </div>
            </div>
            <div class="row">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Service</th>
                        <th scope="col">Customer</th>
                        <th scope="col">Start date</th>
                        <th scope="col">End date</th>
                        <th scope="col">Deposit</th>
                        <th scope="col">Total</th>
                        <th scope="col">Attach facility</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="detailContract" items="${detailContractList}" varStatus="stt">
                        <tr>
                            <td>${stt.count}</td>
                            <td>${detailContract.contract.facility.name}</td>
                            <td>${detailContract.contract.customer.name}</td>
                            <td>${detailContract.contract.startDate}</td>
                            <td>${detailContract.contract.endDate}</td>
                            <td>${detailContract.contract.deposit}</td>
                            <td></td>
                            <td>
                                <button type="button" class="btn btn-light" data-bs-toggle="modal"
                                        data-bs-target="#addAttachFacility">
                                    <img src="https://img.icons8.com/offices/30/null/plus-2-math.png"/>
                                </button>
                                <button type="button" onclick="getAttachFacilityInfo('${detailContract.attachFacility.name}','${detailContract.attachFacility.cost}','${detailContract.attachFacility.unit}','${detailContract.attachFacility.status}')" class="btn btn-light" data-bs-toggle="modal"
                                        data-bs-target="#dislayAttachFacility">
                                    Attach facility list
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<%--<c:import url="add_detail_ct_modal.jsp"></c:import>--%>
<%----------------------------------------------add detail contract modal----------------------------------------------%>
<div class="modal fade" id="addDetailContract" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add detail contract</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="vh-100" >
                    <div class="mb-3">
                        <label class="form-label">Start date</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">End date</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Deposit</label>
                        <input type="text" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Total</label>
                        <input class="form-control" type="text"  aria-label="Disabled input example" disabled readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Customer</label>
                        <select class="form-select" aria-label="Default select example">
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Service</label>
                        <select class="form-select" aria-label="Default select example">
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Attach facility</label>
                        <button type="button" class="btn btn-light" data-bs-toggle="modal" data-bs-target="#addAttachFacility">
                            <img src="https://img.icons8.com/offices/30/null/plus-2-math.png"/>
                        </button>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<%-----------------------------------------------------attach facility modal--------------------------------------------%>
<div class="modal fade" id="addAttachFacility" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Add attach facility</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>

                    <select class="form-select" aria-label="Default select example">
                        <c:forEach var="attachFacility" items="${attachFacilityList}">
                            <option value="${attachFacility.id}">${attachFacility.name}</option>
                        </c:forEach>
                    </select>

                    <div class="mb-3">
                        <label class="form-label">Quantity</label>
                        <input type="number" class="form-control">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="dislayAttachFacility" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" >Attach facility</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Name</th>
                        <th scope="col">Cost</th>
                        <th scope="col">Unit</th>
                        <th scope="col">Status</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td id="name"></td>
                        <td id="cost"></td>
                        <td id="unit"></td>
                        <td id="status"></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<script>
    function getAttachFacilityInfo(name,cost,unit,status) {
        document.getElementById("name").innerText = name;
        document.getElementById("cost").innerText = cost;
        document.getElementById("unit").innerText = unit;
        document.getElementById("status").innerText = status;
    }
</script>

<%-- file  bootstrap javascript--%>
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
</body>
</html>
