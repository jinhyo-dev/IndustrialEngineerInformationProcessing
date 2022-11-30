<%@ page language="java" import="java.sql.*" import="ojdbc.Connect" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>학과 목록</title>
</head>
<body>
<%@ include file ="header.jsp"%>
<h1>학과목록</h1>
<table width="600" border="1" align="center">
	<thead>
		<td>학과코드</td>
		<td>학과명</td>
		<td>학과연락처</td>
	</thead>
	
	<tbody>
			<%
				Connection con = Connect.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = null;
				
				String SQL = "select * from class order by class_code asc";
				rs = stmt.executeQuery(SQL);
				
				while(rs.next()) {
					String classcode = rs.getString(1);
					String classname = rs.getString(2);
					String classphone = rs.getString(3);
				
			%>
			<tr>
				<td><%= classcode %></td>
				<td><%= classname %></td>
				<td><%= classphone %></td>
			</tr>
			
			<%
				}
				stmt.close();
				con.close();
			%>
	</tbody>
</table>
</body>
</html>