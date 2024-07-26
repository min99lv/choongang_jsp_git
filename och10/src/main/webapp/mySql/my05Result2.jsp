<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr:hover{
	background-color: red;}
</style>
</head>
<body>
<h2>사원명단 model2 view + jstl</h2>
<table>
	<table width="100%" bgcolor="yellow" border="1">
		<tr bgcolor="pink">
			<td>사번</td>
			<td>이름</td>
			<td>업무</td>
			<td>급여</td>
		</tr>
		<c:forEach var="p" items="${al}">
			<tr>
				<td>${p.profno}</td>
				<td>${p.name}</td>
				<td>${p.getPosition()}</td>
				<td>${p.getSal()}</td>
			</tr>
		</c:forEach>
		
</table>

</body>
</html>