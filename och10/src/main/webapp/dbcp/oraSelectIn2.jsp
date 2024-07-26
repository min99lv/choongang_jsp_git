<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="och10.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="../dbError.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	// al 만들기
	// 1. DBCP
	// 2. emp.empno , emp.ename
	// 3. setAttribute("al", al)
	Context ctx = new InitialContext();
	DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
	String sql = "select empno, ename from emp";
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);

	ArrayList<Emp> al = new ArrayList<Emp>();
	while (rs.next())
	{
		Emp emp = new Emp();
		emp.setEmpno(rs.getInt(1));
		emp.setEname(rs.getString(2));
		al.add(emp);
	}

	request.setAttribute("al", al);
	rs.close();
	stmt.close();
	conn.close();
	%>
	<h2>보고싶은 사원 번호를 입력하세요</h2>
<!-- 	<form action="oraSelect.jsp">-->	
<form action="oraCallEmpInfo.jsp">
		<select name="empno">
			<c:forEach var="emp" items="${al}">
			<!--  oraSelect로 가기때문에 정보가 나옴 -->
				<option value="${emp.empno}">${emp.empno}${emp.ename}</option>
			</c:forEach>
		</select>
		<p>
			<input type="submit" value="입력완료">
	</form>
</body>
</html>