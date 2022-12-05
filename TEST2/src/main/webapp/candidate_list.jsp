<%@ page language="java" import="java.sql.*" import="DB.Connect" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회</title>
</head>
<body>
	<%@ include file = "header.jsp" %>
	<h3>후보조회</h3>
	<table border="1">
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
			
			String sql = "select A.No, A.Name, B.P_CLASS, A.School, B.P_PARTNER, A.Jumin, A.Major, B.P_TEL1, B.P_TEL2, B.P_TEL3 "
					   + "from TBL_REGISTER A join TBL_PARTNER B "
					   + "on A.Code = B.P_CODE "
					   + "order by A.No asc";
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				String no = rs.getString(1);
				String name = rs.getString(2);
				String classnum = rs.getString(3);
				String school = rs.getString(4);
				String partner = rs.getString(5);
				String jumin = rs.getString(6);
				String major = rs.getString(7);
				String tel1 = rs.getString(8);
				String tel2 = rs.getString(9);
				String tel3 = rs.getString(10);
			
				String tel = tel1 + "-" + tel2 + "-" + tel3;
				
				switch (school) {
				case "1":
					school = "중졸";
					break;
				case "2":
					school = "고졸";
					break;
				case "3":
					school = "전문대졸";
					break;
				case "4":
					school = "대졸";
					break;
				case "5":
					school = "석사수료";
					break;
				case "6":
					school = "석사취득";
					break;
				case "7":
					school = "박사수료";
					break;
				case "8":
					school = "박사취득";
					break;
				default:
					school = "error";
				}
		%>
		
		<tr>
			<td><%= no %></td>
			<td><%= name %></td>
			<td><%= classnum %></td>
			<td><%= partner %></td>
			<td><%= school %></td>
			<td><%= jumin %></td>
			<td><%= major %></td>
			<td><%= tel %></td>
		</tr>
		
		<%
			}
			
			stmt.close();
			con.close();
		%>
	</table>
	<a href="index.jsp">홈으로</a>
	<%@ include file = "footer.jsp" %>
</body>
</html>