<%@ page language="java" import="java.sql.*" import="Database.Connect"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<%@ include file="header.jsp"%>
	<div class="section" style="min-height: 400px">
		<h2 align="left">투표하기</h2>
		<form name="form" action="vote_action.jsp" method="post">
			<table border="1" width="600">
				<tr>
					<td align="left" width="30%">주민번호</td>
					<td align="left" width="70%"><input type="text" name="v_jumin"
						size="20" maxlength="13"> 예)0403013000001</td>
				</tr>

				<tr>
					<td align="left" width="30%">성명</td>
					<td align="left" width="70%"><input name="v_name" size="20"
						maxlength="20"></td>
				</tr>

				<tr>
					<td align="left" width="30%">후보번호</td>
					<td align="left" width="70%"><select name="choice_no">
							<option value="">==후보번호 선택==</option>
							<%
								Connection con = Connect.getConnection();
								Statement stmt = con.createStatement();
								ResultSet rs = null;
								String SQL = "select NO, Name from tbl_register";
								rs = stmt.executeQuery(SQL);
	
								while (rs.next()) {
									int no = rs.getInt(1);
									String name = rs.getString(2);
							%>
								<option value="<%=no%>"><%=no%>번 <%=name%></option>
							<%}%>
					</select></td>
				</tr>

				<tr>
					<td align="left" width="30%">투표시간</td>
					<td align="left" width="70%"><input name="v_time" size="20"
						maxlength="4">예)0930</td>
				</tr>
				
				<tr>
					<td align="left" width="30%">투표소</td>
					<td align="left" width="70%">
						<input name="v_area" size="20" maxlength="30">예)제1투표소
					</td>
				</tr>

				<tr>
					<td align="left" width="30%">개인정보수집이용동의</td>
					<td align="left" width="70%"><input type="radio"
						name="v_confirm" value="Y">동의 <input type="radio"
						name="v_confirm" value="N">미동의</td>
				</tr>

				<tr align="center">
					<td colspan="2">
					<input type="button" value="투표하기" onclick="validCheck()"/>
					<input type="reset" value="다시하기" onclick="res()"/></td>
				</tr>
			</table>
		</form>
	</div>
</body>

<script type="text/javascript">
	const validCheck = () => {
		const doc = document.form
		const len = document.form.v_jumin.value.length
		
		if (doc.v_jumin.value == "") {
			alert('주민번호를 입력하세요.')
			doc.v_jumin.focus()
			return false
		}
		else if (len != 13) {
			alert('주민번호는 13자리를 입력하세요.')
			doc.v_jumin.focus()
			return false
		} else if (doc.v_name.value == "") {
			alert('이름을 입력하세요')
			doc.v_name.focus()
			return false
		} else if (doc.choice_no.value == "") {
			alert('후보번호를 선택하세요')
			doc.choice_no.focus()
			return false
		} else if (doc.v_time.value == "") {
			alert('투표시간을 입력하세요')
			doc.v_time.focus()
			return false
		} else if (doc.v_area.value == "") {
			alert('투표장소를 입력하세요')
			doc.v_area.focus()
			return false
		} else if (doc.v_confirm.value != "Y") {
			alert('개인정보수집이용동의에 동의하지 않으면 투표할 수 없습니다')
			doc.v_confirm.focus()
			return false
		} else {
			document.form.submit()
		}
	}
	
	const res = () => {
		alert('다시 입력합니다')
		doc.reset()
	}
</script>

</html>