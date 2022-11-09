<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판 글목록</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />


</head>
<body>

	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	
	<div class="board_wrap">
		<div class="board_title">
			<strong>자유게시판</strong>
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">글번호</div>
					<div class="title">제목</div>
					<div class="writer">닉네임</div>
					<div class="date">작성일</div>
					<div class="count">조회수</div>
				</div>
				<c:forEach var="free" items="${articleList}">
				
				<div>
					<div class="num">${free.fno}</div>
					<div class="title">
						<a href="view.html">${free.ftitle}</a>
					</div>
					<div class="writer">${free.fname}</div>
					<div class="date">${free.regdate}</div>
					<div class="count">${free.freadcount}</div>
				</div>
				</c:forEach>
			</div>
			<div class="board_page">
				<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
				<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
					href="#" class="num">3</a> <a href="#" class="num">4</a> <a
					href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
					href="#" class="bt last">>></a>
			</div>
			<form class="searching">
				<input type="text" name="query" placeholder="검색어를 입력하세요">
				<button class="button">검색</button>
			</form>
			<div class="bt_wrap">
				<a href="freeRegistForm" class="on">글쓰기</a>
			</div>

		</div>
	</div>
</body>
</html>