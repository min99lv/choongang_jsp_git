<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 	java : Person person = new Person();  = usebean문장과 같은 의미 내부적 -->
	<jsp:useBean id="person" class="och08.Person" scope="request" />
	
	<%-- java :person.setName("<%=name%>") --%>
	<!-- 입력받은 값을 파라메터로 받음 -->
	<jsp:setProperty property="name" name="person" param="name"/>
	
	<!-- 	java : person.getName(); -->
	<!-- 입력받은 값을 value로 출력함 -->
	<jsp:setProperty property="gender" name="person" value="남자"/>
	
	
	<h2>인적 사항</h2>
	<!--  set없이 get으로만 값을 볼 수 있는지 확인  -> 에러 bean을 사용하면 set먼저 해야함  -->
	이름 : <jsp:getProperty property="name" name="person"/><p>
	성별 : <jsp:getProperty property="gender" name="person"/><p>
	나이 : <jsp:getProperty property="age" name="person"/><p>

</body>
</html>