<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<title>MessageBoard������ѯ</title>
</head>
<body>
<center>
	<h1>MessageBoard </h1>
	<hr>
	<br>
	<%
		// ����ת��
		request.setCharacterEncoding("GB2312") ;
		if(session.getAttribute("uname")!=null)
		{
			// �û��ѵ�½
	%>
	<%!
		String DBDRIVER			= "com.mysql.jdbc.Driver" ;//����MySQL���ݿ���������
		String DBURL			= "jdbc:mysql://localhost:3306/01" ;//����MySQ���ݿ�����ӵ�ַ
		String DBUSER			= "root" ;//MySQ���ݿ�������û���
		String DBPASSWORD		= "root" ;//MySQ���ݿ����������
		Connection conn			= null ; //���ݿ�����
		PreparedStatement pstmt	= null ;
		ResultSet rs			= null ;
	%>
	<%
		// ��������ݣ����޸ı���i�����û�У������i��ֵ������������ʾ
		int i = 0 ;
		String sql = null; 
		String keyword = request.getParameter("keyword") ;
		// out.println(keyword) ;
		if(keyword==null)
		{
			// û���κβ�ѯ����
			sql = "SELECT id,title,author,content FROM note" ;
		}
		else
		{
			// �в�ѯ����
			sql = "SELECT id,title,author,content FROM note WHERE title like ? or author like ? or content like ?" ;
		}
		
		try
		{
			Class.forName(DBDRIVER) ;//������������
			conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;
			pstmt = conn.prepareStatement(sql) ;

			// ������ڲ�ѯ���ݣ�����Ҫ���ò�ѯ����
			if(keyword!=null)
			{
				// ���ڲ�ѯ����
				pstmt.setString(1,"%"+keyword+"%") ;
				pstmt.setString(2,"%"+keyword+"%") ;
				pstmt.setString(3,"%"+keyword+"%") ;
			}

			rs = pstmt.executeQuery() ;
	%>
<form action="list_notes.jsp" method="POST">
	ģ����ѯ��<input type="text" name="keyword">
	<input type="submit" value="��ѯ"></h3>&nbsp;<a href="insert.jsp">����������</a></h3>
</form>

<table width="80%" border="1">
	<tr>
		<td>����ID</td>
		<td>����</td>
		<td>����</td>
		<td>��Ҫ</td>
		<td colspan="2" style="text-align: center">����</td>
	</tr>
	<%
			while(rs.next())
			{
				i++ ;
				// ����ѭ����ӡ����ӡ�����е����ݣ��Ա�����ʽ
				// �����ݿ���ȡ������
				int id = rs.getInt(1) ;
				String title = rs.getString(2) ;
				String author = rs.getString(3) ;
				String content = rs.getString(4) ;

				if(keyword!=null)
				{
					// ��Ҫ�����ݷ���
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
					<td><a href="delete_do.jsp?id=<%=id%>">ɾ��</a></td>
					<td><a href="lookall.jsp?id=<%=id%>">����</a> </td>
				</tr>
	<%
			}
			// �ж�i��ֵ�Ƿ�ı䣬����ı䣬���ʾ�����ݣ���֮��������
			if(i==0)
			{
				// ������ʾ
	%>
				<tr>
					<td colspan="5">û���κ����ݣ�����</td>
				</tr>
	<%
			}
	%>
</table>
	<%
			rs.close() ;
			pstmt.close() ;
			conn.close() ; //���ݿ�ر�
		}
		catch(Exception e)
		{}
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
<br>
ϵͳ��ǰʱ�䣺<%=(new java.util.Date()).toLocaleString()%>&nbsp;��ǰ�û���<%=session.getAttribute("uname")%>&nbsp;<a href="login.jsp">ע����¼</a>
</body>
</html>