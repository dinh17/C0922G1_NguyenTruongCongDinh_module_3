<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 12/20/2022
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist\css\bootstrap.css">
    <link rel="stylesheet" href="../bootstrap-5.1.3-dist\css\styleWeb.css">
  </head>
  <body>
<%--  <c:redirect url="/view/customer/listCustomer.jsp"></c:redirect>--%>
<div >
  <%--header--%>
  <c:import url="view/include/header.jsp"></c:import>
</div>



<%--body--%>
<div class="row h-75 ">
  <div class="container ">
    <div class="container-fluid">
    <div class="col-3 border-1">
      <ul>
        <li>
          Item  one
        </li>
        <li>
          item two
        </li>
        <li>
          item three
        </li>
      </ul>
    </div>
    <div class="col-9">

    </div>
  </div><%--    container --%>
</div><%--container fluid--%>
</div> <%--    row --%>
<%--   end body --%>

<div >
  <%--    footer --%>
  <c:import url="view/include/footer.jsp"></c:import>
</div>





<script src="../bootstrap-5.1.3-dist\js\bootstrap.js"></script>
  </body>
</html>
