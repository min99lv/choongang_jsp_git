<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>연산결과 cal3</h2>
	<%
	try {
		int num1 = Integer.parseInt(request.getParameter("num1"));
		int num2 = Integer.parseInt(request.getParameter("num2"));

		out.println(num1 + "+" + num2 + "=" + (num1 + num2) + "<p>");
		out.println(num1 + "-" + num2 + "=" + (num1 - num2) + "<p>");
		out.println(num1 + "*" + num2 + "=" + (num1 * num2) + "<p>");
		out.println(num1 + "/" + num2 + "=" + (num1 / num2) + "<p>");

	} catch (NumberFormatException e) {
	%>
	<script type="text/javascript">
		alert("그게 숫자냐?") 
		history.go(-1);/* -1: 전페이지 , -2 : 전전페이지 */
	</script>
	<%
	} catch (ArithmeticException e) {
	%>
	<script type="text/javascript">
		alert("헐 0으로 나누다니"); 
		history.back(); /* back : 전페이지 */
	</script>
	<%
	} catch (Exception e) {
		out.println(e.getMessage());
	%>
	<script type="text/javascript">
		alert("하여튼 에러야");
		location.href="num2.html"; /* 페이지 이동 */
	</script>
	<%	} %>


</body>
</html>