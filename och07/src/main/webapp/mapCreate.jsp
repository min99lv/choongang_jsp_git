<%@page import="java.util.HashMap"%>
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
		HashMap<String, String> addrMap = new HashMap<String,String>();
		addrMap.put("Park", "목동");// 키와 밸류 원소를 집어넣는 법 : put();
		addrMap.put("박", "까치산");
		addrMap.put("Jasica", "크라이스 처치");
		addrMap.put("Susan", "시드니");
		request.setAttribute("Address", addrMap);
		// "mapView.jsp?NAME=Park" : 폼문에서 보내는것과 똑같은 ... url@@!!!
		RequestDispatcher dispatcher = request.getRequestDispatcher("mapView.jsp?NAME=Park");
		dispatcher.forward(request, response);
	%>
</body>
</html>