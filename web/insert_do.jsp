<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>MessageBoard�������</title>
</head>
<body>
<center>
	<h1>MessageBoard ���� JSP + JDBCʵ��</h1>
	<hr>
	<br>
	<%
		// �������봦��
		request.setCharacterEncoding("GB2312") ;
	%>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// �û��ѵ�½
	%>
	<%!
		//�������ݿ�
		String DBDRIVER			= "com.mysql.jdbc.Driver" ;
		String DBURL			= "jdbc:mysql://localhost:3306/01" ;
		String DBUSER			= "root" ;
		String DBPASSWORD		= "root" ;
		Connection conn			= null ;
		PreparedStatement pstmt	= null ;
		ResultSet rs			= null ;
	%>
	<%
		// ����һ��boolean����
		boolean flag = false ;

		// ���ղ������ı����л�ȡ��ֵ���ؼ������ı����name����
		String title = request.getParameter("title") ;
		String author = request.getParameter("author") ;
		String content = request.getParameter("content") ;
		String news=request.getParameter("news");
	%>
	<%
		// ����note���е�������sequence���ɡ�SQL��Ӵ��롾INSERT INTO ����(���е��ֶ�1�����е��ֶ�2)VALUES(?,?)��
		String sql = "INSERT INTO note(title,author,content,news) VALUES(?,?,?,?)" ;
		try
		{
			//sql����
			Class.forName(DBDRIVER) ;
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
			pstmt = conn.prepareStatement(sql) ;
			//�����з�ֵ
			pstmt.setString(1,title) ;
			pstmt.setString(2,author) ;
			pstmt.setString(3,content) ;
			pstmt.setString(4,news);
			pstmt.executeUpdate() ;
			pstmt.close() ;
			conn.close() ;
			// �������ɹ�����϶���ִ�е��˶δ���
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
				������ӳɹ�<br>
				<a href="list_notes.jsp">���ؼ�����ѯ</a>������
	<%
			}
			else
			{
	%>
				�������ʧ��<br>
				<a href="list_notes.jsp">���ؼ�����ѯ</a>������
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