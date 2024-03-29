<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>MessageBoard——登陆</title>
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
		// 声明一个boolean变量，用于保存用户是否合法的状态
		boolean flag = false ;

		// 接收参数
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
				// 用户合法
				flag = true ;
				// 将用户名保存在session之中
				session.setAttribute("uname",rs.getString(1)) ;
			}
			else
			{
				// 保存错误信息
				request.setAttribute("err","错误的用户名及密码！！！") ;
			}
			rs.close() ;
			pstmt.close() ;
			conn.close() ;
		}
		catch(Exception e)
		{}
	%>
	<%
		// 跳转
		if(flag)
		{
			// 用户合法
	%>
			<jsp:forward page="login_success.jsp"/>
	<%
		}
		else
		{
			// 用户非法
	%>
			<jsp:forward page="login.jsp"/>
	<%
		}
	%>
</center>
系统当前时间：<%=(new java.util.Date()).toLocaleString()%>
</body>
</html>