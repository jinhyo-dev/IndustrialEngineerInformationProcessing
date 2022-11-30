<%@ page language="java" import="java.sql.*" import="ojdbc.Connect" import="java.util.*"
	contentType="text/html; charset=EUC-KR" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Class Join Ok</title>
</head>
<body>

	<%
	try {
		Connection con = Connect.getConnection();
		PreparedStatement pstmt = null;
		
		String SQL = "insert into class values (?,?,?)";
		pstmt = con.prepareStatement(SQL);

		String classcode = request.getParameter("classcode");
		String classname = request.getParameter("classname");
		String classphone1 = request.getParameter("classphone1");
		String classphone2 = request.getParameter("classphone2");
		String classphone3 = request.getParameter("classphone3");

		String classphone = classphone1 + "-" + classphone2 + "-" + classphone3;

		pstmt.setString(1, classcode);
		pstmt.setString(2, classname);
		pstmt.setString(3, classphone);

		pstmt.executeUpdate();

		pstmt.close();
		con.close();
	%>

	<script type="text/javascript">
		alert("학과 등록이 완료되었습니다!")
		self.location.href = "class_list.jsp"
	</script>
	<%
	} catch (Exception e) {
	%>
	<script type="text/javascript">
		alert("학과 등록이 실패했습니다. 다시 시도해주세요.");
		self.location.href = "class_join.jsp"
	</script>
	<%
	}
	%>
</body>
</html>