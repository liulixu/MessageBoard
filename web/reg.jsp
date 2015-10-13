<%--
  Created by IntelliJ IDEA.
  User: erdaye
  Date: 2015/8/19
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<h1 align="center">MessageBoard </h1>
<hr>
<br>
<form action="reg_do.jsp" method="post">
  <table align="center">
    <h2 align="center">用户注册</h2>
    <tr align="center">
      <td align="right">用户名：</td>
      <td><input type="text" name="name"></td>
    </tr>
    <tr align="center">
      <td align="right" >密码：</td>
      <td><input type="password" name="password"></td>
    </tr>
    <tr align="center">
      <td colspan="2">
        <br>
        <input type="submit" value="注册">
        <input type="reset" value="重置">
        <a href="login.jsp"><input type="button" value="返回登录"></a>
      </td>
    </tr>
  </table>
  系统当前时间：<%=(new java.util.Date()).toLocaleString()%>
</form>
</body>
</html>
