<%@ page language="java" contentType="text/html; charset=EUC-KR"
	import="java.util.*" import="java.sql.*" pageEncoding="EUC-KR"%>

<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jinhyo", "1234");
	PreparedStatement pstmt = null;
	
	String SQL = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?)";
	
	pstmt = con.prepareStatement(SQL);
	
	String userid = request.getParameter("userid");
	String username = request.getParameter("usernm");
	String userpw = request.getParameter("passwd");
	String jumin = request. getParameter("jumin1") + request.getParameter("jumin2");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	String jobcd = request. getParameter("jobcd");
	String mailrcv = request.getParameter("mailrcv");

	if (mailrcv != null && mailrcv.equals("on")) mailrcv = "Y";
	else mailrcv = "N";

	String intro = request. getParameter("intro").replace("\r\n", "<br>");
	
	pstmt.setString(1, userid);
	pstmt.setString(2, username);
	pstmt.setString(3, userpw);
	pstmt.setString(4, jumin);
	pstmt.setString(5, gender);
	pstmt.setString(6, address);
	pstmt.setString(7, jobcd);
	pstmt.setString(8, mailrcv);
	pstmt.setString(9, intro);
	pstmt. executeUpdate();
	
	pstmt.close();
	con.close();
%>

<h2><%=username %>님의 회원가입이 완료되었습니다.</h2>
<br>
<a href="main.jsp">홈으로</a>