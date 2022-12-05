<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<h3>투표하기</h3>
	
	<form name="form" action="vote_ok.jsp" method="post">
		<table border="1">
			<tr>
				<td>주민번호</td>
				<td><input name="jumin" maxlength="13"></td>
			</tr>
			
			<tr>
				<td>성명</td>
				<td><input name="name"></td>
			</tr>
			
			<tr>
				<td>후보번호</td>
				<td>
					<select name="no">
						<option value="">=후보 번호를 선택하세요=</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
					</select>
				</td>
			</tr>
			
			<tr>
				<td>투표시간</td>
				<td><input name="time"></td>
			</tr>
			
			<tr>
				<td>투표장소</td>
				<td><input name="place"></td>
			</tr>
			
			<tr>
				<td>유권자 확인</td>
				<td>
					<input type="radio" name="confirm" value="Y"> 확인
					<input type="radio" name="confirm" value="N"> 미확인
				</td>
			</tr>
			
			<tr align="center">
				<td colspan="2">
					<input type="button" value="투표하기" onclick="validCheck()">
					<input type="button" value="다시쓰기" onclick="resetFunc()">
				</td>
			</tr>
		</table>
	</form>
	<a href="index.jsp">홈으로</a>
	<%@ include file = "footer.jsp" %>	
</body>

<script>
	const doc = document.form

	const resetFunc = () => {
		if (window.confirm('다시 쓰시겠습니까?'))
			doc.reset(); 
	}
	
	const validCheck = () => {
		if (doc.jumin.value == "") {
			alert('주민번호를 입력하세요.')
			doc.jumin.focus()
			return false
		} else if (doc.name.value == "") {
			alert('이름을 입력하세요.')
			doc.name.focus()
			return false
		} else if (doc.no.value == "") {
			alert('후보 번호를 선택하세요.')
			doc.no.focus()
			return false
		} else if (doc.time.value == "") {
			alert('투표시간을 입력하세요.')
			doc.time.focus()
			return false
		} else if (doc.place.value == "") {
			alert('투표장소를 입력하세요.')
			doc.place.focus()
			return false
		} else if (doc.confirm.value == "") {
			alert('유권자 확인을 선택하세요.')
			doc.confirm.focus()
			return false
		} else if (doc.jumin.value.length != 13) {
			alert('주민번호는 13자리여야 합니다.')
			doc.jumin.focus()
			return false
		} else {
			doc.submit()
		}
	}

</script>

</html>