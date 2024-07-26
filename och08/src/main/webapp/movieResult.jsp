<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--   
// 1.  표준Tag                  movieResult.jsp로 이동 
// 2.   movieResult.jsp        Expression 표기법      
//      XX님이 좋아하는 영화은 kq, k2 이군요
 
 -->
<%
	String name = request.getParameter("name");
	String[] movie = request.getParameterValues("movie");
	String movies = "";
	System.out.println("movie.length : "+movie.length);
	
	if(movie != null){
		for (int i = 0; i < movie.length; i++){
			if(i == (movie.length -1)) 
				movies += movie[i];
			else
				movies += movie[i]+", ";
		}
	}
%>
<%=name %> 님이 좋아하는 영화는 <%=movies %> 이군요

</body>
</html>