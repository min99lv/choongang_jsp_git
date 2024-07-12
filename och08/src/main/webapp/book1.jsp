<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="pt" class="och08.Book" scope="request"     />	<!--  태그 닫기 생략가능-->
	<!--  setAttribute랑 같음 이름을 자바빈에 name을  맞춰준다 이름 기준으로 작동함--> 
	<jsp:setProperty property="*" name="pt"/>
	<jsp:forward page="productInfo.jsp"></jsp:forward>
</body>
</html>