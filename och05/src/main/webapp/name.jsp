<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error2.jsp" %> <!-- 에러페이지로 이동 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=request.getParameter("name").toUpperCase()%></h2>
	<%
	int num = Integer.parseInt(request.getParameter("num")); 
	%>
</body>
</html>