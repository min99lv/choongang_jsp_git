<%@page import="och10.Dept"%>
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
	Dept dept = (Dept)request.getAttribute("dept");

%>
<!-- private을 가져오기때문에  메소드를 선언해야함 -->
<h2>Expression 표기법</h2>
부서코드:<%= dept.getDeptno()%><p>
부서명:<%=dept.getDname()%><p>
근무지<%=dept.getLoc()%><p>


<!--  필드에 접근하는 것 같지만 내부적으로 getter로 접근함 getter를 막으면 오류가 남 -->
<h2>El표기법 부서정보(같은 의미)</h2>
부서코드 :${dept.getDeptno()}<p>
부서명 : ${dept.dname }<p>
부서명 : ${dept.loc }<p> 
</body>
