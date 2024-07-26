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
	<form action="oraUpdate.jsp">
		부서코드 : ${deptno}<p>
		<input type="hidden" name="deptno" value="${deptno}">
		<p>
			부서명 : <input type="text" name="dname" value="${dname}">
		<p>
			근무지 : <input type="text" name="loc" value="${loc}">
		<p>
			<input type="submit" value="수정완료">
		</p>
</form>
</body>
</html>