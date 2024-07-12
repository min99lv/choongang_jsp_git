<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<% 
		String color = request.getParameter("color");
		
	%>
<body bgcolor="<%= color%>"> 
<!-- 익스프레션 표기법(자바식을 html에서 사용가능)  -->
</body>
</html>