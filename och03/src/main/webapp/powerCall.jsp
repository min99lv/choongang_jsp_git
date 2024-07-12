<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
2^1 = <%=power(2,1) +1 %><p> <!--연산식 가능  선언부가 있다면 위치는 상관없음-->
2^2 = <%=power(2,2) %><p>
2^3 = <%=power(2,3) %><p>
2^4 = <%=power(2,4) %><p>
2^5 = <%=power(2,5) %><p>
<%! 
	// x의 y승을 구하는 메소드
	int power(int x, int y){
	int result = 1;
	for (int i = 0; i < y; i++){
		result *= x;
	}
	return result;
}

%>
</body>
</html>