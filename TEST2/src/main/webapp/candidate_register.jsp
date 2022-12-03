<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h3>후보등록</h3>

	<form name="form" action="register_ok.jsp" method="post">
	<table border="1">
		<tr>
			<td>후보번호</td>
			<td><input name="no"></td>
		</tr>
		
		<tr>
			<td>이름</td>
			<td><input name="name"></td>
		</tr>

		<tr>
			<td>팀번호</td>
			<td><select name="code">
					<option value="">==팀번호를 선택하세요==</option>
					<option value="P1">1팀</option>
					<option value="P2">2팀</option>
					<option value="P3">3팀</option>
					<option value="P4">4팀</option>
					<option value="P5">5팀</option>
			</select></td>
		</tr>

		<tr>
			<td>학력</td>
			<td><select name="school">
					<option value="">==학력을 선택하세요==</option>
					<option value=1>중졸</option>
					<option value=2>고졸</option>
					<option value=3>전문대졸</option>
					<option value=4>대졸</option>
					<option value=5>석사수료</option>
					<option value=6>석사취득</option>
					<option value=7>박사수료</option>
					<option value=8>박사취득</option>
			</select></td>
		</tr>

		<tr>
			<td>주민번호</td>
			<td>
				<input name="jumin1" minlength="6" maxlength="6">-
				<input name="jumin2" minlength="7" maxlength="7">
			</td>
		</tr>

		<tr>
			<td>전공학년반</td>
			<td><input name="major"></td>
		</tr>

		<tr align="center">
			<td colspan="2"><input type="button" value="등록" onclick="validCheck()"></td>
		</tr>
	</table>
	</form>
	<a href="index.jsp">홈으로</a>
	<%@ include file="footer.jsp"%>
</body>

<script>
	const validCheck = () => {
		const doc = document.form
		
		if (doc.no.value == "") {
			alert("후보번호를 입력해주세요.")
			doc.no.focus()
			return false
		} else if (doc.name.value == "") {
			alert("이름을 입력해주세요.")
			doc.name.focus()
			return false
		} else if (doc.code.value == "") {
			alert("팀번호를 선택해주세요.")
			doc.code.focus()
			return false
		} else if (doc.school.value == "") {
			alert("학력을 선택해주세요.")
			doc.school.focus()
			return false
		} else if (doc.jumin1.value == "") {
			alert("주민번호를 입력해주세요.")
			doc.jumin1.focus()
			return false
		} else if (doc.jumin2.value == "") {
			alert("주민번호를 입력해주세요.")
			doc.jumin2.focus()
			return false
		} else if (doc.major.value == "") {
			alert("전공학년반을 입력해주세요.")
			doc.major.focus()
			return false
		} else if (doc.jumin1.value.length != 6) {
			alert("주민번호 앞자리는 6자여야합니다.")
			doc.jumin1.focus()
			return false
		} else if (doc.jumin2.value.length != 7) {
			alert("주민번호 뒷자리는 7자여야합니다.")
			doc.jumin2.focus()
			return false
		} else {
			doc.submit()
		}
	}
</script>

</html>