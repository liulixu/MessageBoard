<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>MessageBoard������½</title>
</head>
<body>
<form action="login_conf.jsp" method="post">
	<h1 align="center" >MessageBoard </h1>
	<hr>
	<br>
	<%
		// �ж��Ƿ��д�����Ϣ����������ӡ
		// ���û�д˶δ��룬����ʾʱ��ֱ�Ӵ�ӡnull
		if(request.getAttribute("err")!=null)
		{
	%>
			<h2><%=request.getAttribute("err")%></h2>
	<%
		}
	%>
	<form >
		<table align="center">
		<h2 align="center">�û���½</h2>

			<tr align="center">
				<td>�û�����</td>
				<td><input type="text" name="name"></td>
			</tr>

			<tr align="center">
				<td>���룺</td>
				<td><input type="password" name="password"></td>
			</tr>

			<tr align="center">
				<td colspan="2">
					<br>
					<input type="submit" value="��½">
					<input type="reset" value="����">
					<a href="reg.jsp"><input type="button" value="ע��"></a>
				</td>
			</tr>
		</table>
		ϵͳ��ǰʱ�䣺<%=(new java.util.Date()).toLocaleString()%>
	</form>
</form>
</body>
</html>