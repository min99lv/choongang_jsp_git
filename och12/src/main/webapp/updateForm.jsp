<%@page import="och12.Member"%>
<%@page import="och12.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ include file="memberCheck.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	background-color: pink;
}
</style>
</head>
<body>
	<%
	MemberDao md = MemberDao.getInstance();
	// id를 받지 않았는데 들어온 이유 -> include file ="memberCheck.jsp"에 세션에서 들어옴  
	Member member = md.select(id);
	// webapp폴더에 폴더별로 정민, 지원 폴더를 만들어 사용하였을때
	// main.jsp랑 error.jsp만 루트 디렉터리에 꺼내놓았을때 
	// 폴더가 깊어지면 updatePro.jsp를 못찾을 수 도 있는데
	// context를 해주면 폴더를 찾을 수 있다
	String context = request.getContextPath(); // tomcat Meta data
	%>
	<h2>회원정보 수정</h2>
	<form action="updatePro.jsp">
		<table border="1" id="table">
			<tr>
				<td>아이디</td>
				<td><%=id%> <input type="hidden" class="id" name="id" id="id"
					value="<%=member.getId()%>"></td>
			</tr>
			<tr>
				<td>암호</td>
				<td><input type="password" name="passwd" id="passwd"
					required="required"></td>
			</tr>

			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required="required"
					value="<%=member.getName()%>"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="address" required="required"
					value="<%=member.getAddress()%>"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="tel" name="tel" required="required"
					pattern="\d{2,3}-\d{3,4}-\d{4}" value="<%=member.getTel()%>">
				</td>
			</tr>
			<tr>
				<td>날짜</td>
				<td><%=member.getReg_date()%> 
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="확인"></td>
				<td><input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>