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
		int sum = 0;
		for (int i = 1; i <= 100; i++){
			sum += i;
		}
		request.setAttribute("sum1", sum);
		// pageContext는 이 페이지안에서만 사용가능 잘 사용하지 않음
		pageContext.setAttribute("sum2", sum);
		RequestDispatcher rd = request.getRequestDispatcher("hunResult2.jsp");
		rd.forward(request, response);
	%>
	
<%-- 	
	sum1: ${sum1 } <p>
	sum2: ${sum2 } <p> --%>
</body>
</html>