<%@ page language="java" import="java.sql.*" import="ojdbc.Connect"
	contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Request List</title>
</head>
<body>
<%@ include file = "header.jsp" %>
	<h1>�������</h1>
	<table border="1">
		<tr>
			<td>������û���</td>
			<td>�л��ڵ�</td>
			<td>�����ڵ�</td>
			<td>��û��</td>
		</tr>
		<%
		Connection con = Connect.getConnection();
		Statement stmt = con.createStatement();
		String SQL = "select * from request order by add_code asc";
		ResultSet rs = stmt.executeQuery(SQL);

		while (rs.next()) {
			String addcode = rs.getString(1);
			String stucode = rs.getString(2);
			String subcode = rs.getString(3);
			String adddate = rs.getString(4);
		%>
		<tr>
			<td><%=addcode%></td>
			<td><%=stucode%></td>
			<td><%=subcode%></td>
			<td><%=adddate%></td>
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