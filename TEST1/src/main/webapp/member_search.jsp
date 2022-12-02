<%@ page language="java" import="java.sql.*" import="DB.Connect" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<%
		request.setCharacterEncoding("UTF-8");
		String preValue = request.getParameter("preValue");
		if (preValue == null) preValue = "";
	%>
	
	<h3>회원검색</h3>
	<form action="member_search.jsp" name="form" method="post">
		<span>검색조건: </span>
		<select name="option">
			<option value="usernm">회원이름</option>
			<option value="userid">회원ID</option>
		</select>
		<input name="searchValue" value="<%= preValue %>">
		<input type="submit" value="검색">
	</form>
	
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
			String sql = "select * from tbl_guest";
			
			String option = request.getParameter("option");
			String searchValue = request.getParameter("searchValue");
			
			if (searchValue != null) {
				sql += " where " + option + " like '%" + searchValue + "%' order by " + option + " asc";
			}
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				String userid = rs.getString(1);
				String usernm = rs.getString(2);
				String password = rs.getString(3);
				String jumin = rs.getString(4);
				String gender = rs.getString(5);
				String address = rs.getString(6);
				String job = rs.getString(7);
				String mailrcv = rs.getString(8);
				String intro = rs.getString(9);
				
		%>
		
		<tr>
			<td><%= userid %></td>
			<td><%= usernm %></td>
			<td><%= password %></td>
			<td><%= jumin %></td>
			<td><%= gender %></td>
			<td><%= address %></td>
			<td><%= job %></td>
			<td><%= mailrcv %></td>
			<td><%= intro %></td>
		</tr>
		
		<%
			}
			
			stmt.close();
			con.close();
		%>
	</table>
</body>
</html>