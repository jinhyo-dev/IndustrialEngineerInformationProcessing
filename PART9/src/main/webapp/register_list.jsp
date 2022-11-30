<%@ page language="java" import="java.sql.*" import="Database.Connect"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보 조회</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="section" style="min-height: 400px">
		<h2 align="left">후보조회</h2>
		<table border="1" width="800" align="center">
			<tr>
				<td>후보번호</td>
				<td>성명</td>
				<td>반</td>
				<td>파트너</td>
				<td>학력</td>
				<td>주민번호</td>
				<td>전공학년반</td>
				<td>전화번호</td>
			</tr>
			<%
			Connection con = Connect.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = null;
			String SQL = "select NO, Name, P_CLASS, P_PARTNER, School, Jumin, Major, P_TEL1, P_TEL2, P_TEL3"
					+ " from TBL_REGISTER join TBL_PARTNER on TBL_REGISTER.Code = TBL_PARTNER.P_CODE " + "order by NO asc";
			rs = stmt.executeQuery(SQL);

			while (rs.next()) {
				String no = rs.getString(1);
				String name = rs.getString(2);
				String p_class = rs.getString(3);
				String p_partner = rs.getString(4);
				String school = rs.getString(5);

				switch (school) {
				case "1": {
					school = "중졸";
					break;
				}
				case "2": {
					school = "고졸";
					break;
				}
				case "3": {
					school = "전문대졸";
					break;
				}
				case "4": {
					school = "대졸";
					break;
				}
				case "5": {
					school = "석사수료";
					break;
				}
				case "6": {
					school = "석사취득";
					break;
				}
				case "7": {
					school = "박사수료";
					break;
				}
				case "8": {
					school = "박사취득";
					break;
				}
				}

				String jumin = rs.getString(6);
				jumin = jumin.substring(0, 6) + "-" + jumin.substring(6);
				String major = rs.getString(7);
				String phone = rs.getString(8) + "-" + rs.getString(9) + "-" + rs.getString(10);
			%>

			<tr>
				<td><%=no%></td>
				<td><%=name%></td>
				<td><%=p_class%></td>
				<td><%=p_partner%></td>
				<td><%=school%></td>
				<td><%=jumin%></td>
				<td><%=major%></td>
				<td><%=phone%></td>
			</tr>

			<%
			}
			stmt.close();
			con.close();
			%>
		</table>
	</div>
</body>
</html>