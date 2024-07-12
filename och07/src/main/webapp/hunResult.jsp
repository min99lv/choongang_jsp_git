<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
1.Expression --> sum1<p>
<% String sum1 = request.getAttribute("sum1").toString(); %>

2.EL --> sum2<p>
${sum2 }<p>

익스프레션 식...표기
<%= request.getAttribute("sum1") %><p>
</body>
</html>