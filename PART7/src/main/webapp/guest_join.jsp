<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div align="center">
		<h3>ȸ������</h3>
		<form name="form1" action="guest_join_ok.jsp" method="post">
			<table width="600" border="1">
				<tr>
					<td width="40%" align="left">���̵�</td>
					<td width="60%" align="left"><input type="text" size="12"
						maxlength="12" name="userid"></td>
				</tr>

				<tr>
					<td width="40%" align="left">�̸�</td>
					<td width="60%" align="left"><input type="text" size="15"
						maxlength="12" name="usernm"></td>
				</tr>

				<tr>
					<td width="40%" align="left">��й�ȣ</td>
					<td width="60%" align="left"><input type="password" size="12"
						maxlength="12" name="passwd"></td>
				</tr>

				<tr>
					<td width="40%" align="left">��й�ȣ Ȯ��</td>
					<td width="60%" align="left"><input type="password" size="12"
						maxlength="12" name="passwd2"></td>
				</tr>

				<tr>
					<td width="40%" align="left">�ֹι�ȣ</td>
					<td width="60%" align="left"><input type="text" size="6"
						maxlength="6" name="jumin1">- <input type="text"
						maxlength="7" name="jumin2"></td>
				</tr>

				<tr>
					<td width="40%" align="left">����</td>
					<td width="60%" align="left">�� <input type="radio"
						name="gender" value="1" /> �� <input type="radio" name="gender"
						value="2" />
					</td>
				</tr>

				<tr>
					<td width="40%" align="left">�ּ�</td>
					<td width="60%" align="left"><input type="text" size="50"
						maxlength="50" name="address"></td>
				</tr>

				<tr>
					<td width="40%" align="left">����</td>
					<td width="60%" align="left"><select name="jobcd">
							<option value="" selected>������ �����ϼ���</option>
							<option value="1">�л�</option>
							<option value="2">ȸ���</option>
							<option value="3">������</option>
							<option value="4">����</option>
							<option value="9">��Ÿ</option>
					</select></td>
				</tr>

				<tr>
					<td width="40%" align="left">���ϼ��ſ���</td>
					<td width="60%" align="left"><input type="checkbox"
						name="mailrcv"></td>
				</tr>

				<tr>
					<td width="40%" align="left">�ڱ�Ұ�</td>
					<td width="60%" align="left"><textarea rows=5 cols=50
							name="intro"></textarea></td>
				</tr>

				<tr>
					<td align="center" colspan="2"><input type="button" value="����"
						onclick="validCheck()" /></td>
				</tr>

			</table>
		</form>
		<a href="main.jsp">Ȩ����</a>
	</div>
</body>

<script type="text/javascript">
	const validCheck = () => {
		if (document.form1.userid.value == "") {
			alert('���̵� �Է��ϼ���.')
			document.form1.userid.focus()
			return false
		} else if (document.form1.usernm.value == "") {
			alert('�̸��� �Է��ϼ���.')
			document.form1.usernm.focus()
			return false
		} else if (document.form1.passwd.value == "") {
			alert('��й�ȣ�� �Է��ϼ���.')
			document.form1.passwd.focus()
			return false
		} else if (document.form1.passwd2.value == "") {
			alert('��й�ȣ Ȯ���� �Է��ϼ���.')
			document.form1.passwd2.focus()
			return false
		} else if (document.form1.jumin1.value == "") {
			alert('�ֹι�ȣ�� �Է��ϼ���.')
			document.form1.jumin1.focus()
			return false
		} else if (document.form1.jumin2.value == "") {
			alert('�ֹι�ȣ�� �Է��ϼ���.')
			document.form1.jumin2.focus()
			return false
		} else if (document.form1.address.value == "") {
			alert('�ּҸ� �Է��ϼ���.')
			document.form1.address.focus()
			return false
		} else if (document.form1.passwd.value != document.form1.passwd2.value) {
			alert('��й�ȣ�� Ȯ�����ּ���.')
			document.form1.passwd2.focus()
			return false
		} else {
			document.form1.submit();
		}
		
	}
</script>
</html>