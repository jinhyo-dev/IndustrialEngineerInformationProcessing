<%@ page language="java" import="java.sql.*" import="Database.Connect"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vote Action</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="section" style="min-height: 400px">
		<%
		Connection con = Connect.getConnection();

		String jumin = request.getParameter("v_jumin");
		String name = request.getParameter("v_name");
		String choice = request.getParameter("choice_no");
		String time = request.getParameter("v_time");
		String area = request.getParameter("v_area");
		String confirm = request.getParameter("v_confirm");

		Statement stmt = con.createStatement();
		String SQL = "select jumin, name from tbl_v_people";
		ResultSet rs = stmt.executeQuery(SQL);
		boolean check = false;
		
		while (rs.next()) {
			String d_jumin = rs.getString(1);
			String d_name = rs.getString(2);
			if (d_jumin.contains(jumin) && d_name.contains(name)) {
				check = true;
			}
			System.out.println(d_jumin + " " + d_name);
		}

		if (check == true) {
			SQL = "insert into tbl_vote values (?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(SQL);

			pstmt.setString(1, jumin);
			pstmt.setString(2, name);
			pstmt.setString(3, choice);
			pstmt.setString(4, time);
			pstmt.setString(5, area);
			pstmt.setString(6, confirm);

			pstmt.executeUpdate();
			pstmt.close();
		} else {
		%>
		<script>
			alert('유권자 정보가 올바르지 않습니다. 다시 확인해주세요')
			location.href = "vote.jsp";
		</script>
		<%
		}

		stmt.close();
		con.close();
		%>
		<h2>투표가 완료되었습니다.</h2>
		<a href="main.jsp">홈으로</a>
	</div>
</body>
</html>