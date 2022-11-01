<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko"><!--최종본-->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 글목록</title>
    <link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
	<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />

<!--html에서는 css.css만 불러오면 그 안에 import되어 있으므로-->
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
                <div>
                    <div class="num">5</div>
                    <div class="title"><a href="view.html">저메추 부탁드립니다.</a></div>
                    <div class="writer">김NaNa</div>
                    <div class="date">2022-10-27</div>
                    <div class="count">6</div>
                </div>
                <div>
                    <div class="num">4</div>
                    <div class="title"><a href="view.html">오늘 가산동 아름다운가게 같이 가실분 구합니다.</a></div>
                    <div class="writer">조정하기</div>
                    <div class="date">2022-10-03</div>
                    <div class="count">11</div>
                </div>
                <div>
                    <div class="num">3</div>
                    <div class="title"><a href="view.html">굿윌스토어랑 아름다운가게 기부해보신분?</a></div>
                    <div class="writer">홍솜솜</div>
                    <div class="date">2022-09-18</div>
                    <div class="count">33</div>
                </div>
                <div>
                    <div class="num">2</div>
                    <div class="title"><a href="view.html">무료나눔 했는데 이런분도 계시네요...</a></div>
                    <div class="writer">김감김</div>
                    <div class="date">2022-09-11</div>
                    <div class="count">123</div>
                </div>
                <div>
                    <div class="num">1</div>
                    <div class="title"><a href="view.html">[독산동] 옷 같이 모아서 업체에 파실분 계신가요?</a></div>
                    <div class="writer">MooonMoon</div>
                    <div class="date">2022-08-31</div>
                    <div class="count">56</div>
                </div>               
            </div>
            <div class="board_page">
                <a href="#" class="bt first"><<</a>
                <a href="#" class="bt prev"><</a>
                <a href="#" class="num on">1</a>
                <a href="#" class="num">2</a>
                <a href="#" class="num">3</a>
                <a href="#" class="num">4</a>
                <a href="#" class="num">5</a>
                <a href="#" class="bt next">></a>
                <a href="#" class="bt last">>></a>
            </div>
            <form class="searching">
                <input type="text" name="query" placeholder="검색어를 입력하세요">
                <button class="button">검색</button>
            </form>
            <div class="bt_wrap">
                <a href="freeRegist" class="on">글쓰기</a>
            </div>
            
        </div>
    </div>
</body>
</html>