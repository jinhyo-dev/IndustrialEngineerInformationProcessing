<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Class Join</title>
</head>

<style>
table {
	margin: auto;
	border-collapse: collapse;
	border: 1px solid #000;
}

td, tr {
	border: 1px solid #000;
}

button {
	display: block;
	margin: auto;
}
</style>

<body>
	<%@ include file="header.jsp"%>
	<h1>학과 등록</h1>

	<form action="class_join_ok.jsp" method="post" name="class_form">
		<table width="800" border="1">
			<tr>
				<td>학과 코드</td>
				<td><input type="text" name="classcode"></td>
			</tr>

			<tr>
				<td>학과 이름</td>
				<td><input type="text" name="classname"></td>
			</tr>

			<tr>
				<td>학과 연락처</td>
				<td>
					<input type="text" name="classphone1"> - 
					<input type="text" name="classphone2"> -
					<input type="text" name="classphone3">	
				</td>
			</tr>

			<tr>
				<td colspan="2">
					<button type="button" onclick="checkValue()">등록</button>
				</td>
			</tr>
		</table>
	</form>
</body>

<script type="text/javascript">
	function checkValue() {
		if (document.class_form.classcode.value == "") {
			alert("학과코드를 입력하세요.")
			document.class_form.classcode.focus()
			return false
		} else if (document.class_form.classname.value == "") {
			alert("학과이름를 입력하세요.")
			document.class_form.classname.focus()
			return false		
		} else if (document.class_form.classphone1.value == "") {
			alert("학과연락처를 입력하세요.")
			document.class_form.classphone1.focus()
			return false		
		} else if (document.class_form.classphone2.value == "") {
			alert("학과연락처를 입력하세요.")
			document.class_form.classphone2.focus()
			return false		
		} else if (document.class_form.classphone3.value == "") {
			alert("학과연락처를 입력하세요.")
			document.class_form.classphone3.focus()
			return false		
		} else {
			document.class_form.submit()
		}
	}
</script>

</html>