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
	String info = application.getServerInfo();  // 서버 정보
	int major = application.getMajorVersion(); // 서블릿 버전 : 정수부분
	int minor = application.getMinorVersion(); // 서블릿 버전 : 소수부분
	String path = application.getRealPath("/"); 
	// ***  로컬 시스템 경로 : 기준점이 되어줌 중요 ("/"): 나의 루트
%>

	<h2>Application내장객체 예제</h2>
	웹 컨테이너의 이름과 버전 :
	<%=info %><p>
	서블릿 버전 : <%=major %> <%=minor %><p>
	웹 어플리케이션 폴더의 로컬 시스템 경로 : <%=path %>
	
</body>
</html>