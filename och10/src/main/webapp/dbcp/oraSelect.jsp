<%@page import="och10.Emp"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../dbError.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
// initialContext : context를 찾아서 자원화(인스턴스) 시켜주겠다
	Context ctx = new InitialContext();
// 형변환 DataSource : context에서 OracleDB의 이름을 가진 것을 찾고 세팅시켜줌
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	
	Connection conn = ds.getConnection();
	
	String empno = request.getParameter("empno");
	String sql = "select empno, ename, sal, hiredate from emp where empno=" + empno;
	System.out.println("sql-> "+sql);
			
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	Emp emp = new Emp();
	if(rs.next()){
        emp.setEmpno(rs.getInt(1));
        emp.setEname(rs.getString(2));
        emp.setSal(rs.getInt(3));
        emp.setHiredate(rs.getDate(4));
		System.out.println("empno-> "+rs.getInt(1));
		System.out.println("ename-> "+rs.getString(2));
		System.out.println("sal-> "+rs.getInt(3));
		System.out.println("hiredate-> "+rs.getDate(4));


        request.setAttribute("emp", emp);
	}
	rs.close();
	stmt.close();
	RequestDispatcher rd = request.getRequestDispatcher("oraResult.jsp");
	rd.forward(request, response);
	
%>
</body>
</html>