<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.GregorianCalendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!// 메소드나 멤버변수, 전역변수 선언부 --> init()
	private PrintWriter pw;
	String date;

	public void jspInit() {
		GregorianCalendar gc = new GregorianCalendar();

		date = String.format("%TF %TT", gc, gc);
		System.out.println("jspInit date-> "+date);
		// replaceAll : 이 있으면 빈칸으로 대체한다 -> 파일 이름에  ":" 있으면 X
		String fileName = "c:/log/" + date.replaceAll(":", "") + ".txt";
		try {
			pw = new PrintWriter(new FileWriter(fileName, true));

		} catch (Exception e) {
			System.out.println("대박! 으이구");
		}

	}%>
	<%
	// doGet / doPost
	String name = request.getParameter("name");
	System.out.println(name + "사회활동");
	String msg = name +"님 반가워";
	// Browser화면 출력
	out.println(msg + "<p> 현재시간:" + date );
	// File 출력
	pw .println(msg + "\r\n 현재시간:" + date + "\r\n");
	%>
	<%!// 메소드나 멤버변수, 전역변수 선언부 --> destory()
		public void  jspDestroy(){
		System.out.println("greet의 유언활동");
		pw.flush(); // 버퍼에 내용이 있으면 보내주고 끝내라
		if (pw != null)
			pw.close();
	}
	%>
</body>
</html>