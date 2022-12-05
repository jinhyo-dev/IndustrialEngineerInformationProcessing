<%@ page language="java" import="java.sql.*" import="DB.Connect" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보자 순위</title>
</head>
<body>
<%@ include file = "header.jsp" %>
<h3>후보자 등록</h3>
<table border="1">
	<tr>
		<td>후보번호</td>
		<td>성명</td>
		<td>총득표수</td>
	</tr>
	
	<%
		Connection con = Connect.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		
		String sql  = "select A.NO, A.Name, COUNT(B.choice_no) as count "
					+ "from TBL_REGISTER A join TBL_VOTE B "
					+ "on A.NO = B.choice_no "
					+ "group by A.NO, A.Name "
					+ "order by COUNT(B.choice_no) desc, A.NO asc";
		
		rs = stmt.executeQuery(sql);
		
		while (rs.next()) {
			String candidateNumber = rs.getString(1);
			String name = rs.getString(2);
			String voteNumber = rs.getString(3);
			
	%>
	
	<tr>
		<td><%= candidateNumber %></td>
		<td><%= name %></td>
		<td><%= voteNumber %></td>
	</tr>
	
	
	<%
		}
		
		stmt.close();
		con.close();
	%>
</table>
<a href = "index.jsp">홈으로</a>
<%@ include file = "footer.jsp" %>
</body>
</html>