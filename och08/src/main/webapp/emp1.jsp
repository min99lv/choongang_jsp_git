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
	// 현장Work02
	// Bean  : emp, class : Emp
	// 모든 property 저장
	// 이동: empResult.jsp
	//        사번 : 
	//        이름 : 
	//        업무 : 
	//        급여 : 
	//       입사일 :    
-->
<%
	int empno1 = Integer.parseInt(request.getParameter("empno1"));
	
%>
<jsp:useBean id="emp" class="och08.Emp" scope="request"/>
<%-- <jsp:setProperty property="*" name="emp"/> 프로퍼티 이름을 다르게 했을대 --%>
<jsp:setProperty property="empno" name="emp" value="<%=empno1%>"/>
<jsp:setProperty property="ename" name="emp" />
<jsp:setProperty property="job" name="emp"/>
<jsp:setProperty property="sal" name="emp"/>
<jsp:setProperty property="hiredate" name="emp"/>
<jsp:forward page="empResult.jsp"/>
</body>
</html>