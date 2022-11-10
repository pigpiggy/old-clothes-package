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
	<section id="articleForm">
    <div class="board_wrap">
        <div class="board_title">
            <strong>자유게시판</strong>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                <div class="title">
                   <dl>
                   <section id="basicInfoArea">
                        <dt>제목</dt>
                        <dd><input type="text" name="ftitle" value= ${article.ftitle} placeholder="제목 입력"></dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>글번호</dt>
                        <dd>${article.fno }</dd>
                    </dl>
                    <dl>
                        <dt>닉네임</dt>
                        <dd>${article.fname }</dd>
                    </dl>
                    <dl>
                        <dt>작성일</dt>
                        <dd>${article.regdate }</dd>
                    </dl>
                    <dl>
                        <dt>조회수</dt>
                        <dd>${article.freadcount}</dd>
                    </dl>
                </div>
                <div class="cont">
                <section id="articleContentArea">
                    <textarea placeholder="ck에디터 들어갑니다" value=${article.fcontent} name="fcontent"></textarea>                    
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