<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 글보기</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
	<link href="<c:url value="/resources/css/notice.css"/>" rel='stylesheet' />  
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	<section id="articleForm">
    <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항</strong>
        </div>
        <div class="board_view_wrap">
            <div class="board_view">
                  <div class="title">
                   <section id="basicInfoArea">
                   <dl>
                        <dt>제목</dt>
                        <dd>${article.ntitle }</dd>
                    </dl>
                         </section>
                </div>
                <div class="info">
                    <dl>
                        <dt>글번호</dt>
                        <dd>${article.nno }</dd>
                    </dl>                   
                    <dl>
                        <dt>작성일</dt>
                        <dd>${article.regdate }</dd>
                    </dl>
                    <dl>
                        <dt>조회수</dt>
                        <dd>${article.nreadcount}</dd>
                    </dl>
                </div>
            </div>
          </div>
    </div> 
                </section>
                <div class="cont" id="center">               
                  ${article.ncontent }                                                
                </div>              
                          <input type="hidden" name="nno" id="nno" value="${article.nno }">               
            <div class="bt_wrap">            
                <a id="input4" href="/noticeList" class="on">목록</a>               
            </div>

</body>
</html>