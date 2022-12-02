<%@ page language="java" import="java.sql.*" import="DB.Connect"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member list</title>
</head>
<body>
<%@ include file = "header.jsp" %>
	<h3>회원목록</h3>
	<table border="1">
		<tr>
			<th>회원ID</th>
			<th>회원명</th>
			<th>비밀번호</th>
			<th>주민등록번호</th>
			<th>성별</th>
			<th>주소</th>
			<th>직업</th>
			<th>메일수신</th>
			<th>자기소개</th>
		</tr>

		<%
		Connection con = Connect.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;

		String SQL = "select * from tbl_guest";
		rs = stmt.executeQuery(SQL);

		while (rs.next()) {
			String userid = rs.getString(1);
			String usernm = rs.getString(2);
			String password = rs.getString(3);
			String jumin = rs.getString(4);
			jumin = jumin.substring(0, 6) + "-" + jumin.substring(6, 7) + "******";
			String gender = rs.getString(5);

			if (gender.equals("1")) {
				gender = "남";				
			} else {
				gender = "여";
			}
			
			String address = rs.getString(6);
			int job = rs.getInt(7);
			String jobName = "";
			switch(job) {
			case 1: jobName = "학생"; break;
			case 2: jobName = "회사원"; break;
			case 3: jobName = "군인"; break;
			case 4: jobName = "공무원"; break;
			case 9: jobName = "기타"; break;
			}
			String mailrcv = rs.getString(8);
			String intro = rs.getString(9);
		%>

		<tr>
			<td><%=userid%></td>
			<td><%=usernm%></td>
			<td><%=password%></td>
			<td><%=jumin%></td>
			<td><%=gender%></td>
			<td><%=address%></td>
			<td><%=jobName%></td>
			<td><%=mailrcv%></td>
			<td><%=intro%></td>
		</tr>

		<%
		}
		stmt.close();
		con.close();
		%>
	</table>
	<a href="index.jsp">홈으로</a>
	<%@ include file ="footer.jsp" %>
</body>
</html>