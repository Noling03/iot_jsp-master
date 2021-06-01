<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
</head>
<h3>SELECT</h3>
<body>

<table border=1>
	<tr>
		<td>피자 코드</td>
		<td>피자이름</td>
		<td>가격</td>
	</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "sdh_11", "1234");
		if (conn != null) {
			out.println("Database Connected!");
		}
		else {
			out.println("Database Connect Fail!");
		}
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT PCODE, PNAME, COST FROM TBL_PIZZA_01");
		%>
		<%
		while (rs.next()) {
			%>
					<tr>
						<td><% out.print(rs.getString(1));%></td>
						<td><% out.print(rs.getString(2));%></td>
						<td><% out.print(rs.getInt(3));%></td>
					</tr>
			<%
		}
		%>
		<%
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table>
</body>
</html>
