<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css">
table {
	width: 100%
}
</style>
</head>
<body>
	<h1>게시판</h1>
	<!-- ListAction.java에서 setAttribute한 값 -->
	<h3>리스트 갯수 : ${totCnt }</h3>
	<table>
		<tr>
			<td><a href="writeForm.do">글쓰기</a></td>
		</tr>
	</table>

	<table>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>이메일</td>
			<td>IP</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<%-- <c:set var="numbering" value="{(currnt-1)*10+1"/> --%>
		<c:if test="${totCnt > 0 }">
			<c:forEach var="board" items="${list }">
				<tr>
					<!-- 최근 게시물 마지막 번호  -->
					<td>${startNum }</td>
					<td class="left" width=200>
						<!-- 조회수가 20명이 넘으면 인기 게시물 --> <c:if
							test="${board.readcount > 20 }">
							<img src="images/hot.gif" onmouseover="getDeptName(${board.num})">
						</c:if> <!-- re_level : 0 원글 1 댓글 2 대댓글 --> <c:if
							test="${board.re_level > 0 }">
							<img src="images/level.gif" width="${board.re_level*10}">
							<img src="images/re.gif">
						</c:if> <!-- 제목으로 페이지이동 : 원글 보기  뒤로갈때 전페이지로 돌아가야하기땨문에 페이지 번호를 가지고 댕김--> <a
						href='content.do?num=${board.num}&pageNum=${currentPage}'>
							${board.subject}</a>

					</td>
					<td>${board.writer }</td>
					<td><a href="mailto:${board.email}">${board.email }</a></td>
					<td>${board.ip }</td>
					<td>${board.reg_date }</td>
					<td>${board.readcount }</td>
				</tr>
				<c:set var="startNum" value="${startNum-1 }" />
				<!-- <c:set var="numbering" value="${numbering + 1 }" />  -->
			</c:forEach>
		</c:if>
		<!-- 위에 로직에 걸리지 않으면 데이터가 0  -->
		<c:if test="${totCnt == 0 }">
			<tr>

				<td colspan="7">데이터가 없네</td>
			</tr>

		</c:if>
	</table>

	<div style="text-align: center;">
		<!-- 1 > 10 이전페이지를 뿌려줌 -->
		<c:if test="${startPage > blockSize }">
			<a href='list.do?pageNum=${startPage-blockSize }'>[이전]</a>
		</c:if>
		<!-- 현재 페이지 번호 -->
		<c:forEach var="i" begin="${startPage}" end="${endPage }">
			<a href='list.do?pageNum=${i }'>[${i }]</a>
		</c:forEach>
		<c:if test="${endPage<pageCnt }">
			<a href='list.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>



</body>
</html>