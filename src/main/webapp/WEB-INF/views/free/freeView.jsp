<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 글보기</title>
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
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                    저메추 부탁드립니다.
                </div>
                <div class="info">
                    <dl>
                        <dt>글번호</dt>
                        <dd>5</dd>
                    </dl>
                    <dl>
                        <dt>닉네임</dt>
                        <dd>김NaNa</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>2022-10-27</dd>
                    </dl>
                    <dl>
                        <dt>조회수</dt>
                        <dd>6</dd>
                    </dl>
                </div>
                <div class="cont">
                    너무 배고프네요...<br>
                    매일 라면만 먹었더니 너무 질려요 ㅠㅠ<br>
                    저메추 해주세요ㅎㅎ                    
                </div>                
            </div>
            <div class="bt_wrap">
                <a href="freeList" class="on">목록</a>
                <a href="freeModify">수정</a>
            </div>
        </div>
    </div>
</body>
</html>