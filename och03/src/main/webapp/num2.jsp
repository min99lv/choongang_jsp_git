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
	int num = Integer.parseInt(request.getParameter("num"));
	int sum = 0;
	
	
	out.print("</body></html>");
	for(int i = 0; i< num; i++){
		sum += i;
		out.print(i+"일때 합계는"+sum +"<br>");
	}
	out.print("<html><body>");
%>
</body>
</html>