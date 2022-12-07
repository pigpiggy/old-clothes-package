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
	        		<div class="letterAndHeart" id="icons">
	        			<img src="/image/chaticon.png" id="chaticon_img" alt="채팅" title="판매자와 채팅하기">
		          		<img src="/image/letter.png" id="letter_img" alt="쪽지" title="쪽지 보내기">
		          		<img src="/image/heart.png" id="heart_img" alt="찜신청전" title="찜하기" >
	        		</div>
	        	</c:when>
	        	<c:otherwise>
	        		<c:choose>
	        			<c:when test="${authUser.sect eq 'users' }">
			        		<c:if test="${authUser.userno ne sell.userno }">
				          		<div class="letterAndHeart" id="icons">
										<div class="buy_chat">
											<form id="chatSubmit_form" action="/chatMessage" method="GET">
												<a href="javascript:{}" onclick="chatSubmit()">
													<input type="hidden" name="sellerName" value="${sell.iname}"/>
													<input type="hidden" name="ino" value="${sell.ino}"/>
													<input type="hidden" name="sellerno" value="${sell.userno}"/>
													<input type="hidden" name="ititle" value="${sell.ititle}"/>
													<button id="btn_chat">
					          							<img src="/image/chaticon.png" id="chaticon_img" alt="채팅" title="판매자와 채팅하기">
													</button>
												</a>
											</form>
										</div>				          		
					          		<a href="#demo-modal">
					          			<img src="/image/letter.png" id="letter_img" alt="쪽지" title="쪽지 보내기">
					          		</a>
					          			<c:choose>
					          				<c:when test="${likes eq 1}">
					          					<img src="/image/redheart.png" id="heart_img" alt="찜신청후" title="찜하기" >
					          				</c:when>
					          				<c:otherwise>
					          					<img src="/image/heart.png" id="heart_img" alt="찜신청전" title="찜하기" >
			        						</c:otherwise>
			        					</c:choose>
			        			</div>
			        		</c:if>
	        			</c:when>
		        		<c:otherwise>
		        			<div class="letterAndHeart" id="icons">
				          		<a href="#demo-modal">
				          			<img src="/image/letter.png" id="letter_img" alt="쪽지" title="쪽지 보내기">
				          		</a>
		       					<c:if test="${authUser.sect eq 'users' and authUser.userno ne sell.userno}">
		          					<img src="/image/redheart.png" id="heart_img" alt="찜신청후" title="찜하기" >
		          					<img src="/image/heart.png" id="heart_img" alt="찜신청전" title="찜하기" >
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
			        			
			        				</c:if>
			        				<c:if test="${authUser.userno eq sell.userno }">
			        					<a href="/mypage/umypage/${authUser.userno}"><input type="button" class="btn btn-info" value="나의옷장" /></a>
			        					<input type="button" class="btn btn-info" value="구매 신청 목록" />
			        					<form action="/selectSellApply" method="get">
				        					<ul>
												<c:forEach var="users" items="${users }">
													<li>${users.nickname }<input type="radio" name="list" value="${users.userno}"/><input type="hidden" name="userno" value="${users.userno}"/></li>
													<li>${users.joinDate }</li>
												</c:forEach>			        					
				        					</ul>
				        					<input type="hidden" name="ino" value="${sell.ino }">
				        					<input type="submit" value="확인"/>
			        					</form>
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
   <br><br>                    
	<!--  댓글  -->
	<label for="content" style="position:relative; top:63%; left:33%; ">Comment</label>
    <br><br>
    <input type="hidden" name="cno" id="cno" value="${comment.cno }">
    <c:if test="${authUser.sect eq 'users' }">
				<input type="hidden" class="userno" name="userno" id="userno" value="${authUser.userno }">
	</c:if>
	<c:choose>
		<c:when test="${authUser.sect eq 'users' }">
		     <div class="container" style="top: 60%;position: relative;">				        
		        <form name="commentInsertForm">
		            <div class="input-group">
		               <input type="hidden" name="sno" id="sno" value="${sharing.sno }">  
		               <input type="text" class="form-control" id="ccontent" name="ccontent" placeholder="댓글을 작성해주세요.">
		               <span class="input-group-btn">
		                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
		               </span>
		              </div>
		        </form>
		    </div>
    	</c:when>
	    <c:otherwise>
	    	<div class="container" style="top: 60%;position: relative;">
	    		<form name="commentInsertForm">
	            	<div class="input-group">                
	               		<input type="text" class="form-control" id="ccontent" name="ccontent" placeholder="로그인 및 사용자로그인 후 가능합니다." readonly>              
	            	</div>
	        	</form>
	        </div>
	    </c:otherwise>
    </c:choose>
    <br><br> 
    <div class="container" style="position: relative;top: 63%;">
        <div class="commentList"></div>
    </div>
<%-- <footer>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
</footer> --%>
<script>
//댓글 
var auth = "${authUser.sect}";
var userno = $('#userno').val();
var ino = $('#ino').val();
var cno = $('#cno').val();
console.log("댓글 번호 : " + cno);
console.log("무료나눔 번호 : " + ino);
console.log("로그인한 유저 : " + auth);
console.log("사용자 로그인 한 번호 : " + userno);

//리스트 뿌려주기 
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

//댓글 등록[사용자]
function commentInsert(insertData){
	 var userno = $('#userno').val();
	 console.log("댓글 등록");
	    $.ajax({
	        url : '/sellView/'+ino+'/'+userno,
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
        url : '/Ilist/'+ino,
        type : 'get',
        data : {'ino':ino},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.cno+'">'+'[ 작성자 ] : '+value.cname;
                if(auth != ''){
                	if(auth == 'users'){
		                a += '<a onclick="commentUpdate('+value.cno+',\''+value.ccontent+'\');"> 수정 </a>';
		                a += '<a onclick="commentDelete('+value.cno+');"> 삭제 </a> </div>';
                	}
                }
                a += '<div class="commentContent'+value.cno+'"> <p> 내용 : '+value.ccontent +'</p>';
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
	         url : "/sellcmtDelete/"+cno + "/" + ino,
	         type : "post",
	         success : function(data){
	        	 alert("삭제가 완료되었습니다.");
	        	 commentList(ino);
	         }
	     });
	}
}

//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, ccontent){
    var a ='';
    
    a += '<div class="input-group">';
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
	         url : "/sellcmtModify/"+cno + "/" +ino,
	         type : "post",
	         data : {'ccontent' : updateContent, 'cno' : cno},
	         success : function(data){
	            
	             alert("수정이 완료되었습니다.");
	             commentList(ino);
	         }
	     });
    }
}



//
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
	$("#chaticon_img").on("click", function() {
		var logincheck = "<c:out value='${logincheck}'/>";
		if(logincheck == "false") {
			alert("로그인 후 이용해주세요.");
			location.href="/login";
		}
	})	
	$("#letter_img").on("click", function() {
		var logincheck = "<c:out value='${logincheck}'/>";
		if(logincheck == "false") {
			alert("로그인 후 이용해주세요.");
			location.href="/login";
		}
	})	
	$("#heart_img").on("click", function(e) {
		console.log('들어오니?');
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
				apply = data;
				console.log(data);
				console.log("apply:"+apply);
				if(apply == "true") {
					alert("신청이 완료되었습니다.");
					location.reload(true);
				} else {
					alert("신청할 수 없습니다.");
				}
			}, error: function() {
                console.log('바보야!')
			}
		})
	}
		
})

/* 채팅신청 */
function chatSubmit() {
	//새 창으로 채팅창 띄우기
	var w = window.open('', 'newPopup','scrollbars=yes, width=470, height=650');
	var chatSubmitForm = document.getElementById('chatSubmit_form');
	chatSubmitForm.target = 'newPopup';
	chatSubmitForm.submit();
} 

</script>

</body>
</html>