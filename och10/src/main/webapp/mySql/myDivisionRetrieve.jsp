<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String dno = request.getParameter("dno");
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";
	String sql = "select * from division where dno = " + dno;
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "root", "mysql84");
	// 1. dno 받아 division 조회 SQL 작성 
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);

	// 2.request 저장 -> dno , dname , phone , position
	if (rs.next()) {
		request.setAttribute("dno", dno);
		request.setAttribute("dname", rs.getString(2));
		request.setAttribute("phone", rs.getString(3));
		request.setAttribute("position", rs.getString(4));
		rs.close();
		stmt.close();
		conn.close();
		// 3. Page이동 -> myDivisionInput.jsp
		RequestDispatcher rd = request.getRequestDispatcher("myDivisionInput.jsp");
		rd.forward(request, response);

	}
	%>
</body>
</html>