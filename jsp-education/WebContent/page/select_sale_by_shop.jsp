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
		<td>상점 코드</td>
		<td>상점명</td>
		<td>총 매출</td>
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
		String query = "SELECT "+
		"	    SHOP.SCODE, SHOP.SNAME, "+
		"	    sum(pizza.cost * salelist.amount) AS total_cost "+
		"	FROM " +
		"	    tbl_salelist_01 salelist, "+
		"	    tbl_shop_01     shop, "+
		"	    tbl_pizza_01       pizza "+
		"	WHERE " +
		"	    salelist.scode = shop.scode "+
		"	    AND salelist.pcode = pizza.pcode "+
		"	GROUP BY "+
		"	    SHOP.SCODE, SHOP.SNAME "+
		"	ORDER BY TOTAL_COST desc";
		ResultSet rs = stmt.executeQuery(query);
		%>
		<%
		while (rs.next()) {
			%>
					<tr>
						<td><% out.println(rs.getString(1));%></td>
						<td><% out.println(rs.getString(2));%></td>
						<td><% out.println(rs.getInt(3));%></td>
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
