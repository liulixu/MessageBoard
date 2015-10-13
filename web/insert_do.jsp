<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>MessageBoard——添加</title>
</head>
<body>
<center>
	<h1>MessageBoard —— JSP + JDBC实现</h1>
	<hr>
	<br>
	<%
		// 进行乱码处理
		request.setCharacterEncoding("GB2312") ;
	%>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>
	<%!
		//连接数据库
		String DBDRIVER			= "com.mysql.jdbc.Driver" ;
		String DBURL			= "jdbc:mysql://localhost:3306/01" ;
		String DBUSER			= "root" ;
		String DBPASSWORD		= "root" ;
		Connection conn			= null ;
		PreparedStatement pstmt	= null ;
		ResultSet rs			= null ;
	%>
	<%
		// 声明一个boolean变量
		boolean flag = false ;

		// 接收参数从文本框中获取的值，关键字是文本框的name属性
		String title = request.getParameter("title") ;
		String author = request.getParameter("author") ;
		String content = request.getParameter("content") ;
		String news=request.getParameter("news");
	%>
	<%
		// 现在note表中的主键是sequence生成。SQL添加代码【INSERT INTO 表名(表中的字段1，表中的字段2)VALUES(?,?)】
		String sql = "INSERT INTO note(title,author,content,news) VALUES(?,?,?,?)" ;
		try
		{
			//sql操作
			Class.forName(DBDRIVER) ;
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
			pstmt = conn.prepareStatement(sql) ;
			//往表中放值
			pstmt.setString(1,title) ;
			pstmt.setString(2,author) ;
			pstmt.setString(3,content) ;
			pstmt.setString(4,news);
			pstmt.executeUpdate() ;
			pstmt.close() ;
			conn.close() ;
			// 如果插入成功，则肯定能执行到此段代码
			flag = true ;
		}
		catch(Exception e)
		{}
	%>
	<%
			response.setHeader("refresh","1000;URL=list_notes.jsp") ;
			if(flag)
			{
	%>
				留言添加成功<br>
				<a href="list_notes.jsp">返回继续查询</a>！！！
	<%
			}
			else
			{
	%>
				留言添加失败<br>
				<a href="list_notes.jsp">返回继续查询</a>！！！
	<%
			}
	%>
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
</body>
</html>