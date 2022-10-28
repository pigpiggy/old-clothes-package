<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    <link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
    <link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />
    
    
        <title>자유게시판</title> <!--페이지 상단바-->
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
    <div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
        <div class="board_list_wrap"> <!--표와 페이징이 들어감-->
        <table class="board_list">
            <caption>자유게시판</caption><!--배너 제목-->
            <thead>
                <tr>
                <th>글번호</th>
                <th>제목</th>
                <th>닉네임</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            </thead>
                <tr>
                    <td>5</td>
                    <td>저메추 부탁드립니다.</td>
                    <td>김NaNa</td>
                    <td>2022-10-27</td>
                    <td>6</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>오늘 가산동 아름다운가게 같이 가실분 구합니다.</td>
                    <td>조정하기</td>
                    <td>2022-10-03</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>굿윌스토어랑 아름다운가게 기부해보신분?</td>
                    <td>홍솜솜</td>
                    <td>2022-09-23</td>
                    <td>33</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>무료나눔 했는데 이런분도 계시네요...</td>
                    <td>김감김</td>
                    <td>2022-9-11</td>
                    <td>123</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>[독산동] 옷 같이 모아서 업체에 파실분 계신가요?</td>
                    <td>MoonMoon</td>
                    <td>2022-08-31</td>
                    <td>3</td>
                </tr>

        </table>
        <div class="paging">
            <a href="#" class="bt"><</a>
            <a href="#" class="num">1</a>
            <a href="#" class="num">2</a>
            <a href="#" class="num">3</a>
            <a href="#" class="num">4</a>
            <a href="#" class="bt">></a>
        </div>
    </div>
    <form class="searching">
        <input type="text" name="query" placeholder="검색어를 입력하세요">
        <button class="button">검색</button>
    </form>
    </body>
</html>