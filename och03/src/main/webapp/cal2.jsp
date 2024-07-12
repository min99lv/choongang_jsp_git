<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
요기는 연산만 하고 결과는 다음 페이지
<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
		// 사칙연산을 실행
		int add = num1 + num2;
		int min = num1 - num2;
		int mul = num1 * num2;
		int div = num1 / num2;
		// int add 의 파라메터 값을 "add"라는 파라메터 변수 이름으로 저장하겠다 
		request.setAttribute("add", add); 
		request.setAttribute("min", min); 
		request.setAttribute("mul", mul); 
		request.setAttribute("div", div);
		// 선언 calResult.jsp로 이동하겠다 선언
		RequestDispatcher rd = request.getRequestDispatcher("calResult.jsp");
		// 페이지 진짜 이동 내가 받은 요청과 응답이 들어감
		rd.forward(request, response);	
%>
</body>
</html>