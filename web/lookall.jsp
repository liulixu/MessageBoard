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
		<%--// ����ת��--%>
		<%--request.setCharacterEncoding("GB2312") ;--%>
		<%--if(session.getAttribute("uname")!=null)--%>
		<%--{--%>
			<%--// �û��ѵ�½--%>
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
      out.println("���⣺"+rs.getString("title"));
      %><br><%
      out.println("���ߣ�"+rs.getString("author"));
  %><br><%
      out.println("���飺"+rs.getString("news"));
    }
  %><br>
    <br>
    <a href="list_notes.jsp">����</a>
</form>
  </center>
<br>
<br>
ϵͳ��ǰʱ�䣺<%=(new java.util.Date()).toLocaleString()%>&nbsp;��ǰ�û���<%=session.getAttribute("uname")%>&nbsp;<a href="login.jsp">ע����¼</a>
</body>
</html>
