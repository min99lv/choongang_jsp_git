<%@page import="och10.Division"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%-- <% 
	Division division = (Division)request.getAttribute("division");
%> --%>
<body>
부서번호 : ${division.dno} <p>
부서명 :${division.dname} <p>
전화번호 : ${divison.phone} <p>
근무지 : ${division.position} <p>

</body>
</html>