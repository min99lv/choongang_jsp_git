<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Arrays"%>
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
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String[] hobby = request.getParameterValues("hobby");
	String gender = request.getParameter("gender");
	
	String hobbys ="";
	String msg = "아이디:" +id +"\r\n";
	msg += "암호:" +password +"\r\n";
	msg += "이름:" +name+"\r\n";	
	for (int i = 0;  i<hobby.length; i++){
		hobbys += hobby[i]+" ";
	}
	msg += "취미:" + hobbys +"\r\n";		
	msg += "성별:"+ gender + "\r\n";
	
	String real = application.getRealPath("/WEB-INF/file/" + id + ".txt");
	System.out.println(real);
	FileWriter fw = new FileWriter(real);
	fw.write(msg);
	fw.close();
	
%>
<h2>회원정보</h2>
아이디 : <%=id %><p>
암호 : <%=password %><p>
이름 : <%=name %><p>
취미 : <%=hobbys %><p>
성별 : <%=gender %><p>

</body>
</html>