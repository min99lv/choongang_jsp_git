<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 주소로서 파라메터 값으로 받았기때문에 param사용 -->
	${param.NAME }의 주소는 ? ${Address[param.NAME] }<p>
	${Address.Jasica }<p>
	${Address.Susan }<p>
</body>
</html>