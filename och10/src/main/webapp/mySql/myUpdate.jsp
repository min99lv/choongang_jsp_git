<%@page import="java.sql.PreparedStatement"%>
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
	<h2>스크립틀릿 + preparedStatement</h2>

	<%
	// 1. dno.dname,phone,position get
		// 2. Update
	    //    1) 성공 -> mysql 수정 성공 ㅋㅋ
	    //    2) 실패 -> mysql 수정 헉 ㅠㅠ
		int dno = Integer.parseInt(request.getParameter("dno"));
		String dname = request.getParameter("dname");
		String phone = request.getParameter("phone");
		String position = request.getParameter("position");
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/scottdb?serverTimezone=UTC";
		String sql = "update division set dname=?, phone=?, position=? where dno=?";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url, "root", "mysql84");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, dname);
		pstmt.setString(2, phone);
		pstmt.setString(3, position);
 		pstmt.setInt(4, dno);
		
		int result = pstmt.executeUpdate();
		if (result > 0)
			out.println("수정성공");
		else
			out.println("수정실패");
		pstmt.close();
		conn.close();
	%>

</body>
</html>