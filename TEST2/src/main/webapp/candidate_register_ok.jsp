<%@ page language="java" import="java.sql.*" import="DB.Connect" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보등록</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Connection con = Connect.getConnection();
		String sql = "insert into TBL_REGISTER values(?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(sql);
		
		String no = request.getParameter("no");
		String name = request.getParameter("name");
		String code = request.getParameter("code");
		String school = request.getParameter("school");
		String jumin = request.getParameter("jumin1") + request.getParameter("jumin2");
		String major = request.getParameter("major");
		
		pstmt.setString(1, no);
		pstmt.setString(2, name);
		pstmt.setString(3, code);
		pstmt.setString(4, school);
		pstmt.setString(5, jumin);
		pstmt.setString(6, major);
		
		pstmt.executeUpdate();
	%>
	
	<%@ include file = "header.jsp" %>
	<h1><%= name %>님의 후보 등록이 완료되었습니다.</h1>
	<a href="index.jsp">홈으로</a>
	<%@ include file = "footer.jsp" %>
</body>
</html>