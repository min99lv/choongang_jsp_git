<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>${param.nameId }님이 좋아하는 동물은 </h1>
${paramValues.pet[0] } <br>
${paramValues.pet[1] } <br>
${paramValues.pet[2] } <br>
${paramValues.pet[3] } <br>
${paramValues.pet[4] } <br> 
<!-- 밸류를 다 써주어도 선택된 것만 출력됨 -->
</body>
</html>