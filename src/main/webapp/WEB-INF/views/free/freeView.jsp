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
    
	<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' /> 
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
            <c:if test="${authUser.sect eq 'business' }">                            
				<input type="hidden" name="bno" id="bno" value="${authUser.bno }">				
			</c:if>                
			<c:if test="${authUser.sect eq 'users' }">
				<input type="hidden" class="userno" name="userno" id="userno" value="${authUser.userno }">
				
			</c:if>
			<input type="hidden" name="cno" id="cno" value="${comment.cno }">
			<input type="hidden" name="fno" id="fno" value="${article.fno }">               						
            <div class="bt_wrap">            
                <a id="input4" href="/freeList" class="on">목록</a>
                <c:if test="${authUser.sect eq 'users'}">                
	                <c:if test="${authUser.userno eq article.userno}">	                                  
	                   <a href="/modifyform/${article.fno }">수정</a>
	                   <input id="freeDelete"  onclick="freeRemove()" type="submit" value="삭제">
	                </c:if>               
                </c:if>
                <c:if test="${authUser.sect eq 'business'}">                
	                <c:if test="${authUser.bno eq article.bno}">	                                  
	                   <a href="/modifyform/${article.fno }">수정</a>
	                   <input id="freeDelete"  onclick="freeRemove()" type="submit" value="삭제">
	                </c:if>               
                </c:if>
            </div>
            <%--댓글 리스트 --%>
            <br><br>                    
            <!--  댓글  -->
            <label class="blabel" for="content">댓글 등록</label>
            <c:if test="${authUser ne null }">                 
            	<c:choose>
                <c:when test="${authUser.sect eq 'users' }"> 	
				    <div class="container">				        
				        <form name="commentInsertForm" onsubmit="return check();">
				            <div class="input-group">
				               <input type="hidden" name="fno" id="fno" value="${article.fno }">  
				               <input type="text" class="form-control" id="ccontent" name="ccontent" placeholder="댓글을 작성해주세요.">
				               <span class="input-group-btn">
				                    <button id="ubtn" class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
				               </span>
				              </div>
				        </form>
				    </div>
			    </c:when>
			    <c:otherwise>
				    <div class="container">				        
				        <form name="commentInsertForm">
				            <div class="input-group">
				               <input type="hidden" name="fno" id="fno" value="${article.fno }">  
				               <input type="text" class="form-control" id="ccontent" name="ccontent" placeholder="댓글을 작성해주세요.">
				               <span class="input-group-btn">
				                    <button id="bbtn" class="btn btn-default" type="button" name="bcommentInsertBtn">등록</button>
				               </span>
				              </div>
				        </form>
				    </div>
			    </c:otherwise>
			    </c:choose>
		    </c:if>
		    <br><br>
		    <div class="container">
		        <div class="commentList"></div>
		    </div>
                                
            <%--댓글 수정창 --%>
            
   <script>   
   <%--댓글테스트--%>
   var fno = $('#fno').val();
   var auth = "${authUser.sect}";
   var userno = $('#userno').val();
   var bno = $('#bno').val();
   var cno = $('#cno').val();
   console.log("로그인한 유저 : " + auth);
   console.log("자유게시판 번호 : " + fno);
   console.log("사용자 로그인 한 번호 : " + userno);
   console.log("사업자 로그인 한 번호 : " + bno);
   console.log("댓글 번호 : " + cno);
 //리스트 미리 뿌려주기
   $(document).ready(function(){
	  commentList(); 
   });
   
   //사용자
   $('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    if($('input[name=ccontent]').val() == '' ){
	    	alert("댓글을 입력해 주시기 바랍니다.");
	    	return false;
	    }
	    commentInsert(insertData); //Insert 함수호출(아래)
	});
   
   //사업자
   $('[name=bcommentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    if($('input[name=ccontent]').val() == '' ){
	    	alert("댓글을 입력해 주시기 바랍니다.");
	    	return false;
	    }
	    bcommentInsert(insertData); //Insert 함수호출(아래)
	});
   
	   
   
	 //댓글 등록[사용자]
	 function commentInsert(insertData){
		 var userno = $('#userno').val();
		 console.log("댓글 등록");
		    $.ajax({
		        url : '/ufreeView/'+fno+'/'+userno,
		        type : 'post',
		        data : insertData,
		        success : function(data){		            
		            commentList(); //댓글 작성 후 댓글 목록 reload
					$('[name=ccontent]').val('');
		            
		        }
		    });
		}
	 
	 //댓글 등록 [사업자]
	 function bcommentInsert(insertData){
		 console.log("댓글 등록");
		    $.ajax({
		        url : '/bfreeView/'+fno+'/'+bno,
		        type : 'post',
		        data : insertData,
		        success : function(data){
		            
		                commentList(); //댓글 작성 후 댓글 목록 reload
		                $('[name=ccontent]').val('');
		            
		        }
		    });
		}
	 
	 //댓글 목록 
	 function commentList(){
		 console.log("댓글리스트");
	     $.ajax({
	         url : '/list/'+fno,
	         type : 'get',
	         data : {'fno':fno},
	         success : function(data){
	             var a =''; 
	             $.each(data, function(key, value){ 
	                 a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';

	                 if(value.csect =='users'){
	                	 a += '<div id="writer" class="commentInfo'+value.cno+'">'+'<a href="/mypage/umypage/'+value.userno +'/sell" >'+'[ 작성자 ] :'+ value.cname +'</a>';	 
	                 }else if(value.csect == 'business'){
	                	 if(bno == value.bno){
	                 		a += '<div id="writer" class="commentInfo'+value.cno+'">'+'<a href="/mypage/bmypage/'+value.bno +'/apply">'+'[ 작성자 ] :'+ value.cname +'</a>';
	                	 }else{
	                		 a += '<div id="writer" class="commentInfo'+value.cno+'">'+'<a href="/mypage/bmypage/'+value.bno +'/review">'+'[ 작성자 ] :'+ value.cname +'</a>';
	                	 }
	                 }
	                 if(auth != ''){
	                	 if(auth =='users' && userno == value.userno){
	                		 console.log("사용자 수정 삭제");
			                 a += '<a onclick="commentUpdate('+value.cno+',\''+value.ccontent+'\');"> 수정 </a>';
			                 a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
	                	 }else if(auth == 'business' && bno == value.bno){
	                		 console.log("사업자 수정 삭제");
	                		 a += '<a onclick="commentUpdate('+value.cno+',\''+value.ccontent+'\');"> 수정 </a>';
			                 a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
	                	 }
	                 }
	                 a += '';
	                 a += '';
	                 a += '<div class="commentContent'+value.cno+'"> <p id="contentss"> 내용 : '+value.ccontent +'</p>';
	                 a += '</div></div>';
	             });
	             
	             $(".commentList").html(a);
	         }
	     });
	 }
	 
	 
	//댓글 삭제 
	 function commentDelete(cno){
		console.log("삭제할 번호 : " + cno);
		var result = confirm("삭제하시겠습니까? 삭제 후 취소가 불가능합니다.");
		if(result){
		     $.ajax({
		         url : "/cmtDelete/"+cno + "/" + fno,
		         type : "post",
		         success : function(data){
		        	 alert("삭제가 완료되었습니다.");
		        	 commentList(fno);
		         }
		     });
		}
	 }
	
	
	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	 function commentUpdate(cno, ccontent){
	     var a ='';
	     
	     a += '<div class="input-group" style="position: relative;left: 82%; bottom: 63px;">';
	     a += '<input type="text" class="form-control" name="ccontent_'+cno+'" value="'+ccontent+'"/>';
	     a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
	     a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentList();">취소</button> </span>';
	     a += '</div>';
	     
	     $('.commentContent'+cno).html(a);
	     
	 }
	//댓글 수정
	 function commentUpdateProc(cno){
	     var updateContent = $('[name=ccontent_'+cno+']').val();
	     var result = confirm("수정하시겠습니까??");
	     console.log("수정할 cno : " + cno);
	     console.log("수정할 내용 : " + updateContent);
	     if(result){
		     $.ajax({
		         url : "/update/"+cno + "/" +fno,
		         type : "post",
		         data : {'ccontent' : updateContent, 'cno' : cno},
		         success : function(data){
		            
		             alert("수정이 완료되었습니다.");
		             commentList(fno);
		         }
		     });
	     }
	 }
	
   <%--댓글테스트--%>
   
   
 
   
 
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