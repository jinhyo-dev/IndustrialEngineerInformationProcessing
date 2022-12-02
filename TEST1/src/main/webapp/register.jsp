<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<div>
		<form name="form" action="register_ok.jsp" method="post">
			<h3>회원가입</h3>
			<table border="1" width="600">
				<tr>
					<td width="30%">아이디</td>
					<td width="70%"><input name="userid"></td>
				</tr>
				
				<tr>
					<td>이름</td>
					<td><input name="usernm"></td>
				</tr>
				
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="password"></td>
				</tr>
				
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="passwordCheck"></td>
				</tr>
				
				<tr>
					<td>주민번호</td>
					<td><input name="jumin1"> - <input name="jumin2"></td>
				</tr>
				
				<tr>
					<td>성별</td>
					<td>
						남 <input type="radio" name="gender" value="M">
						여 <input type="radio" name="gender" value="F">
					</td>
				</tr>
				
				<tr>
					<td>주소</td>
					<td><input name="address"></td>
				</tr>
				
				<tr>
					<td>직업</td>
					<td>
						<select name="job">
							<option value="">직업을 선택하세요.</option>
							<option value=1>학생</option>
							<option value=2>회사원</option>
							<option value=3>공무원</option>
							<option value=4>군인</option>
							<option value=9>기타</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>메일수신여부</td>
					<td>
						<input type="checkbox" name="mailrcv">
					</td>
				</tr>
				
				<tr>
					<td>자기소개</td>
					<td>
						<textarea name="intro" 	style="width: 100%; height: 50px">
						</textarea>
					</td>
				</tr>
				
				<tr align="center">
					<td colspan="2">
						<input type = "button" value="가입" onclick="validCheck()">
					</td>
				</tr>
			</table>
		</form>
		<a href="index.jsp">홈으로</a>
	</div>
	<%@ include file = "footer.jsp" %>
</body>


<script>
	const validCheck = () => {
		const doc = document.form
		
		console.log(!Number(doc.usernm.value.substr(0, 1)))
		
		if (doc.userid.value == "") {
			alert('아이디를 입력하세요')
			doc.userid.focus()
			return false
		} else if (doc.usernm.value == "") {
			alert('아름을 입력하세요')
			doc.usernm.focus()
			return false
		} else if (doc.password.value == "") {
			alert('비밀번호를 입력하세요')
			doc.password.focus()
			return false
		} else if (doc.passwordCheck.value == "") {
			alert('비밀번호확인을 입력하세요')
			doc.passwordCheck.focus()
			return false
		} else if (doc.jumin1.value == "") {
			alert('주민번호를 입력하세요')
			doc.jumin1.focus()
			return false
		} else if (doc.jumin2.value == "") {
			alert('주민번호를 입력하세요')
			doc.jumin2.focus()
			return false
		} else if (doc.gender.value == "") {
			alert('성별을 선택하세요')
			doc.gender.focus()
			return false
		} else if (doc.address.value == "") {
			alert('주소를 입력하세요')
			doc.address.focus()
			return false
		} else if (doc.job.value == "") {
			alert('직업을 선택하세요')
			doc.job.focus()
			return false
		} else if (doc.intro.value == "") {
			alert('자기소개를 입력하세요')
			doc.intro.focus()
			return false
		} else if (doc.userid.value.length < 4 || doc.userid.value.length > 12) {
			alert('아이디는 4자~12자 이내로 입력가능합니다.')
			doc.userid.focus()
			return false
		}  else if (!Number(doc.usernm.value.substr(0, 1)) == false) {
			alert('이름은 첫 자리에 숫자가 들어가면 안됩니다.')
			doc.usernm.focus()
			return false
		} else if (doc.password.value.length < 4) {
			alert('비밀번호의 길이는 4자리 이상이여야 합니다')
			doc.password.focus()
			return false
		} else if (doc.password.value != doc.passwordCheck.value) {
			alert('비밀번호가 같은지 확인해주세요')
			doc.passwordCheck.focus()
		} else {
			doc.submit()
		}
	}
</script>
</html>