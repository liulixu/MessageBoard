<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>MessageBoard——查询</title>
</head>
<body>
<center>
	<h1>MessageBoard </h1>
	<hr>
	<br>
	<%
		// 编码转换
		request.setCharacterEncoding("GB2312") ;
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>
	<%!
		String DBDRIVER			= "com.mysql.jdbc.Driver" ;//定义MySQL数据库驱动程序
		String DBURL			= "jdbc:mysql://localhost:3306/01" ;//定义MySQ数据库的连接地址
		String DBUSER			= "root" ;//MySQ数据库的连接用户名
		String DBPASSWORD		= "root" ;//MySQ数据库的连接密码
		Connection conn			= null ; //数据库连接
		PreparedStatement pstmt	= null ;
		ResultSet rs			= null ;
	%>
	<%
		// 如果有内容，则修改变量i，如果没有，则根据i的值进行无内容提示
		int i = 0 ;
		String sql = null; 
		String keyword = request.getParameter("keyword") ;
		// out.println(keyword) ;
		if(keyword==null)
		{
			// 没有任何查询条件
			sql = "SELECT id,title,author,content FROM note" ;
		}
		else
		{
			// 有查询条件
			sql = "SELECT id,title,author,content FROM note WHERE title like ? or author like ? or content like ?" ;
		}
		
		try
		{
			Class.forName(DBDRIVER) ;//加载驱动程序
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
			pstmt = conn.prepareStatement(sql) ;

			// 如果存在查询内容，则需要设置查询条件
			if(keyword!=null)
			{
				// 存在查询条件
				pstmt.setString(1,"%"+keyword+"%") ;
				pstmt.setString(2,"%"+keyword+"%") ;
				pstmt.setString(3,"%"+keyword+"%") ;
			}

			rs = pstmt.executeQuery() ;
	%>
<form action="list_notes.jsp" method="POST">
	模糊查询：<input type="text" name="keyword">
	<input type="submit" value="查询"></h3>&nbsp;<a href="insert.jsp">添加新留言</a></h3>
</form>

<table width="80%" border="1">
	<tr>
		<td>留言ID</td>
		<td>标题</td>
		<td>作者</td>
		<td>概要</td>
		<td colspan="2" style="text-align: center">操作</td>
	</tr>
	<%
			while(rs.next())
			{
				i++ ;
				// 进行循环打印，打印出所有的内容，以表格形式
				// 从数据库中取出内容
				int id = rs.getInt(1) ;
				String title = rs.getString(2) ;
				String author = rs.getString(3) ;
				String content = rs.getString(4) ;

				if(keyword!=null)
				{
					// 需要将数据返红
					title = title.replaceAll(keyword,"<font color=\"red\">"+keyword+"</font>") ;
					author = author.replaceAll(keyword,"<font color=\"red\">"+keyword+"</font>") ;
					content = content.replaceAll(keyword,"<font color=\"red\">"+keyword+"</font>") ;

				}
	%>
				<tr>
					<td><%=id%></td>
					<td><a href="update.jsp?id=<%=id%>"><%=title%></a></td>
					<td><%=author%></td>
					<td><%=content%></td>
					<td><a href="delete_do.jsp?id=<%=id%>">删除</a></td>
					<td><a href="lookall.jsp?id=<%=id%>">详情</a> </td>
				</tr>
	<%
			}
			// 判断i的值是否改变，如果改变，则表示有内容，反之，无内容
			if(i==0)
			{
				// 进行提示
	%>
				<tr>
					<td colspan="5">没有任何内容！！！</td>
				</tr>
	<%
			}
	%>
</table>
	<%
			rs.close() ;
			pstmt.close() ;
			conn.close() ; //数据库关闭
		}
		catch(Exception e)
		{}
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
<br>
系统当前时间：<%=(new java.util.Date()).toLocaleString()%>&nbsp;当前用户：<%=session.getAttribute("uname")%>&nbsp;<a href="login.jsp">注销登录</a>
</body>
</html>