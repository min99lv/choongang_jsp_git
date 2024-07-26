<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 향상형 for문 같은 개념 col안에 items에 있는 값이 한번씩 들어감  -->
 									<!-- 배열객체를 데리고옴 {"red", "orange", "yellow","green", "blue", "navy", "violet"}; -->
	<c:forEach var="col" items="${color }">
		<font color="${col }">야호</font>
	
	</c:forEach>
</body>
</html>