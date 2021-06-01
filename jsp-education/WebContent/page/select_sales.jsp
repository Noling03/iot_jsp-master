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
		<td>판매 ID</td>
		<td>상점명</td>
		<td>판매 일자</td>
		<td>피자 코드</td>
		<td>피자명</td>
		<td>총 판매액</td>
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
		String query = "select " + 
							"SALELIST.SALENO, SHOP.SCODE || '-' || SHOP.SNAME, SALELIST.SALEDATE, PIZZA.PCODE, SALELIST.AMOUNT, PIZZA.COST * SALELIST.AMOUNT as TOTAL_COST " +
						"FROM " +
							"TBL_SALELIST_01 SALELIST, TBL_SHOP_01 SHOP, TBL_PIZZA_01 PIZZA " +
						"WHERE " +
							"SALELIST.SCODE = SHOP.SCODE AND " +
							"SALELIST.PCODE = PIZZA.PCODE "+
						"ORDER BY "+
							"SALELIST.SALENO ";
		ResultSet rs = stmt.executeQuery(query);
		%>
		<%
		while (rs.next()) {
			%>
					<tr>
						<td><% out.println(rs.getInt(1));%></td>
						<td><% out.println(rs.getString(2));%></td>
						<td><% out.println(rs.getString(3));%></td>
						<td><% out.println(rs.getString(4));%></td>
						<td><% out.println(rs.getInt(5));%></td>
						<td><% out.println(rs.getInt(6));%></td>
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
