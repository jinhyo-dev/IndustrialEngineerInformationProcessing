<%@ page language="java" import="java.sql.*" import="DB.Connect" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표결과</title>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<h3>투표결과 조회</h3>
	<table border="1">
		<tr>
			<td>이름</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>후보번호</td>
			<td>투표시간</td>
			<td>유권자 확인</td>
		</tr>
	
	<%
		Connection con = Connect.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		
		String sql = "select * from tbl_vote";
		rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
			String jumin = rs.getString(1);
			String name = rs.getString(2);
			
			String gender = "";
			if (jumin.substring(6, 7).equals("3")) {
				gender = "남";
			} else {
				System.out.println(jumin.substring(6, 7));
				gender = "여";
			}
			
			String birth = "20" + jumin.substring(0, 2) + "년" + jumin.substring(2, 4) + "월"
					+ jumin.substring(4, 6) + "일생";
			
			String candidateNumber = rs.getString(3);
			String time = rs.getString(4);
			
			time =  time.substring(0, 2) + ":" + time.substring(2, 4); 
			String confirm = rs.getString(6);
			
			if (confirm.equals("Y")) confirm = "확인";
			else confirm = "미확인";
			
	%>
		<tr>
			<td><%= name %></td>
			<td><%= birth %></td>
			<td><%= gender %></td>
			<td><%= candidateNumber %></td>
			<td><%= time %></td>
			<td><%= confirm %></td>
		</tr>
		
	<%
		}
		stmt.close();
		con.close();
	%>
	</table>
	<a href="index.jsp">홈으로</a>
	<%@ include file = "footer.jsp" %>
</body>
</html>