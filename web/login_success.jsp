<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>
	<title>MessageBoard������½</title>
</head>
<body>
<center>
	<h1>MessageBoard</h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			/* �û��ѵ�½ */
	%>
			<h2>��½�ɹ�</h2>
			<h2>��ӭ<font color="red" size="12">
				<%=session.getAttribute("uname")%>
			</font>����MessgeBoard</h2>
			<h3><a href="list_notes.jsp">�������Թ���ҳ��</a></h3>
	<%
		}
		else
		{
			// �û�δ��½����ʾ�û���½������ת
			response.setHeader("refresh","2;URL=login.jsp") ;
	%>
			����δ��½�����ȵ�½������<br>
			������Զ���ת����½���ڣ�����<br>
			���û����ת���밴<a href="login.jsp">����</a>������<br>
	<%
		}
	%>
</center>
ϵͳ��ǰʱ�䣺<%=(new java.util.Date()).toLocaleString()%>
</body>
</html>