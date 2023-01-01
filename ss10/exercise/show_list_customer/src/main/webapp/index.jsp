<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 1/1/2023
  Time: 3:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Show List Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        h1{
            text-align: center;
        }
        img{
            height: 50px;
            width: 50px;
        }
        td,th{
            text-align: center;
            justify-content: center;
            place-content: center;
        }
    </style>
</head>
<body>
<div><h1>Danh Sách Khách Hàng</h1></div>
<div >
    <table class="table table-trigger" >
    <tr>
        <th>Tên</th>
        <th> Ngày sinh</th>
        <th>Địa Chỉ</th>
        <th>Ảnh</th>
    </tr>
    <tr>
        <td>Mai Văn Hoàn</td>
        <td>1983-08-29</td>
        <td>Hà Nội</td>
        <td><img src="img_fjords.jpg"></td>
    </tr>
        <tr>
            <td>Mai Văn Hoàn</td>
            <td>1983-08-29</td>
            <td>Hà Nội</td>
            <td><img src="img_fjords.jpg"></td>
        </tr>
        <tr>
            <td>Mai Văn Hoàn</td>
            <td>1983-08-29</td>
            <td>Hà Nội</td>
            <td><img src="img_fjords.jpg"></td>
        </tr>
        <tr>
            <td>Mai Văn Hoàn</td>
            <td>1983-08-29</td>
            <td>Hà Nội</td>
            <td><img src="img_fjords.jpg"></td>
        </tr>
    </table>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
