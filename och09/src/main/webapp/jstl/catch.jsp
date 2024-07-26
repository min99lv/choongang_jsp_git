<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- @: 선언자  -->
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Lib Core</title>
</head>
<body>
<!-- num에서 호출 try-catch = c: catch -->
<c:catch var="e1"> <!-- 에러가 나면 에러를 e1에 저장 -->
	<%
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));
	%>
	나눗셈 결과 : <%=num1/num2 %>
</c:catch>

<c:if test="${e1 != null }"> <!-- e1이 null이 아니면 오류가 난 것이므로 오류메세지 출력  -->
	에러메세지 : ${e1.message }
</c:if>

</body>
</html>