<%@page import="java.util.concurrent.ExecutionException"%>
<%@ page language="java" import="java.sql.*" import="ojdbc.Connect"
	contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	try {
		Connection con = Connect.getConnection();
		String SQL = "insert into subject values(?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(SQL);

		String subcode = request.getParameter("subcode");
		String subname = request.getParameter("subname");
		String subtext = request.getParameter("subtext");

		pstmt.setString(1, subcode);
		pstmt.setString(2, subname);
		pstmt.setString(3, subtext);

		pstmt.executeUpdate();

		pstmt.close();
		con.close();
	%>
	<script>
		alert('���� ����� �Ϸ�Ǿ����ϴ�.')
		self.location.href = 'subject_list.jsp'
	</script>
	<%
	} catch (Exception e) {
	%>
	<script>
		alert('���� ����� �����߽��ϴ�. �ٽ� �õ����ּ���.')
		self.location.gref = 'subject_join.jsp'
	</script>

	<%
	}
	%>

</body>
</html>