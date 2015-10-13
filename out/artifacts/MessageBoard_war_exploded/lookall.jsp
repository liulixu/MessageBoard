<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%--
  Created by IntelliJ IDEA.
  User: erdaye
  Date: 2015/8/20
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title></title>
</head>
<body>
<center>
  <h1>MessageBoard </h1>
  <hr>
  <br>
    <%--<%--%>
		<%--// 编码转换--%>
		<%--request.setCharacterEncoding("GB2312") ;--%>
		<%--if(session.getAttribute("uname")!=null)--%>
		<%--{--%>
			<%--// 用户已登陆--%>
	<%--%>--%>
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
    int id=0;
    try {
        id=Integer.parseInt(request.getParameter("id"));

    }
    catch (Exception e){}
  %>
  <%
    String sql="SELECT title,author,news FROM note WHERE id="+id;

    try {
      Class.forName(DBDRIVER) ;
      conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD) ;
      pstmt = conn.prepareStatement(sql) ;
      rs=pstmt.executeQuery();

    }
    catch (Exception e)
    {}
  %>







  <form style="width:300pt;text-align: left">
  <%
    while (rs.next())
    {
      out.println("标题："+rs.getString("title"));
      %><br><%
      out.println("作者："+rs.getString("author"));
  %><br><%
      out.println("详情："+rs.getString("news"));
    }
  %><br>
    <br>
    <a href="list_notes.jsp">返回</a>
</form>
  </center>
<br>
<br>
系统当前时间：<%=(new java.util.Date()).toLocaleString()%>&nbsp;当前用户：<%=session.getAttribute("uname")%>&nbsp;<a href="login.jsp">注销登录</a>
</body>
</html>
