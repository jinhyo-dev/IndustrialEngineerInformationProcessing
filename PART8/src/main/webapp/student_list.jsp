<%@ page language="java" import="java.sql.*" import="ojdbc.Connect"
	contentType="text/html; charset=EUC-KR" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Student List</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h1>학생 목록</h1>
	<table border="1">
		<tr>
			<td>학생코드</td>
			<td>이름</td>
			<td>주소</td>
			<td>생년월일</td>
			<td>학과명</td>
		</tr>
		<%
			Connection con = Connect.getConnection();
			Statement stmt = con.createStatement();
			String SQL = "select * from student order by stu_code asc";
			
			ResultSet rs = stmt.executeQuery(SQL);
			
			while(rs.next()) {
				String stucode = rs.getString(1);
				String stuname = rs.getString(2);
				String stuaddress = rs.getString(3);
				String stubir = rs.getString(4);
				String classcode = rs.getString(5);
				
				if (classcode.contains("A001")) {
					classcode = "소프트웨어개발과";
				} else if (classcode.contains("A002")) {
					classcode = "사물인터넷과";
				} else {
					classcode = "게임개발과";
				}
		%>
		<tr>
			<td><%=stucode %></td>
			<td><%=stuname %></td>
			<td><%=stuaddress %></td>
			<td><%=stubir %></td>
			<td><%=classcode %></td>
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