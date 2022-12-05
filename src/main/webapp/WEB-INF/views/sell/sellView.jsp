<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<!-- Link Swiper's CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script src="https://kit.fontawesome.com/5231ffc51c.js" crossorigin="anonymous"></script>
<title>개인판매 상세</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/individual.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/modal.css"/>" rel='stylesheet' />
<script>
function check(){
	var comment = document.getElementById("ccontent");
	if(comment.value == ''){
		alert("댓글을 작성해주시기 바랍니다.");
		return false;
	}
}
</script>
</head>
<body>
<header>
	<c:import url='/WEB-INF/views/includes/header.jsp' />
</header>
	<div id="viewcontainer">
		<div id="demo-modal" class="firstmodal">
      		<div class="modal__content">
      			<form action="imessage" method="post" id="messageform">
      				<input type="hidden" name="recvUserno" value="${uservo.userno }">
      				<input type="hidden" name="ino" value="${sell.ino }">
      				<h5>받는 사람: ${uservo.nickname }</h5> 
	      			<div>
		      			<label class="mcontext" for="mtitle">제목 </label>
		      			<input type="text" class="form-control" name="mtitle" id="mtitle" /><br>
	      			</div>
	      			<div>
		      			<label class="mcontext" for="mcontent">내용 </label>
		      			<textarea class="form-control" rows="3" cols="50" name="mcontent" id="mcontent"> </textarea><br>
	      			</div>
	      			<input type="submit" class="btn btn-warning center" value="보내기" />
	      			
      			</form>
      			
      			
				<a href="#" class="modal__close">&times;</a>
      		</div>
  		</div>
    <section class="content_main">
      <section id="content_left">
        <!-- Swiper -->
        <div class="swiper mySwiper">
          <div class="swiper-wrapper">
          	<c:choose>
          		<c:when test="${!empty files }">
					<c:forEach var="ifileids" items="${files }">
		            	<div class="swiper-slide">
		                	<img src="/upload/${ifileids}" alt="개인판매 옷">
		        		</div>
        			</c:forEach>    
        		 </c:when>
				<c:otherwise>
					<div class="swiper-slide">
						<img src="/image/logo3.png" alt="하우헌옷"/>
					</div>
				</c:otherwise>        	
        	</c:choose>          
          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-pagination"></div>
        </div>
      </section>
      <section id="content_right">
        <h4>${sell.ititle}</h4>
        <input type="hidden" name="ino" id="ino" value="${sell.ino }">
        <div class="letterAndHeart" id="sellname">
          <span>${sell.iname}</span>
	        <c:choose>
	        	<c:when test="${empty authUser }">
	        		<div class="letterAndHeart">	
		          		<img src="/image/letter.png" id="letter_img" alt="쪽지">
		          		<img src="/image/heart.png" id="heart_img" alt="찜신청전">
	        		</div>
	        	</c:when>
	        	<c:otherwise>
	        		<c:choose>
	        			<c:when test="${authUser.sect eq 'users' }">
			        		<c:if test="${authUser.userno ne sell.userno }">
				          		<div class="letterAndHeart">	
					          		<a href="#demo-modal">
					          			<img src="/image/letter.png" id="letter_img" alt="쪽지">
					          		</a>
					          			<c:choose>
					          				<c:when test="${likes eq 1}">
					          					<img src="/image/redheart.png" id="heart_img" alt="찜신청후">
					          				</c:when>
					          				<c:otherwise>
					          					<img src="/image/heart.png" id="heart_img" alt="찜신청전">
			        						</c:otherwise>
			        					</c:choose>
			        			</div>
			        		</c:if>
	        			</c:when>
		        		<c:otherwise>
		        			<div class="letterAndHeart">	
				          		<a href="#demo-modal">
				          			<img src="/image/letter.png" id="letter_img" alt="쪽지">
				          		</a>
		       					<c:if test="${authUser.sect eq 'users' and authUser.userno ne sell.userno}">
		          					<img src="/image/redheart.png" id="heart_img" alt="찜신청후">
		          					<img src="/image/heart.png" id="heart_img" alt="찜신청전">
			          			</c:if>		
				        	</div>
		         		</c:otherwise>
	         		</c:choose>
	         	</c:otherwise>
			</c:choose>
        </div>
		        <div id="ireview">거래 후기: 12건</div>
		      	<span>신청 인원 : ${sell.applycount }명</span>
		        <div id="sbtn">
					<c:choose>
						<c:when test="${empty authUser }">		        
				        	<a href="/mypage/umypage/${sell.userno}"><input type="button" class="btn btn-info" value="옷장열기" /></a>
				        	<input type="button" id="wapply" class="btn btn-warning" value="구매신청" />
				        </c:when>
				        <c:otherwise>
					        <c:choose>
								<c:when test="${authUser.sect eq 'users' }">
			        				<c:if test="${authUser.userno ne sell.userno }">	
			        					<a href="/mypage/umypage/${sell.userno}"><input type="button" class="btn btn-info" value="옷장열기" /></a>
			        					<input type="button" id="wapply" class="btn btn-warning" value="구매신청" />
										<div class="buy_chat">
										<form id="chatSubmit_form" action="/chatMessage" method="GET">
											<a href="javascript:{}" onclick="chatSubmit()">
												<input type="hidden" name="sellerName" value="${sell.iname}"/>
												<input type="hidden" name="ino" value="${sell.ino}"/>
												<input type="hidden" name="sellerno" value="${sell.userno}"/>
												<input type="hidden" name="ititle" value="${sell.ititle}"/>
												<button id="btn_chat">
													채팅으로 거래하기
												</button>
											</a>
										</form>
										</div>			        			
			        				</c:if>
			        				<c:if test="${authUser.userno eq sell.userno }">
			        					<input type="button" class="btn btn-info" value="나의옷장" />
			        					<input type="button" class="btn btn-info" value="구매 신청 목록" />
			        					<ul>
											<c:forEach var="users" items="${users }">
												<li>${users.ninkname }</li>
												<li>${users.joindate }</li>
											</c:forEach>			        					
			        					</ul>
			        				</c:if>
			        			</c:when>
			        			<c:otherwise>
			        				<a href="/mypage/umypage/${sell.userno}"><input type="button" class="btn btn-info" value="옷장열기" /></a>
			        			</c:otherwise>
			        		</c:choose>	
		        		</c:otherwise>
		        	</c:choose>						        	
        		</div>
        <!-- Swiper JS -->
      </section>
      <div class="icontent">
        <div id="modifydelete">
        	<h3>상품정보</h3>
        	<c:if test="${authUser.sect eq 'users'}">
	        	<c:if test="${authUser.userno eq sell.userno}">    
		        	<div
		        	
		        	 id="modifydelete">
						<a href="/sellModifyForm?ino=${sell.ino }">	        	
	    	    			<i class="fa-solid fa-gear fa-lg"></i>
	    	    		</a>
						<a href="javascript:void(0);" onclick="removeSell();">	        	
	        				<span class="fa-solid fa-trash-can fa-lg"></span>
	        			</a>
	        		</div>
	        	</c:if>
	        </c:if>		 
        </div>
        <div id=idetail>${sell.icontent} </div>
      </div>
      
    </section>
    </div>
    <%--개인판매 댓글 --%>
    <br><br>
    <c:choose>
    <c:when test="${authUser.sect eq 'users' }">
    <div class="container">
		<div class="form-group">
			<form method="post" action="/sellView/${sell.ino }/${authUser.userno}" onsubmit="return check();">
				<table class="individualtable">
					<tr>
						<td style="border-bottom:none;" valign="middle"><br><br><p id="cname" name="cname">${authUser.nickname }</p></td>
							<td><input type="text" style="position:relative;height:100px;width:900px;left:0%" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." id="ccontent" name = "ccontent"></td>
						<td><br><br><input type="submit" class="btn-primary pull" id="cmtbtn"value="댓글 작성"></td>
					</tr>								
				</table>
			</form>
		</div>
	</div>
	</c:when>
	<c:otherwise>
		<h3 style="position: relative;left: 30%; top: 59%;width: 722px;">댓글 작성은 개인로그인 및 로그인 후 사용이 가능합니다.</h3>
	</c:otherwise>
	</c:choose>           	
    <br><br>
     <%--댓글 리스트 --%>
    <br><br>            
    <div id="totalsell" class="selltotal">
       	<c:forEach var="comment" items="${commentsell }">
        	<div style="width:1000px;height:50px;">
        	<div id="inamelist" name="inamelist" class="listiname">${comment.cname }</div>	
        	<div id="icontentlist" name="icontentlist" class="listicontent">${comment.ccontent }</div>
        	<div id="idatelist" name="idatelist" class="listidate">${comment.regdate }</div>
        	<c:if test="${authUser.sect eq 'users' }">
        	<c:if test="${authUser.userno eq comment.userno }">
        		<a href="/modifysellcmt/${comment.ino}/${comment.cno}"><button id="icmtmodify">수정</button></a>
        		<input id="icmtdelete" class="deleteicmt" onclick="removesellcmt(${comment.cno})" type="submit" value="삭제">	                		                
        	</c:if>
        	</c:if>
        	</div>
        	<input type="hidden" name="cno" id="cno"  value="${comment.cno }">
       	</c:forEach>
    </div>    
<%-- <footer>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
</footer> --%>
<script>
/* 이미지 슬라이드 */
$(function() {	
	 var swiper = new Swiper(".mySwiper", {
	        cssMode: true,
	        navigation: {
	          nextEl: ".swiper-button-next",
	          prevEl: ".swiper-button-prev",
	        },
	        pagination: {
	          el: ".swiper-pagination",
	        },
	        mousewheel: true,
	        keyboard: true,
	      }); 
});

/* 찜 기능 */

$(function () {
	//로그인 확인
	$("#letter_img").on("click", function() {
		var logincheck = "<c:out value='${logincheck}'/>";
		if(logincheck == "false") {
			alert("로그인 후 이용해주세요.");
			location.href="/login";
		}
	})	
	$("#heart_img").on("click", function(e) {
		var logincheck = "${logincheck}";
		const ino =  $('#ino').val();
		if(logincheck == "false") {
			alert("로그인 후 이용해주세요.")
			location.href="/login";
		} else {
			console.log(ino);
		}
		let sect = "${sect}";
		console.log(sect);
		if(sect == 'users') {
			$.ajax({
				type: "post",
				url: "/sellView/likes",
				data: {ino:ino},
				success: function(data) {
					console.log(data);
					if(data == 1) {
						$("#heart_img").attr("src", "/image/redheart.png");
					} else {
	                    $("#heart_img").attr("src", "/image/heart.png");
					}
				}, error: function() {
                    console.log('바보야!')
				}
			})
		}
	})

});

/* 삭제 처리 */
function removeSell() {
	var result = confirm("삭제하시겠습니까? 삭제 후 취소가 불가능합니다.");
	var ino =  $('#ino').val();
	if(result) {
		$.ajax({
			type : "post",
			url : "/sellDelete",
			data : {ino:ino},
			success : function(data) {
				alert("삭제가 완료되었습니다.");
				location.href="/sellList";
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
	
}


/* 댓글 삭제 처리 */
function removesellcmt(cmtcno) {
	var result = confirm("삭제하시겠습니까? 삭제 후 취소가 불가능합니다.");
	var ino =  $('#ino').val();
	var cno =  cmtcno;
	if(result) {
		$.ajax({
			type : "post",
			url : "/sellcmtDelete/"+cno,
			data : {ino:ino,
					cno:cno},
			success : function(data) {
				alert("삭제가 완료되었습니다.");
				location.href="/sellView/" + ino;
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
	
}

/* 쪽지 확인 */
var submitcheck = "<c:out value='${submitcheck}'/>";
if(submitcheck == "true"){
	alert("메시지가 성공적으로 발송되었습니다.");
} else if(submitcheck =="false"){
	alert("메시지 발송에 실패하였습니다.");
} else{
}

/* 신청하기 */
$("#wapply").on("click", function() {
	var logincheck = "<c:out value='${logincheck}'/>";
	const ino =  $('#ino').val();
	sect = "${authUser.sect}";
	console.log(sect);
	if(logincheck == "false") {
		alert("로그인 후 이용해주세요.");
		location.href="/login";
	} else if(sect == 'users'){
		console.log(ino);
		$.ajax({
			type: "post",
			url: "/sellView/wapply",
			data: {ino:ino},
			success: function(data) {
				console.log(data);
				alert("신청이 완료되었습니다.");
			}, error: function() {
                console.log('바보야!')
			}
		})
	}
		
})
<<<<<<< HEAD
//댓글 등록 = 사용자
   $('#cmtbtn').click(function(){
		console.log("댓글 등록");
		var comment = document.getElementById("ccontent");
		if(comment.value != ''){
			alert("댓글 등록이 완료되었습니다.");	
		}
	});
=======

function chatSubmit() {
	document.getElementById('chatSubmit_form').submit();
} 
>>>>>>> 06af56a7f831f14dc696c001e47a16c3aaaf836c

</script>

</body>
</html>