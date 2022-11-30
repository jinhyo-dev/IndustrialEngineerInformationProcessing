<%@ page language="java" import="java.sql.*" import="Database.Connect"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Join OK</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="section" style="min-height: 400px">
		<%
		Connection con = Connect.getConnection();
		ResultSet rs = null;
		String SQL = "insert into TBL_REGISTER values(?,?,?,?,?,?)";
		PreparedStatement pstmt = null;
		pstmt = con.prepareStatement(SQL);

		String no = request.getParameter("NO");
		String name = request.getParameter("Name");
		String code = request.getParameter("Code");
		String school = request.getParameter("School");
		String jumin = request.getParameter("jumin") + request.getParameter("jumin2");
		String major = request.getParameter("Major");	
		
		pstmt.setString(1, no);
		pstmt.setString(2, name);
		pstmt.setString(3, code);
		pstmt.setString(4, school);
		pstmt.setString(5, jumin);
		pstmt.setString(6, major);
		
		System.out.println(SQL);

		Statement stmt = con.createStatement();

		String SQL2 = "select MAX(NO) from tbl_register";
		rs = stmt.executeQuery(SQL2);
		rs.next();

		String n = rs.getString(1);
		int topNo = Integer.parseInt(n);
		int compare = Integer.parseInt(no);
		
		if (compare != (topNo + 1)) {
			request.setAttribute("message", "error");
			request.setAttribute("sendValue", topNo + 1);
			request.getRequestDispatcher("register_join.jsp").forward(request, response);
		} else
			pstmt.executeUpdate();

		stmt.executeQuery("commit");

		stmt.close();
		pstmt.close();
		con.close();
		%>

		<h2><%=name%>님의 후보등록이 완료되었습니다.
		</h2>
		<br> <a href="main.jsp">홈으로</a>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>