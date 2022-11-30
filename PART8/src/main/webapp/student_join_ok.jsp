<%@ page language="java" import="ojdbc.Connect" import="java.sql.*"
	contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Student Join OK</title>
</head>
<body>
	<%
	try {
		Connection con = Connect.getConnection();
		String SQL = "insert into student values (?,?,?,?,?)";

		PreparedStatement pstmt = con.prepareStatement(SQL);

		String stucode = request.getParameter("stucode");
		String stuname = request.getParameter("stuname");
		String stuaddress = request.getParameter("stuaddress");
		String stubir = request.getParameter("stubir");
		String classcode = request.getParameter("classcode");

		pstmt.setString(1, stucode);
		pstmt.setString(2, stuname);
		pstmt.setString(3, stuaddress);
		pstmt.setString(4, stubir);
		pstmt.setString(5, classcode);

		pstmt.executeUpdate();

		pstmt.close();
		con.close();
	%>

	<script type="text/javascript">
		alert('�л� ����� �Ϸ�Ǿ����ϴ�.')
		self.location.href = "student_list.jsp";
	</script>
	<%
	} catch (Exception e) {
	%>
	<script type="text/javascript">
		alert('�л� ����� �����߽��ϴ�. �ٽ� �õ����ּ���.')
		self.location.href = "student_join.jsp"
	</script>
	<%
	}
	%>
	%>
</body>
</html>