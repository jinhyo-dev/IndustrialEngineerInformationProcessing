
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Guest List</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<h3 align="left">ȸ�� ���</h3>
	<table width="900" border="1">
		<tr style="background-color: silver">
			<td>ȸ��ID</td>
			<td>ȸ����</td>
			<td>�������</td>
			<td>����</td>
			<td>����</td>
			<td>�ּ�</td>
			<td width="400">�ڱ�Ұ�</td>
		</tr>

		<tr>
			<%
			Class.forName("oracle.jdbc.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jinhyo", "1234");
			Statement stmt = con.createStatement();
			ResultSet rs = null;

			String SQL = "select * from MEMBER order by userid asc";

			rs = stmt.executeQuery(SQL);

			while (rs.next()) {
				String userid = rs.getString(1);
				String username = rs.getString(2);
				String jumin = rs.getString(4);
				jumin = jumin.substring(0, 6);

				String gender = rs.getString(5);
				if (gender.equals("1"))
					gender = "��";
				else
					gender = "��";

				String address = rs.getString(6);
				String jobcd = rs.getString(7);

				try {
					switch (jobcd) {
					case "1":
				jobcd = "�л�";
				break;
					case "2":
				jobcd = "ȸ���";
				break;
					case "3":
				jobcd = "������";
				break;
					case "4":
				jobcd = "����";
				break;
					default:
				jobcd = "��Ÿ";
					}
				} catch (Exception e) {
					jobcd = "����";
				}

				String intro = rs.getString(9);
			%>
		
		<tr>
			<td><%=userid%></td>
			<td><%=username%></td>
			<td><%=jumin%></td>
			<td><%=gender%></td>
			<td><%=jobcd%></td>
			<td><%=address%></td>
			<td><%=intro%></td>
		</tr>

		<%
		}

		stmt.close();
		con.close();
		%>
	</table>

	<a href="main.jsp">Ȩ����</a>
</body>
</html>