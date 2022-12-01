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
	<script>
function check(){
	var comment = document.getElementById("ccontent");
	if(comment.value == ''){
		alert("댓글을 작성해주시기 바랍니다.");
		return false;
	}
}
</script>  
	<style>
.deletecmt{
	position: relative;
    width: 42px;
    left: 1099px;
    bottom: 100px;
    height: 26px;
}
#cmtmodify{
	position: relative;
    width: 42px;
    left: 1098px;
    bottom: 100px;
    height: 26px;
}

.viewcont {
	left: 21%;
    position: relative;
    width: 1100px;
    height: 216px;
    border-bottom: 2px solid navy;
}
</style>
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
                <div class="viewcont" id="freeview">               
                  <p id="contentp">${article.fcontent }</p>                                                
                </div>                
                <br><br>
                <br><br>
                <%--댓글 작성 --%> 
                <c:choose>
                <c:when test="${authUser.sect eq 'users' }">
                <div class="container">
					<div class="form-group">					
						<form method="post" action="/ufreeView/${article.fno }/${authUser.userno}" onsubmit="return check();">
							<table class="table table-striped" style="position: relative;width: 1040px;left: 80%;text-align: center; border: 1px solid #dddddd">
								<tr>
									<td style="border-bottom:none;" valign="middle"><br><br><p id="csect">${authUser.sect }</p></td>
									<td style="border-bottom:none;" valign="middle"><br><br><p id="cname">${authUser.nickname }</p></td>
										<td><input type="text" style="position:relative;height:100px;width:900px;left:0%" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." id="ccontent" name = "ccontent"></td>
									<td><br><br><input type="submit" class="btn-primary pull" id="cmtbtn"value="댓글 작성"></td>
								</tr>								
							</table>
						</form>
					</div>
				</div>	
				</c:when>
				<c:otherwise>
				<c:if test="${authUser.sect eq 'business' }">
				<div class="container">
					<div class="form-group">					
						<form method="post" action="/bfreeView/${article.fno }/${authUser.bno}" onsubmit="return check();">
							<table class="table table-striped" style="position: relative;width: 1040px;left: 80%;text-align: center; border: 1px solid #dddddd">
								<tr>
									<td style="border-bottom:none;" valign="middle"><br><br><p id="bsect">${authUser.sect }</p></td>
									<td style="border-bottom:none;" valign="middle"><br><br><p id="bname">${authUser.bname }</p></td>
										<td><input type="text" style="position:relative;height:100px;width:900px;left:0%" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." id="ccontent" name = "ccontent"></td>
									<td><br><br><input type="submit" class="btn-primary pull" id="bcmtbtn"value="댓글 작성"></td>
								</tr>								
							</table>
						</form>
					</div>
				</div>	
				</c:if>
				</c:otherwise>
				</c:choose>							
                <br><br>            
			<input type="hidden" name="fno" id="fno" value="${article.fno }">               						
            <div class="bt_wrap">            
                <a id="input4" href="/freeList" class="on">목록</a>
<<<<<<< HEAD
                <c:if test="${authUser.sect eq 'users'}">
	                <c:if test="${authUser.userno eq article.userno}">                 
	                   <a href="/modifyform/${article.fno }">수정</a>
	                   <input id="freeDelete"  onclick="freeRemove()" type="submit" value="삭제">
	                </c:if>
=======
               <c:if test="${ authUser.sect eq 'users' }">
                <c:if test="${authUser.userno eq article.userno}">                 
	                <a href="/modifyform/${article.fno }">수정</a>
	                <input id="freeDelete"  onclick="freeRemove()" type="submit" value="삭제">
                </c:if>
>>>>>>> 6b2999a99f65bb3b4773d9d16cfa4683c53f49c3
                </c:if>
            </div>
            <%--댓글 리스트 --%>
            <br><br>                    
            <div id="totallist" class="listtotal">
               	<c:forEach var="comment" items="${comment }">
                	<div style="width:1000px;height:50px;">
                	<div id="csectlist" name="csectlist" class="listcsect">${comment.csect }</div>
                	<div id="cnamelist" name="cnamelist" class="listcname">${comment.cname }</div>	
                	<div id="ccontentlist" name="ccontentlist" class="listccontent">${comment.ccontent }</div>
                	<div id="cdatelist" name="cdatelist" class="listcdate">${comment.regdate }</div>
                	<c:choose>
                	<c:when test="${authUser.sect eq 'users' }">                	
	                	<c:if test="${authUser.userno eq comment.userno }">
	                		<a href="/modifycmt/${comment.fno}/${comment.cno}"><button id="cmtmodify">수정</button></a>
	                		<input id="cmtdelete" class="deletecmt" onclick="cmtDelete(${comment.cno})" type="submit" value="삭제">	                		                
	                	</c:if>
                	</c:when>
                	<c:otherwise>
                		<c:if test="${authUser.sect eq 'business' }">
	                	<c:if test="${authUser.bno eq comment.bno }">
	                		<a href="/modifycmt/${comment.fno}/${comment.cno}"><button id="cmtmodify">수정</button></a>
	                		<input id="cmtdelete" class="deletecmt" onclick="BcmtDelete(${comment.cno})" type="submit" value="삭제">	                		                
	                	</c:if>
	                	</c:if>
                	</c:otherwise>
                	</c:choose>
                	</div>
                	<input type="hidden" name="cno" id="cno"  value="${comment.cno }">
               	</c:forEach>
            </div>
                                
            <%--댓글 수정창 --%>
            
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
   //댓글 삭제[개인]
   function cmtDelete(cmtcno) {
		var result = confirm("삭제하시겠습니까? 삭제 후 취소가 불가능합니다.");
		var cno = cmtcno;
		var fno =  $('#fno').val();		
		console.log("댓글 번호 : " + cno);
		console.log("댓글 번호 : " + fno);
		if(result) {
			$.ajax({
				type : "post",
				url : "/cmtDelete/"+cno,
				data : {cno:cno,
						fno:fno},
				success : function(data) {
					alert("삭제가 완료되었습니다.");
					location.href="/freeView/" + fno;
				},
				error : function(err) {
					console.log(err);
				}
			});
		}	
	}
   
 //댓글 삭제[사용자]
   function BcmtDelete(cmtcno) {
		var result = confirm("삭제하시겠습니까? 삭제 후 취소가 불가능합니다.");
		var cno = cmtcno;
		var fno =  $('#fno').val();		
		console.log("댓글 번호 : " + cno);
		console.log("댓글 번호 : " + fno);
		if(result) {
			$.ajax({
				type : "post",
				url : "/cmtDelete/"+cno,
				data : {cno:cno,
						fno:fno},
				success : function(data) {
					alert("삭제가 완료되었습니다.");
					location.href="/freeView/" + fno;
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