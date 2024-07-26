<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 서버 프로그램으로만 이용
	double[] temp = { 9.8, 30.2, 24.7, 23.7, 23.1 };
	for (int i = 0; i < temp.length; i++) {
		/* out.println(temp[i]); */
		out.println(temp[i]);
		// 끝이 아니면 , 를 집어넣음 -> 로직
		if (i != (temp.length - 1)) {
	out.print(",");
		}
	}
%>