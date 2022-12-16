<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자신청목록</title>
<link href="<c:url value="/resources/css/bmypage.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/modal.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/reviewmodal.css"/>" rel='stylesheet' />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />
<style>
.item{	
	width:100%;
}
#ucards{
	display: flex;    
    flex-wrap: wrap;
    justify-content: center;
}
.aindividualStatus {
    position: absolute;
    left: 51%;
    top: 27%;
    transform: translate(-50%, -50%);
    background: black;
    opacity: 0.4;
    color: white;
    width: 51%;
    text-align: center;
    font-size: 30px;
    line-height: 2;
    border-radius: 2px;
}
.applyList{
	position: relative;
    display: block;
}

</style>
</head>
<body>	
	<c:import url='/WEB-INF/views/mypage/usermypage.jsp' />
	<c:if test="${authUser.sect eq 'users' }">
		<c:if test="${authUser.userno eq users.userno }">
	<div class="my_Tab">
			<ul class="tabs">
				<li><a href ="/mypage/umypage/${users.userno }/sell">판매 상품</a></li>
				<li><a href ="/mypage/umypage/${users.userno }/buy">구매 상품</a></li>
				<li class="on"><a href ="/mypage/umypage/${users.userno }/apply">신청 목록</a></li>
				<li><a href ="/mypage/umypage/${users.userno }/review">거래 후기</a></li>
			</ul>
	</div>
	</c:if>
	</c:if>
	 <c:if test="${authUser.sect eq 'users' }">
	<div id="total" style="width:1000px; margin:0 auto; margin-bottom: 25%;">
	<div id="ucards">
	<c:forEach var="wapply" items="${wapply }">
	<input type="hidden" id="bno" name="bno" value="${wapply.bno }" data-sno="${wapply.bno }">
	<c:if test="${authUser.userno eq wapply.userno }">	  
		<div class="applyList">
			<c:choose>	        
				<c:when test="${'신청중' != wapply.astatus}">
	          			<div class="aindividualStatus">${wapply.astatus }</div>
	          	</c:when>
	          	<c:when test="${wapply.astatus == '신청중'}">
	          			<div class="aindividualStatus">신청중</div>
	          	</c:when>
			</c:choose>	          	
	            <div class="item" style="width:100%;">		            
	            <strong>[ ${wapply.bname } ]</strong>		
	            	<div class="title"></div>                                 		                
	                <div class="allapply" style="padding: 2%;">		                
	                    <div class="cont">	
	                    	<input type="hidden" class="bnoContent" name="bnoContent" value="${wapply.bno }" data-sno="${wapply.bno }">
	                    	<input type="hidden" class="anoContent" name="anoContent" value="${wapply.ano }" data-sno="${wapply.ano }">                    	
	                        <div class="aname"><p>${wapply.aname }</p></div>
	                        <div class="aphone"><p>${wapply.aphone }</p></div>                        
	                        <div class="aadress"><p>${wapply.aaddress }</p></div>
	                        <div class="apickup"><p>${wapply.apickup }</p></div>                                          
	                        <div class="wei">
	                            <div class="weight"><p>${wapply.weight }</p></div>                        
	                        	<p>kg</p>
	                        </div>		                    
	                     </div>
	                  
	                    
	                    <c:choose>                     
	                    <c:when test="${wapply.astatus eq '신청중' }">
		                     <div class="btn">
		                        <input type="hidden" id="userno" name="userno" value="${wapply.userno }">             	                    			                    		                      
	                   			<input type="hidden" id="ano" name="ano" value="${wapply.ano }">										
		                        <button type="button" id="apply_close_btn" name="cancel" data-abtn2="${wapply.userno }" data-abtn3="${wapply.ano }">신청취소</button>
		                    </div>
	                    </c:when>
	                    <c:when test="${wapply.astatus eq '신청완료' }">
		                    <div class="btn">	                        
		                      <!-- 버튼 사라짐 -->
		                    </div>                   
	                    </c:when>	                    
		                    
	                    </c:choose>
	                    <c:choose> 
	                    <c:when test="${wapply.astatus eq '수거완료' }">
			                    <div class="btn">	                        
			                        <button type="submit" form="form" id="applying" class="complete">수거완료</button>
			                    </div>                   
		                 </c:when>
		                 <c:otherwise>
		                 	<c:if test="${wapply.astatus eq '신청거절' }">
								<!-- 버튼 안 나옴 거절 당했을 시 -->
							</c:if>
		                 </c:otherwise>	
		                 </c:choose> 
		                 <c:if test="${wapply.astatus eq '후기작성예쩡' }">
			                  <button type="button" class="applying1">후기작성</button>
		                 </c:if>	                 
	                 </div>		               	            
	        	</div>		        
	    	</div>
	    	<div id="modal" class="modal">
   				<div class="modal_content">
   				
   				
   					<div class="modal_layer"></div>
   				</div>
   			</div>
	    		
	    </c:if> 
	</c:forEach>	 
	</div>
</div>

</c:if>


	<div id="demo-modal2" class="firstmodal">
      		<div class="modal__content7" id="modal__content7">
      		<strong>[ 거래후기 ]</strong>
      				<div class="stars7">
	      				<button class="star">1</button>
	      				<button class="star">2</button>
	      				<button class="star">3</button>
	      				<button class="star">4</button>
	      				<button class="star">5</button>	      				
	      			</div>
      				<textarea style= "height: 58%; width: 100%; resize:none;" name="content" class="content" placeholder="거래 후기를 입력해 주세요."></textarea>
      				<button id="uapplyReviewcomplete7">작성완료</button>	
				<a href="#" class="modal__close">&times;</a>
      		</div>
  	</div>
	
    

    <div class="center">
    <ul class="pagination apaging">
		<c:choose>
			<c:when test="${apageInfo.page<=1}">
				<li><a id="prev"><<</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/mypage/umypage/${users.userno }/apply?apage=${apageInfo.page-1}&select=1" id="prev"><<</a></li>&nbsp;
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${apageInfo.startPage }" end="${apageInfo.endPage }">
			<c:choose>
				<c:when test="${apageInfo.page==i }"><li><a class="active">${i }</a></li></c:when>
				<c:otherwise>
					<li><a href="/mypage/umypage/${users.userno }/apply?apage=${i}&select=1">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${apageInfo.page>=apageInfo.maxPage }">
				<li><a id="next">>></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/mypage/umypage/${users.userno }/apply?apage=${apageInfo.page+1}&select=1" id="next">>></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
    </div>
    <div>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
	</div>
	<script>
	var bnoo = $('#bno').val();
	console.log("bnoo :" + bnoo);
	//모달 켜기
    
	
	var cano;
	var cuserno;
	//수거 거절
	$('[name=cancel]').click(function(e){ //수거승인 등록 버튼 클릭시 		 
		 var targetElement = e.target;		 
		 cuserno = targetElement.getAttribute("data-abtn2");
		 cano = targetElement.getAttribute("data-abtn3");		 
		 console.log("cuserno : " + cuserno);
		 console.log("cano : " + cano);
	     wapplydelete(); //삭제함수 호출
	});
  	
	
	function wapplydelete(){		
		 console.log("신청 취소");		 
		    $.ajax({
		        url : '/wapplydelete/'+cano+'/'+cuserno,
		        type : 'get',		        
		        success : function(data){		            		            
					alert(data);				
					location.reload();
		        },
		        error :function(){
		        	alert("수거 거절 오류");
		        }
		    });
		}
	var bno;
	var uapplyIndex;
	$('#applying').click(function(){
		$('.firstmodal').css('visibility','visible');
		$('.firstmodal').css('opacity','1');
		$('.firstmodal').css('z-index','2');
		console.log($(this).parent().parent().parent().parent());
		uapplyIndex = $('.applyList').index($(this).parent().parent().parent().parent());
		console.log(uapplyIndex);
		var ano = $('.anoContent:eq('+uapplyIndex+')').attr("data-sno");
		$('.modal__close').click(function(){
			$.ajax({
				type : "get",
				url : "/uapplyReviewStatus",
				data : {ano:ano},
				success : function(data) {
					console.log(data);
					location.reload();
				},
				error : function(err) {
					console.log(err);
				}
			});
		})
	})
	
	$('.applying1').click(function(){
		$('.firstmodal').css('visibility','visible');
		$('.firstmodal').css('opacity','1');
		$('.firstmodal').css('z-index','2');
		console.log($(this).parent().parent().parent().attr('class'));
		uapplyIndex = $('.applyList').index($(this).parent().parent().parent());
		console.log("uaaply:"+uapplyIndex);
		var ano = $('.anoContent:eq('+uapplyIndex+')').attr("data-sno");
	})
	
	$('.modal__close').click(function(e){
		e.preventDefault();
		$('.firstmodal').css('visibility','hidden');
		$('.firstmodal').css('opacity','0');
		$('.firstmodal').css('z-index','0');
	})
	
	var star = 0;
		$(".star").mouseover(function(){
			for(var j=0;j<=4;j++){
				document.getElementsByClassName('star')[j].classList.remove('yellow');
			}
			var starindex = $(".star").index(this);
			for(var j=0;j<=starindex;j++){
				document.getElementsByClassName('star')[j].classList.add('yellow');
			}
			star = starindex + 1;
		})
		
	$("#uapplyReviewcomplete7").click(function(){
			console.log($('.bno:eq('+uapplyIndex+')'));
			bno = $('.bnoContent:eq('+uapplyIndex+')').attr("data-sno");
			var ano = $('.anoContent:eq('+uapplyIndex+')').attr("data-sno");
			var content = $('.content').val();
			$.ajax({
				type : "get",
				url : "/sendUapplyReview",
				data : {star:star,
						content:content,
						bno:bno,
						ano:ano},
				success : function(data) {
					console.log(data);
					location.reload();
				},
				error : function(err) {
					console.log(err);
				}
			});
		})
	
	</script>
<script src="<c:url value='/resources/js/free/paging.js'/>"></script>	
</body>
</html>