<!--  클래스 임포트 -->
<%@page import="java.io.FileWriter"%>  <!-- 문자 파일을 작성할때 사용  -->
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시판</h1>
	<%
	// 내장객체는 그냥 사용가능 외부 객체는 임포트후 사용
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	// 메시지 생성
	String msg = "제목 : " + title + "\r\n"; // = enter 
	msg += "작성자 : " + writer + "\r\n";
	msg += "내용 : " + content + "\r\n";
	
	// 현재 시간 가져오기
	Date date = new Date();
	long fileName = date.getTime(); // long타입으로 현재 타임 저장
	
	// 파일 경로 생성 
	// 파일은 WEB-INF/out/ 디렉토리에 저장/ 메타데이터로 잡힘-> 배포..어쩌구 때문에
	String real = application.getRealPath("/WEB-INF/out/" + fileName + ".txt");
	
	// 생성된 파일 경로를 출력
	System.out.println(real);
	
	// 파일 생성
	FileWriter fw = new FileWriter(real);
	// 파일에 msg 저장
	fw.write(msg);
	// 파일 닫기
	fw.close();
	
	// 입력 데이터를 html로 출력하여 브라우저에 표시
	// jsp안에서 out은 내장객체 - 서블릿에서는 내장객체가 아니므로 선언해야함
	out.println("제목:" + title + "<br>");
	out.println("작성자:" + writer + "<br>");
	out.println("내용:" + content + "<br>");
	%>
	저장성공
</body>
</html>