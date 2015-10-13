<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>MessageBoard——登陆</title>
</head>
<body>
<form action="login_conf.jsp" method="post">
	<h1 align="center" >MessageBoard </h1>
	<hr>
	<br>
	<%
		// 判断是否有错误信息，如果有则打印
		// 如果没有此段代码，则显示时会直接打印null
		if(request.getAttribute("err")!=null)
		{
	%>
			<h2><%=request.getAttribute("err")%></h2>
	<%
		}
	%>
	<form >
		<table align="center">
		<h2 align="center">用户登陆</h2>

			<tr align="center">
				<td>用户名：</td>
				<td><input type="text" name="name"></td>
			</tr>

			<tr align="center">
				<td>密码：</td>
				<td><input type="password" name="password"></td>
			</tr>

			<tr align="center">
				<td colspan="2">
					<br>
					<input type="submit" value="登陆">
					<input type="reset" value="重置">
					<a href="reg.jsp"><input type="button" value="注册"></a>
				</td>
			</tr>
		</table>
		系统当前时间：<%=(new java.util.Date()).toLocaleString()%>
	</form>
</form>
</body>
</html>