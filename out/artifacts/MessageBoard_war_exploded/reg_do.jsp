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
  // �������봦��
  request.setCharacterEncoding("GB2312") ;
%>
<%
  if(session.getAttribute("uname")!=null) {
    // �û��ѵ�½
  }
%>
<%!
  //�������ݿ�
  String DBDRIVER			= "com.mysql.jdbc.Driver" ;
  String DBURL			= "jdbc:mysql://localhost:3306/01" ;
  String DBUSER			= "root" ;
  String DBPASSWORD		= "root" ;
  Connection conn			= null ;
  PreparedStatement pstmt	= null ;
  ResultSet rs			    = null ;
%>
<%
  //����һ������
  boolean flag = false ;
  //���ղ���
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
      ע��ɹ�<br>
      ���ĵ�¼��Ϊ��<%out.print(name);%>&nbsp;���μǣ�<br>
      <a href="login.jsp">���ص�¼����</a>
      <%
    }
      else {%>

        <p align="center">��������ȷ���˺��Լ����룡</p>
        <p align="center"><a href="reg.jsp">��������ע�ᣡ</a></p>
      <%
      }
    %>
ϵͳ��ǰʱ�䣺<%=(new java.util.Date()).toLocaleString()%>
</body>
</html>