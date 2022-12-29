<%--
  Created by IntelliJ IDEA.
  User: OS
  Date: 12/29/2022
  Time: 3:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<div style="margin-left: 440px;border: 1px solid;width: 600px">
    <h2 style="text-align: center">Calculator Discount Product</h2>
    <form method="post" action="/Caculator">
        <label style="margin: 30px">Product Description</label>
        <input type="text" name="description" value="Senpai" style="margin-left: 32px;margin-top: 20px"/><br/>
        <label style="margin: 30px"> List price </label>
        <input type="number" name="price" value="0" style="margin-left: 37px;margin-top: 20px"/><br/>
        <label style="margin: 30px">Discount Percent (%): </label>
        <input type="number" name="percent" value="0" style="margin-left: 23px;margin-top: 20px"/><br/>
        <input type="submit" id="submit" value="Calculate Discount" style="margin-left: 240px;margin-top: 20px"/><br/>

    </form>


</div>
</body>
</html>
