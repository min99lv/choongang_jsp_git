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

<%= sum1 %><p>

2.EL --> sum2<p> <!-- pageContext 범위가 지정되어 있어서 출력 X  -->
${sum2 }<p>
</body>
</html>