<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
  <title>Furama Resort Manager</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<body>

<div class="row header ">
  <div class="row bg-danger ">
    <div class="col-md-2">
      <a class="navbar-brand d-flex justify-content-between" href="/furama"
         style="font-family: Broadway,serif">Furama</a>
    </div>
    <div class="col-md-8">

    </div>
    <div class="col-md-2 d-flex justify-content-center " style="margin-top: 35px; ">
      <a class="nav-link active d-flex justify-content-between" href="/furama/syvt">Van Tien Sy</a>
    </div>

  </div>
  <div class="row header-link ">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <div class="col-md-2 ms-3">
                <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link dropdown-toggle" href="employee.jsp" role="button"
                 data-bs-toggle="dropdown"
                 aria-expanded="false">
                Employee
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link dropdown-toggle" href="customer.jsp" role="button"
                 data-bs-toggle="dropdown"
                 aria-expanded="false">
                Customer
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link dropdown-toggle" href="service.jsp" role="button"
                 data-bs-toggle="dropdown"
                 aria-expanded="false">
                Service
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>
            <li class="nav-item">
              <a class="nav-link dropdown-toggle" href="contract.jsp" role="button"
                 data-bs-toggle="dropdown"
                 aria-expanded="false">
                Contract
              </a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">Action</a></li>
                <li><a class="dropdown-item" href="#">Another action</a></li>
                <li>
                  <hr class="dropdown-divider">
                </li>
                <li><a class="dropdown-item" href="#">Something else here</a></li>
              </ul>
            </li>
          </ul>
          <form class="d-flex" role="search">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          </form>
        </div>
      </div>
    </nav>
  </div>
  <div class="row body bg-light ">
    <p class="text-center my-3">LIST CUSTOMER </p>
    <div>
      <button type="submit" class="btn btn-light" name="action" value="create"><a href="furama?action=create">ADD NEW Customer</a></button>
    </div>

    <table class="table text-center">
      <thead>
      <tr>
        <th scope="col">Mã Khách Hàng</th>
        <th scope="col">Mã Loại Khách</th>
        <th scope="col">Họ Tên</th>
        <th scope="col">Ngày Sinh</th>
        <th scope="col">Giới Tính</th>
        <th scope="col">Số CMND</th>
        <th scope="col">Điện Thoại</th>
        <th scope="col">Email</th>
        <th scope="col">Action</th>
      </tr>
      </thead>
      <tbody class="table-group-divider">
      <tr>
        <c:forEach var="customer" items="${CustomerList}">
        <th>${customer.ma_khach_hang}</th>
        <td>${customer.ma_loai_khach}</td>
        <td>${customer.ho_ten}</td>
        <td>${customer.ngay_sinh}</td>
        <td>${customer.so_cmnd}</td>
        <td>${customer.so_dien_thoai}</td>
        <td>${customer.email}</td>
        <td>${customer.dia_chi}</td>
        <td>
          <button type="button" class="btn btn-primary">EDIT</button>
        </td>
        <td>
          <!-- Button trigger modal -->
          <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
            DELETE
          </button>
          <!-- Modal -->
          <div class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5">Modal title</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal"
                          aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  Are you sure ?
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Yes</button>
                  <button type="button" class="btn btn-primary">No</button>
                </div>
              </div>
            </div>
          </div>
        </td>
      </tr>
      </c:forEach>

      </tbody>
    </table>
  </div>
  <div class="footer">
    <a class="col d-flex justify-content-center">Footer</a>
  </div>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</html>
