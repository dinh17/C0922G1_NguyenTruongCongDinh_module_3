<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 1/1/2023
  Time: 4:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Calculator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  </head>
  <body>
  <form action="/calculate" method="post">
    <div class="mb-3">
      <label class="form-label">First operand</label>
      <input type="number" class="form-control" name="f-operand" >
    </div>

    <div class="input-group mb-3">
      <select class="form-select" id="inputGroupSelect03" aria-label="Example select with button addon" selected name="operator">
        <%--            <option >Choose operator</option>--%>
        <option value="+" >Addition</option>
        <option value="-" >Subtraction</option>
        <option value="*" >Multiplication</option>
        <option value="/" >Division</option>
      </select>
    </div>

    <div class="mb-3">
      <label class="form-label">Second operand</label>
      <input type="number" class="form-control" name="s-operand">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
          crossorigin="anonymous"></script>
  </body>
</html>
