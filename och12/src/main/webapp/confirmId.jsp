<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id = request.getParameter("id");
%>
<script type="text/javascript">
function wincl() {
	opener.document.frm.id.value="<%=id%>";
	window.colse();
}
</script>
<body>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.confirm(id);
	// 존재하지 않는 사용자
	if (result == 0){
%>
<%=id %>는 사용할 수 있습니다<p>
<input type="button" value="닫기" onclick="wincl()";>
<% } else { %>
<%=id %>는 이미 있는 아이디니 다른 아이디를 입력하세요<p>
<form><!-- form에 아무것도 넣지 않았을때 입력할때까지 순환한다. -->
	아이디 <input type="text" name="id"><p>
	<input type="submit" value="확인">
</form>
<%} %>
</body>
</html>