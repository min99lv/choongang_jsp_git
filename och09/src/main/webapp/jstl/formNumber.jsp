<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 세자리 수마다 콤마 = groupingUsed="true"  1,000,000 -->
	<fmt:formatNumber value="1000000" groupingUsed="true" /><br>
	<!-- 3.142  -->
	<fmt:formatNumber value="3.1415923" pattern="#.###" /><br>
	<!-- 3.1 -->
	<fmt:formatNumber value="3.1" pattern="#.##" /><br>
	<!-- 3.10 -->
	<fmt:formatNumber value="3.1" pattern="#.00" /><br>
	<!-- 121,434,323,453.00 -->
	<fmt:formatNumber value="121434323453." pattern="#,###.00" /><br>
	<!-- \250,000 -->
	<fmt:formatNumber value="250000" type="currency"  currencySymbol="\\"/><br>
	<!-- 75%  -->
	<fmt:formatNumber value="0.75" type="percent" /><br>
</body>
</html>