<%@page import="och10.Professor"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr:hover	{	background-color:  red; }
</style>
</head>
<body>
<%
// al을 가져옴
ArrayList<Professor> al = (ArrayList<Professor>)request.getAttribute("al");

%>
	<table width="100%" bgcolor="yellow" border="1">
		<tr>
			<td>사번</td>
			<td>이름</td>
			<td>업무</td>
			<td>급여</td>
		</tr>
		<%
		for(int i = 0; i < al.size(); i++){
			out.println("<tr><td>"+al.get(i).getProfno()+"</td>");
			out.println("<td>"+al.get(i).getName()+"</td>");
			out.println("<td>"+al.get(i).getPosition()+"</td>");
			out.println("<td>"+al.get(i).getSal()+"</td></tr>");
		}
		
		%>
	</table>

</body>
</html>