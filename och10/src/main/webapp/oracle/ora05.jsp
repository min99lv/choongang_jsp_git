<%@page import="och10.Emp"%>
<%@page import="java.util.ArrayList"%>
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
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String sql = "select empno, ename,job,sal from emp";
		System.out.println("sql->"+sql);

		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,"scott","tiger");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		// 컬렉션 ArrayList 선언
		ArrayList<Emp> arr = new ArrayList<Emp>();
		
		
	/* 	가져올 값
		7369	SMITH	CLERK	1000
		7499	ALLEN	SALESMAN	1760
		7521	WARD	SALESMAN	1250
		7566	JONES	MANAGER	2975
		7654	MARTIN	SALESMAN	1250
		7698	BLAKE	MANAGER	2850
		7782	CLARK	MANAGER	2450
		7788	SCOTT	ANALYST	3000
		7839	KING	PRESIDENT	6050
		7844	TURNER	SALESMAN	1500
		7876	ADAMS	CLERK	1100
		7900	JAMES	CLERK	950
		7902	FORD	ANALYST	3000
		7934	MILLER	CLERK	1300
		1600	황보슬	SALESMAN	3500
		3000	유지원	SALESMAN	3850
		3100	황정후	"MANAGER" 3500 */
		
		if(rs.next()){
			do {
				// 로우 단위 별로 ArrayList에 저장
				Emp emp = new Emp();
				emp.setEmpno(rs.getInt(1));
				emp.setEname(rs.getString(2));
				emp.setJob(rs.getString(3));
				emp.setSal(rs.getInt(4));
				arr.add(emp);
			}while(rs.next());
			// 통째로 저장
			request.setAttribute("arr", arr);
			// 메모리 관리를 위해 close하는 것.
			rs.close();
			stmt.close();
			conn.close();
/* 			
		RequestDispatcher rd = request.getRequestDispatcher("ora05Result.jsp"); //mvc1 */ 
			RequestDispatcher rd = request.getRequestDispatcher("ora05Result2.jsp"); // mvc2
			rd.forward(request, response);
			
		}else{
			out.println("데이터가 없습니당");
			stmt.close();
			conn.close();
		}
%>

</body>
</html>