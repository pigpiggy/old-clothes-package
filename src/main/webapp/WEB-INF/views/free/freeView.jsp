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
                   <section id="basicInfoArea">
                   <dl>
                        <dt>제목</dt>
                        <dd>${article.ftitle }</dd>
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
            </div>
          </div>
    </div> 
                </section>
                <div class="cont" id="center">               
                  <p id="contentp">${article.fcontent }</p>                                                
                </div>              
                          <input type="hidden" name="fno" id="fno" value="${article.fno }">               
            <div class="bt_wrap">            
                <a id="input4" href="/freeList" class="on">목록</a>
               <c:if test="${ authUser.sect eq 'users' }">
                <c:if test="${authUser.userno eq article.userno}">                 
	                <a href="/modifyform/${article.fno }">수정</a>
	                <input id="freeDelete"  onclick="freeRemove()" type="submit" value="삭제">
                </c:if>
                </c:if>
            </div>
   <script>
   function freeRemove() {
		var result = confirm("삭제하시겠습니까? 삭제 후 취소가 불가능합니다.");
		var fno =  $('#fno').val();
		if(result) {
			$.ajax({
				type : "post",
				url : "/freeDelete",
				data : {fno:fno},
				success : function(data) {
					alert("삭제가 완료되었습니다.");
					location.href="/freeList";
				},
				error : function(err) {
					console.log(err);
				}
			});
		}
		
	}
   </script>
</body>
</html>