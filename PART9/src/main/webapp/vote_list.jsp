<%@ page language="java" import="java.sql.*" import="Database.Connect"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표 결과</title>
</head>
<body>
	<%@ include file = "header.jsp"%>
	<div>
	<h2 align="left">투표 결과</h2>
	<table border="1" width="800">
		<tr>
			<td>이름</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>투표번호</td>
			<td>투표시간</td>
			<td>개인정보이용동의</td>
		</tr>
		<%
		Connection con = Connect.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String SQL = "select * from tbl_vote";
		rs = stmt.executeQuery(SQL);

		while (rs.next()) {
			String name = rs.getString(2);
			String birth = rs.getString(1);
			String gender = "";
			String year = birth.substring(6, 7);
			switch (year) {
			case "1":
				gender = "남";
				year = "19" + birth.substring(0, 2);
				break;
			case "2":
				gender = "여";
				year = "19" + birth.substring(0, 2);
				break;
			case "3":
				gender = "남";
				year = "20" + birth.substring(0, 2);
				break;
			case "4":
				gender = "남";
				year = "20" + birth.substring(0, 2);
				break;
			default:
				gender = "transgender";
				year = "year";
			}
			birth = year + "년" + birth.substring(2, 4) + "월" + birth.substring(4, 6) + "일";

			String choice_no = rs.getString(3);
			String time = rs.getString(4);
			String confirm = rs.getString(6);
			if (confirm.equals("Y"))
				confirm = "동의";
			else
				confirm = "미동의";
			%>
			
			<tr>
				<td><%= name %></td>
				<td><%= birth %></td>
				<td><%= gender %></td>
				<td><%= choice_no %></td>
				<td><%= time %></td>
				<td><%= confirm %></td>
			</tr>
			<%
			}
			stmt.close();
			con.close();
			%>
	</table>
	<a href="main.jsp">홈으로</a>
	</div>
	<%@ include file ="footer.jsp" %>
</body>
</html>