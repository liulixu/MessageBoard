<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<%--
  Created by IntelliJ IDEA.
  User: erdaye
  Date: 2015/8/19
  Time: 16:36
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title></title>
</head>
<body>
<h1 align="center">MessageBoard</h1>
<hr>
<br>
<%
  // 进行乱码处理
  request.setCharacterEncoding("GB2312") ;
%>
<%
  if(session.getAttribute("uname")!=null) {
    // 用户已登陆
  }
%>
<%!
  //连接数据库
  String DBDRIVER			= "com.mysql.jdbc.Driver" ;
  String DBURL			= "jdbc:mysql://localhost:3306/01" ;
  String DBUSER			= "root" ;
  String DBPASSWORD		= "root" ;
  Connection conn			= null ;
  PreparedStatement pstmt	= null ;
  ResultSet rs			    = null ;
%>
<%
  //声明一个变量
  boolean flag = false ;
  //接收参数
  String name=request.getParameter("name");
  String password=request.getParameter("password");

  if (name!=""&&password!="") {
    String sql = "INSERT INTO person(name,password) VALUES(?,?)" ;
    try {
      Class.forName(DBDRIVER);
      conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
      pstmt = conn.prepareStatement(sql) ;
      pstmt.setString(1,name) ;
      pstmt.setString(2,password) ;
      pstmt.executeUpdate() ;
      pstmt.close() ;
      conn.close() ;
      flag=true;

    }
    catch (Exception e)
    {}
  }
  else {
    %>
<p align="center" style="color: red;font-size: 20pt"><strong>default!</strong></p>
<%
    }

%>

  <%
    response.setHeader("refresh","1000;URL=list_notes.jsp");
    if(flag){%>
      注册成功<br>
      您的登录名为：<%out.print(name);%>&nbsp;请牢记！<br>
      <a href="login.jsp">返回登录窗口</a>
      <%
    }
      else {%>

        <p align="center">请输入正确的账号以及密码！</p>
        <p align="center"><a href="reg.jsp">返回重新注册！</a></p>
      <%
      }
    %>
系统当前时间：<%=(new java.util.Date()).toLocaleString()%>
</body>
</html>