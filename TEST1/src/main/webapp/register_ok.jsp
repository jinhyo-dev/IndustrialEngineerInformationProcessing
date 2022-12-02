<%@ page language="java" import="java.sql.*" import="DB.Connect" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register OK</title>
</head>
<body>
 <%
 	Connection con = Connect.getConnection();
 	String SQL = "insert into tbl_guest values(?,?,?,?,?,?,?,?,?)";
 	PreparedStatement pstmt = con.prepareStatement(SQL);
 	
 	request.setCharacterEncoding("UTF-8");
 	String usernm = request.getParameter("usernm");
 	String userid = request.getParameter("userid");
 	String password = request.getParameter("password");
 	String jumin = request.getParameter("jumin1") + request.getParameter("jumin2");
 	String gender = request.getParameter("gender");
 	String address = request.getParameter("address");
 	String job = request.getParameter("job");
 	String mailrcv = "";
 	if (request.getParameter("mailrcv") == null) mailrcv = "N";
 	else mailrcv = "Y";
 
 	String intro = request.getParameter("intro");
 	
//  	System.out.println(usernm + " " + use	rid + " " + password + " " + jumin + " " + gender + " " + address + " " + job + " " + mailrcv + " " + intro);
 	pstmt.setString(1, userid);
 	pstmt.setString(2, usernm);
 	pstmt.setString(3, password);
 	pstmt.setString(4, jumin);
 	pstmt.setString(5, gender);
 	pstmt.setString(6, address);
 	pstmt.setString(7, job);
 	pstmt.setString(8, mailrcv);
 	pstmt.setString(9, intro);
 	
 	pstmt.executeUpdate();
 	
 	pstmt.close();
 	con.close();
 %>
 
<h2><%= usernm %>님의 회원가입이 완료되었습니다.</h2>
<a href="index.jsp">홈으로</a>
</body>
</html>