<%@ page language="java" import="java.sql.*" import="ojdbc.Connect"
	contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h1>학생 등록</h1>

	<%
	Connection con = Connect.getConnection();
	Statement stmt = con.createStatement();
	String SQL = "select class_code from class";
	ResultSet rs = stmt.executeQuery(SQL);
	%>
	<form name="form" action="student_join_ok.jsp" method="post" align="center">
		<table border="1" align="center">
			<tr>
				<td>학생 코드</td>
				<td><input type="text" name="stucode"></td>
			</tr>

			<tr>
				<td>학생 이름</td>
				<td><input type="text" name="stuname"></td>
			</tr>

			<tr>
				<td>학생 주소</td>
				<td><input type="text" name="stuaddress"></td>
			</tr>

			<tr>
				<td>학생 생년월일</td>
				<td><input type="text" name="stubir"></td>
			</tr>

			<tr>
				<td>학과 코드</td>
				<td>
					<select name="classcode">
						<%
						while (rs.next()) {
							String classcode = rs.getString(1);
							String classname = "";

							if (classcode.contains("A001")) {
								classname = "소프트웨어개발과";
							} else if (classcode.contains("A002")) {
								classname = "사물인터넷과";
							} else {
								classname = "게임개발과";
							}
						%>
						<option value="<%=classcode%>"><%=classname%></option>
						<%
						}
						rs.close();
						stmt.close();
						con.close();
						%>
					</select>
				</td>
			</tr>
			
			<tr align="center">
				<td colspan=2><input type="button" onclick="validCheck()" value="등록"></td>
			</tr>
		</table>
	</form>
</body>
<script type="text/javascript">
	const validCheck = () => {
		let stucode = document.form.stucode.value
		let stuname = document.form.stuname.value
		let stuaddress = document.form.stuaddress.value
		let stubir = document.form.stubir.value
		let classcode = document.form.classcode.value
		
		if (stucode == '') {
			alert('학생 코드를 입력해주세요')
			document.form.stucode.focus()
			return false
		} else if (stuname == '') {
			alert('학생 이름을 입력해주세요')
			document.form.stuname.focus()
			return false
		} else if (stuaddress == '') {
			alert('학생주소를 입력해주세요')
			document.form.stuaddress.focus()
			return false
		} else if (stubir == '') {
			alert('학생 생년월일을 입력해주세요')
			document.form.stubir.focus()
			return false
		} else {
			document.form.submit()
		}
	}
</script>
</html>