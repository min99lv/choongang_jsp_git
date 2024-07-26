<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	// 5M : 사이즈 한정
	int maxSize = 5 * 1024 * 1024;
	String fileSave = "/fileSave";
	// Meta Date
	String realPath = getServletContext().getRealPath(fileSave);
	System.out.println("realPaht->" + realPath);
	// 이미지를 호출하는 객체 생성 = cos 라이브러리						
	MultipartRequest multi =  // 
		new MultipartRequest(request, realPath, maxSize,"utf-8" ,new DefaultFileRenamePolicy());
	
	%>
</body>
</html>