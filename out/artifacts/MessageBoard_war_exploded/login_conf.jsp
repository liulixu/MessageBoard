<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>MessageBoard������½</title>
</head>
<body>
<center>
	<h1>MessageBoard </h1>
	<hr>
	<br>
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
		// ����һ��boolean���������ڱ����û��Ƿ�Ϸ���״̬
		boolean flag = false ;

		// ���ղ���
		String name = request.getParameter("name") ;
		String password = request.getParameter("password") ;
	%>
	<%
		String sql = "SELECT name FROM person WHERE name=? and password=?" ;
		try
		{
			Class.forName(DBDRIVER) ;
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1,name) ;
			pstmt.setString(2,password) ;
			rs = pstmt.executeQuery() ;
			if(rs.next())
			{
				// �û��Ϸ�
				flag = true ;
				// ���û���������session֮��
				session.setAttribute("uname",rs.getString(1)) ;
			}
			else
			{
				// ���������Ϣ
				request.setAttribute("err","������û��������룡����") ;
			}
			rs.close() ;
			pstmt.close() ;
			conn.close() ;
		}
		catch(Exception e)
		{}
	%>
	<%
		// ��ת
		if(flag)
		{
			// �û��Ϸ�
	%>
			<jsp:forward page="login_success.jsp"/>
	<%
		}
		else
		{
			// �û��Ƿ�
	%>
			<jsp:forward page="login.jsp"/>
	<%
		}
	%>
</center>
ϵͳ��ǰʱ�䣺<%=(new java.util.Date()).toLocaleString()%>
</body>
</html>