<%@page import="java.net.URLEncoder"%>
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
// name이라는 정보에 중앙정보라는 쿠키를 생성
	Cookie cook2 = new Cookie("name", URLEncoder.encode("중앙정보","utf-8"));
	response.addCookie(cook2);
%>
쿠키저장 성공<p>
<a href="cookView2.jsp">쿠키보기</a>
</body>
</html>