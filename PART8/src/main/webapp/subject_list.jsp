<%@ page language="java" import="java.sql.*" import="ojdbc.Connect" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Subject List</title>
</head>
<body>
<%@ include file ="header.jsp" %>
	<h1>���� ���</h1>
	<table border="1" align="center">
		<tr>
			<td>�����ڵ�</td>
			<td>�����</td>
			<td>����Ұ�</td>
		</tr>
		
		<%
			Connection con = Connect.getConnection();
			Statement stmt = con.createStatement();
			String SQL = "select * from subject order by sub_code asc";
			ResultSet rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				String subcode = rs.getString(1);
				String subname = rs.getString(2);
				String subtext = rs.getString(3);
		%>
		<tr>
			<td><%=subcode %></td>
			<td><%=subname %></td>
			<td><%=subtext %></td>
		</tr>
		<%
			}
			rs.close();
			stmt.close();
			con.close();
		%>
	</table>
</body>
</html>