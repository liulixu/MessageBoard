<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>MessageBoard����ɾ��</title>
</head>
<body>
<center>
	<h1>MessageBoard </h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// �û��ѵ�½
	%>	
	<%!
		String DBDRIVER			= "com.mysql.jdbc.Driver" ;
		String DBURL			= "jdbc:mysql://localhost:3306/01" ;
		String DBUSER			= "root" ;
		String DBPASSWORD		= "root" ;
		Connection conn			= null ;
		PreparedStatement pstmt	= null ;
		ResultSet rs			= null ;
	%>
	<%
		// ���ղ���
		int id = 0 ;
		try
		{
			id = Integer.parseInt(request.getParameter("id")) ;
		}
		catch(Exception e)
		{}
	%>
	<%
		String sql = "DELETE FROM note WHERE id=?" ;
		boolean flag = false ;
		try
		{
			Class.forName(DBDRIVER) ;
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
			pstmt = conn.prepareStatement(sql) ;
			// ����ɾ������
			pstmt.setInt(1,id) ;
			pstmt.executeUpdate() ;			
			pstmt.close() ;
			conn.close() ;
			flag = true ;
		}
		catch(Exception e)
		{}
	%>
	<%
			response.setHeader("refresh","2;URL=list_notes.jsp") ;
			if(flag)
			{
	%>
				����ɾ���ɹ����������ת�������б�ҳ������<br>
				���û����ת���밴<a href="list_notes.jsp">����</a>������
	<%
			}
			else
			{
	%>
				����ɾ��ʧ�ܣ��������ת�������б�ҳ������<br>
				���û����ת���밴<a href="list_notes.jsp">����</a>������
	<%
			}
	%>
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
</body>
</html>