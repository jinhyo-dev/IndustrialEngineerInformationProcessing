<%@ page language="java" import="java.sql.*" import="DB.Connect"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote Ok</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Connection con = Connect.getConnection();
		String sql = "insert into tbl_vote values(?,?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		String jumin = request.getParameter("jumin");
		String name = request.getParameter("name");
		String no = request.getParameter("no");
		String time = request.getParameter("time");
		String place = request.getParameter("place");
		String confirm = request.getParameter("confirm");
		
		System.out.println(jumin + " " + name + " " + no + " " + time + " " + place + " " + confirm);
		
		pstmt.setString(1, jumin);
		pstmt.setString(2, name);
		pstmt.setString(3, no);
		pstmt.setString(4, time);
		pstmt.setString(5, place);
		pstmt.setString(6, confirm);
		
		pstmt.executeUpdate();
		

		pstmt.close();
		con.close();
	%>
	
	<%@ include file="header.jsp"%>
	<h1><%= name %>님의 투표가 완료되었습니다.</h1>
	<a href="index.jsp">홈으로</a>
	<%@ include file="footer.jsp"%>
</body>
</html>