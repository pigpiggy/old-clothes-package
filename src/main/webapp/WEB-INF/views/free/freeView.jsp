<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 글보기</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<<<<<<< HEAD
	<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />  
	  
=======
	<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script	src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
<script>
$(function() {
	ClassicEditor.create(document.querySelector("#editor"))
	.then(editor=> {
		editor.setData('${content}');
	})
	.catch((error)=> {
		console.error(error);
	})
});
</script>    
>>>>>>> 959769eeb82c580b58d37fe86d17b68a8cb87952
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
                   <section id="basicInfoArea">
                   <dl>
                        <dt>제목</dt>
<<<<<<< HEAD
                        <dd> "${article.ftitle}"</dd>
=======
                        <dd>${article.ftitle }</dd>
>>>>>>> 959769eeb82c580b58d37fe86d17b68a8cb87952
                    </dl>
                         </section>
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
<<<<<<< HEAD
               
                </section>
                <div class="cont" id="center">               
                  ${article.fcontent }                                                
                </div>              
            </div>
=======
                <div id="editor">
               <%-- <section id="articleContentArea">--%>
                                      
                </div>                
>>>>>>> 959769eeb82c580b58d37fe86d17b68a8cb87952
            </div>
            <div class="bt_wrap">
                <a href="/freeList" class="on">목록</a>
                <a href="/freeModify/${article.fno }">수정</a>
            </div>
    </div>
    </section>
</body>
</html>