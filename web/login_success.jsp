<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>MessageBoard——登陆</title>
</head>
<body>
<center>
	<h1>MessageBoard</h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			/* 用户已登陆 */
	%>
			<h2>登陆成功</h2>
			<h2>欢迎<font color="red" size="12">
				<%=session.getAttribute("uname")%>
			</font>光临MessgeBoard</h2>
			<h3><a href="list_notes.jsp">进入留言管理页面</a></h3>
	<%
		}
		else
		{
			// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","2;URL=login.jsp") ;
	%>
			您还未登陆，请先登陆！！！<br>
			两秒后自动跳转到登陆窗口！！！<br>
			如果没有跳转，请按<a href="login.jsp">这里</a>！！！<br>
	<%
		}
	%>
</center>
系统当前时间：<%=(new java.util.Date()).toLocaleString()%>
</body>
</html>