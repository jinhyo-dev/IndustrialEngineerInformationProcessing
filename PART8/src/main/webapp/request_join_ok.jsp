<%@ page language="java" import="java.sql.*" import="ojdbc.Connect"
	contentType="text/html; charset=EUC-KR" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Request Join OK</title>
</head>
<body>
	<%
	try {
		Connection con = Connect.getConnection();
		String SQL = "insert into request values((select max(add_code) + 1 from request),?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(SQL);

		String stucode = request.getParameter("stucode");
		String subcode = request.getParameter("subcode");
		String adddate = request.getParameter("adddate");

		pstmt.setString(1, stucode);
		pstmt.setString(2, subcode);
		pstmt.setString(3, adddate);

		pstmt.executeQuery();

		pstmt.close();
		con.close();
	%>
	<script>
		alert('수강신청 등록이 완료되었습니다.')
		self.location.href = "request_list.jsp";
	</script>
	<%
	} catch (Exception e) {
	%>
	<script>
		alert('수강신청 등록이 실패했습니다. 다시 시도해주세요.')
		self.location.href = "request_list.jsp";
	</script>
	<%
	}
	%>

</body>
</html>