<%@ page language="java" import="java.sql.*" import="Database.Connect" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote Rank</title>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<div class="section" style="min-height: 400px">
		<h2 align="left">후보자 순위</h2>
		<table border="1" width="600">
			<tr>
				<td>후보순위</td>
				<td>후보번호</td>
				<td>성명</td>
				<td>총득표수</td>
			</tr>
			
			<%
				Connection con = Connect.getConnection();
				Statement stmt = con.createStatement();
				ResultSet rs = null;
				
				String SQL = "select tr.NO, tr.Name, COUNT(tv.choice_no) as count"
							+ " from TBL_REGISTER tr join TBL_VOTE tv"
							+ " on tr.NO = tv.choice_no" 
							+ " group by tr.NO, tr.Name"
							+ " order by COUNT(tv.choice_no) desc, tr.NO asc";
				rs = stmt.executeQuery(SQL);
				int rank = 0;
				
				while(rs.next()) {
					String no = rs.getString(1);
					String name = rs.getString(2);
					String total = rs.getString(3);
			%>
			
			<tr>
				<td><%= ++rank %></td>
				<td><%= no %></td>
				<td><%= name %></td>
				<td><%= total %></td>
			</tr>
			
			<%
				}
				
				stmt.close();
				con.close();
			%>
		</table>
		<a href="main.jsp">홈으로</a>
		</div>
		<%@ include file = "footer.jsp" %>
	</div>
</body>
</html>