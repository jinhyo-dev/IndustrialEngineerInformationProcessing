<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div align="center">
		<h3>회원가입</h3>
		<form name="form1" action="guest_join_ok.jsp" method="post">
			<table width="600" border="1">
				<tr>
					<td width="40%" align="left">아이디</td>
					<td width="60%" align="left"><input type="text" size="12"
						maxlength="12" name="userid"></td>
				</tr>

				<tr>
					<td width="40%" align="left">이름</td>
					<td width="60%" align="left"><input type="text" size="15"
						maxlength="12" name="usernm"></td>
				</tr>

				<tr>
					<td width="40%" align="left">비밀번호</td>
					<td width="60%" align="left"><input type="password" size="12"
						maxlength="12" name="passwd"></td>
				</tr>

				<tr>
					<td width="40%" align="left">비밀번호 확인</td>
					<td width="60%" align="left"><input type="password" size="12"
						maxlength="12" name="passwd2"></td>
				</tr>

				<tr>
					<td width="40%" align="left">주민번호</td>
					<td width="60%" align="left"><input type="text" size="6"
						maxlength="6" name="jumin1">- <input type="text"
						maxlength="7" name="jumin2"></td>
				</tr>

				<tr>
					<td width="40%" align="left">성별</td>
					<td width="60%" align="left">남 <input type="radio"
						name="gender" value="1" /> 여 <input type="radio" name="gender"
						value="2" />
					</td>
				</tr>

				<tr>
					<td width="40%" align="left">주소</td>
					<td width="60%" align="left"><input type="text" size="50"
						maxlength="50" name="address"></td>
				</tr>

				<tr>
					<td width="40%" align="left">직업</td>
					<td width="60%" align="left"><select name="jobcd">
							<option value="" selected>직업을 선택하세요</option>
							<option value="1">학생</option>
							<option value="2">회사원</option>
							<option value="3">공무원</option>
							<option value="4">군인</option>
							<option value="9">기타</option>
					</select></td>
				</tr>

				<tr>
					<td width="40%" align="left">메일수신여부</td>
					<td width="60%" align="left"><input type="checkbox"
						name="mailrcv"></td>
				</tr>

				<tr>
					<td width="40%" align="left">자기소개</td>
					<td width="60%" align="left"><textarea rows=5 cols=50
							name="intro"></textarea></td>
				</tr>

				<tr>
					<td align="center" colspan="2"><input type="button" value="가입"
						onclick="validCheck()" /></td>
				</tr>

			</table>
		</form>
		<a href="main.jsp">홈으로</a>
	</div>
</body>

<script type="text/javascript">
	const validCheck = () => {
		if (document.form1.userid.value == "") {
			alert('아이디를 입력하세요.')
			document.form1.userid.focus()
			return false
		} else if (document.form1.usernm.value == "") {
			alert('이름을 입력하세요.')
			document.form1.usernm.focus()
			return false
		} else if (document.form1.passwd.value == "") {
			alert('비밀번호를 입력하세요.')
			document.form1.passwd.focus()
			return false
		} else if (document.form1.passwd2.value == "") {
			alert('비밀번호 확인을 입력하세요.')
			document.form1.passwd2.focus()
			return false
		} else if (document.form1.jumin1.value == "") {
			alert('주민번호를 입력하세요.')
			document.form1.jumin1.focus()
			return false
		} else if (document.form1.jumin2.value == "") {
			alert('주민번호를 입력하세요.')
			document.form1.jumin2.focus()
			return false
		} else if (document.form1.address.value == "") {
			alert('주소를 입력하세요.')
			document.form1.address.focus()
			return false
		} else if (document.form1.passwd.value != document.form1.passwd2.value) {
			alert('비밀번호를 확인해주세요.')
			document.form1.passwd2.focus()
			return false
		} else {
			document.form1.submit();
		}
		
	}
</script>
</html>