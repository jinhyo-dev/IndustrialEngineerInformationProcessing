<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<h1>과목 등록</h1>
	<form name="form" action="subject_join_ok.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td>과목코드</td>
				<td><input type="text" name="subcode"></td>
			</tr>
			
			<tr>
				<td>과목명</td>
				<td><input type="text" name="subname"></td>
			</tr>
			
			<tr>
				<td>과목소개</td>
				<td><input type="text" name="subtext"></td>
			</tr>
			
			<tr align="center">
				<td colspan="2"><input type="button" value="등록" onclick="validCheck()"></td>
			</tr>
		
		</table>
	</form>
</body>

<script>
	const validCheck = () => {
		let subcode = document.form.subcode.value
		let subname = document.form.subname.value
		let subtext = document.form.subtext.value
		
		if (subcode == '') {
			alert('과목코드를 입력하세요')
			document.form.subcode.focus()
			return false
		} else if (subname == '') {
			alert('과목명을 입력하세요')
			document.form.subname.focus()
			return false
		} else if (subtext == '') {
			alert('과목 소개를 입력하세요')
			document.form.subtext.focus()
			return false
		} else {
			document.form.submit()
		}
	}
</script>

</html>