<%@page import="java.util.ArrayList"%>
<%@page import="och10.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr: hover
	{
		background-color:  red;
	}

</style>
</head>
<body>
	<h2>MVC model 1 view</h2>
	
	<%
	ArrayList<Emp> arr = (ArrayList<Emp>)request.getAttribute("arr");
	%>
	
	<table width="100%" bgcolor="yellow" border="1">
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>업무</th>
			<th>급여</th>
		</tr>
		<%
			for(int i = 0; i < arr.size(); i++){
				out.println("<tr><td>"+arr.get(i).getEmpno()+"</td>");
				out.println("<td>"+arr.get(i).getEname()+"</td>");
				out.println("<td>"+arr.get(i).getJob()+"</td>");
				out.println("<td>"+arr.get(i).getSal()+"</td></tr>");
			}
		%>


	</table>


</body>
</html>