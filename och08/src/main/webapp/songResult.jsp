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
// 1.  표준Tag                  songResult.jsp로 이동 
// 2. songResult.jsp.jsp        Expression 표기법      
//      XX님이 좋아하는 음악은  k1 k2 이군요
 -->
	<%
	String name = request.getParameter("name");
	String[] song = request.getParameterValues("song");
	String songs = "";

	if (song != null) {

		for (int i = 0; i < song.length; i++) {
			songs += song[i] + " ";
		}

	}
	%>
	<%=name%>님이 좋아하는 음악은
	<%=songs%>
	이군요

</body>
</html>