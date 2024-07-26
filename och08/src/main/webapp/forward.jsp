<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>처리결과</h2>
<!--   
// 1.  표준Tag                  forwardResult.jsp로 이동 
// 2. forwardResult.jsp        Expression 표기법      
//      XX님 KKK에 사시는 군요 
 -->
<%-- <%
RequestDispatcher rd = request.getRequestDispatcher("forwardResult.jsp");
rd.forward(request, response);

%> --%>

<jsp:forward page="forwardResult.jsp"/>

</body>
</html>