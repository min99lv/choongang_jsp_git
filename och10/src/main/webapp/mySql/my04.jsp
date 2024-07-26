<%@page import="och10.Division"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	int dno = Integer.parseInt(request.getParameter("dno"));
	/* String dno = request.getParameter("dno"); */
	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";
	String sql = "select * from division where dno=" + dno;
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url, "root", "mysql84");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);

	Division division = new Division();
	
	
	if (rs.next()) {
		String dname = rs.getString("dname");
		// 1. 받고
		String phone = rs.getString(3);
		String position = rs.getString(4);
		
		// 3. 한번에 입력해도 됨
		division.setDno(rs.getInt(1));
		// 2. set해도된다
		division.setDname(dname);
		division.setPhone(phone);
		division.setPosition(position);
		
		request.setAttribute("division", division);
	} else
		out.println("그게 무슨 부서야 없는데");
	rs.close();
	stmt.close();
	conn.close();
	// page 이동 --> my03Result.jsp

	RequestDispatcher rc = request.getRequestDispatcher("my04Result.jsp");
	rc.forward(request, response);
	%>
</body>
</html>