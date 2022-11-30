<%@ page language="java" import="java.sql.*" import="java.util.*"
	import="ojdbc.Connect" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Request Join</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
	Connection con = Connect.getConnection();
	Statement stmt = con.createStatement();
	%>
	<h1>수강 등록</h1>
	<form name="form" method="post" action="request_join_ok.jsp">
		<table border="1" align="center">
			<tr>
				<td>수강신청코드</td>
				<td>일련번호자동입력</td>
			</tr>
			<tr>
				<td>학생코드</td>
				<td><select name="stucode">
						<%
						String SQL = "select stu_code from student";
						ResultSet rs = stmt.executeQuery(SQL);
						while (rs.next()) {
							String stucode = rs.getString(1);
						%>
						<option value="<%=stucode%>"><%=stucode%></option>
						<%
						}
						%>
				</select></td>
			</tr>
			<tr>
				<td>과목코드</td>
				<td><select name="subcode">
						<%
						SQL = "select sub_code from subject";
						rs = stmt.executeQuery(SQL);
						while (rs.next()) {
							String subcode = rs.getString(1);
						%>
						<option value="<%=subcode%>"><%=subcode%></option>
						<%
						}
						%>
				</select></td>
			</tr>
			<%
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int date = cal.get(Calendar.DATE);
			String date_s = "";
			if (date < 10)
				date_s = "" + "0" + date;
			%>
			<tr>
				<td>신청일</td>
				<td><input type="date" name="adddate"
					value="<%=year%>-<%=month%>-<%=date_s%>"></td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="button"
					onclick="validCheck()" value="등록"></td>
			</tr>
		</table>
		<%
		rs.close();
		stmt.close();
		con.close();
		%>
	</form>
</body>
<script>
	const validCheck = () => {
		console.log(document.form.stucode.value)
		console.log(document.form.subcode.value)
		if (document.form.stucode.value.length == 0) {
			alert('학생 코드를 확인해주세요.')
			document.form.stucode.focus()
			return false
		} else if (document.form.subcode.value.length == 0) {
			alert("과목 코드를 확인해주세요")
			document.form.subcode.focus();
			return false
		} 
		else {
			document.form.submit();
		}
	}
</script>
</html>