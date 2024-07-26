<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>부서 정보 수정</h2>
	<!-- 프라이머리키는 보여주기만 하고 히든으로 가져감 -->
	<form action="myUpdate.jsp">
		부서코드 : ${dno}<p>
		<input type="hidden" name="dno" value="${dno}">
		<p>
			부서명 : <input type="text" name="dname" value="${dname}">
		<p>
			전화번호 : <input type="text" name="phone" value="${phone}">
		<p>
			근무지 : <input type="text" name="position" value="${position}">
		<p>
			<input type="submit" value="수정완료">
		</p>
</form>
</body>
</html>