<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>무료나눔 상세</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sharing.css"/>" rel='stylesheet' />
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
      			<form action="smessage" method="post" id="messageform">
      				<input type="hidden" name="recvUserno" value="${uservo.userno }">
      				<input type="hidden" name="sno" value="${sharing.sno }">
      				
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
					<c:forEach var="sfileids" items="${files }">
		            	<div class="swiper-slide">
		                	<img src="/upload/${sfileids}" alt="무료나눔 옷">
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
        <h4>${sharing.stitle}</h4>
        <input type="hidden" name="sno" id="sno" value="${sharing.sno }">
        <div class="letterAndHeart" id="sharingname">
          <span>${sharing.sname }</span>
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
	        				<c:if test="${authUser.userno ne sharing.userno }">
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
			          			<c:if test="${authUser.sect eq 'users' and authUser.userno ne sharing.userno}">
		          					<img src="/image/redheart.png" id="heart_img" alt="찜신청후">
		          					<img src="/image/heart.png" id="heart_img" alt="찜신청전">
			          			</c:if>		
			        		</div>
	        			</c:otherwise>
	        			
	        		</c:choose>
	        		
	        		
	         	</c:otherwise>
			</c:choose>
        </div>
		        <div id="sreview">거래후기: 12건</div>
		        <span>신청 인원 : ${sharing.applycount }명</span>
		        <div id="sbtn">
					<c:choose>
						<c:when test="${empty authUser }">		        
				        	<a href="/mypage/umypage/${sharing.userno }"><input type="button" class="btn btn-info" value="옷장열기" /></a>
				        	<input type="button" id="wapply" class="btn btn-warning" value="구매신청" />
				        </c:when>
				        <c:otherwise>
					        <c:choose>
								<c:when test="${authUser.sect eq 'users' }">
			        				<c:if test="${authUser.userno ne sharing.userno }">	
			        					<a href="/mypage/umypage/${sharing.userno }"><input type="button" class="btn btn-info" value="옷장열기" /></a>
			        					<input type="button" id="wapply" class="btn btn-warning" value="구매신청" />
			        					<input type="button" id="chat" class="btn btn-warning" value="채팅" />
			        				</c:if>
			        				<c:if test="${authUser.userno eq sharing.userno }">
			        					<a href="/mypage/umypage/${authUser.userno}"><input type="button" class="btn btn-info" value="나의옷장" /></a>
			        				</c:if>
			        			</c:when>
			        			<c:otherwise>
			        				<a href="/mypage/umypage/${sharing.userno }"><input type="button" class="btn btn-info" value="옷장열기" /></a>
			        			</c:otherwise>
			        		</c:choose>	
		        		</c:otherwise>
		        	</c:choose>				
        		</div>
        <!-- Swiper JS -->
      </section>
      <div class="scontent">
        <div id="modifydelete">
        	<h3>상품정보</h3>
        	<c:if test="${authUser.sect eq 'users'}">
	        	<c:if test="${authUser.userno eq sharing.userno}">    
		        	<div id="modifydelete">
						<a href="/sharingModifyForm?sno=${sharing.sno }">	        	
	    	    			<i class="fa-solid fa-gear fa-lg"></i>
	    	    		</a>
						<a href="javascript:void(0);" onclick="removeSharing();">	        	
	        				<span class="fa-solid fa-trash-can fa-lg"></span>
	        			</a>
	        		</div>
	        	</c:if>	
	        </c:if>	
        </div>
        <div id=sdetail>${sharing.scontent}</div>
      </div>
      
    </section>
    </div>
    <%--무료나눔 댓글 --%>
    <br><br>
    <c:choose>
    <c:when test="${authUser.sect eq 'users' }">
    <div class="container">
		<div class="form-group">
			<form method="post" action="/sharingView/${sharing.sno }/${authUser.userno}" onsubmit="return check();">
				<table class="sharingtable">
					<tr>
						<td style="border-bottom:none;" valign="middle"><br><br><p id="cname" name="cname">${authUser.nickname }</p></td>
							<td><input type="text" style="position:relative;height:100px;width:900px;left:0%" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." id= "ccontent" name = "ccontent"></td>
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
            <div id="totalsharing" class="sharingtotal">
               	<c:forEach var="comment" items="${commentsharing }">
                	<div style="width:1000px;height:50px;">
                	<div id="snamelist" name="snamelist" class="listsname">${comment.cname }</div>	
                	<div id="scontentlist" name="scontentlist" class="listscontent">${comment.ccontent }</div>
                	<div id="sdatelist" name="sdatelist" class="listsdate">${comment.regdate }</div>
                	<c:if test="${authUser.sect eq 'users' }">
                	<c:if test="${authUser.userno eq comment.userno }">
                		<a href="/modifysharingcmt/${comment.sno}/${comment.cno}"><button id="scmtmodify">수정</button></a>
                		<input id="scmtdelete" class="deletescmt" onclick="removeSharingcmt(${comment.cno})" type="submit" value="삭제">	                		                
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
		const sno =  $('#sno').val();
		if(logincheck == "false") {
			alert("로그인 후 이용해주세요.")
			location.href="/login";
		} else {
			console.log(sno);
		}
		let sect = "${sect}";
		console.log(sect);
		if(sect == 'users') {
			alert(sect);
			$.ajax({
				type: "post",
				url: "/sharingView/likes",
				data: {sno:sno},
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
function removeSharing() {
	var result = confirm("삭제하시겠습니까? 삭제 후 취소가 불가능합니다.");
	var sno =  $('#sno').val();
	if(result) {
		$.ajax({
			type : "post",
			url : "/sharingDelete",
			data : {sno:sno},
			success : function(data) {
				alert("삭제가 완료되었습니다.");
				location.href="/sharingList";
			},
			error : function(err) {
				console.log(err);
			}
		});
	}
	
}

/* 댓글 삭제 처리 */
function removeSharingcmt(cmtcno) {
	var result = confirm("삭제하시겠습니까? 삭제 후 취소가 불가능합니다.");
	var sno =  $('#sno').val();
	var cno =  cmtcno;
	if(result) {
		$.ajax({
			type : "post",
			url : "/sharingcmtDelete/"+cno,
			data : {sno:sno,
					cno:cno},
			success : function(data) {
				alert("삭제가 완료되었습니다.");
				location.href="/sharingView/" + sno;
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
	const sno =  $('#sno').val();
	let sect = "${sect}";
	if(logincheck == "false") {
		alert("로그인 후 이용해주세요.");
		location.href="/login";
	} else if(sect == 'users'){
		console.log(sno);
		$.ajax({
			type: "post",
			url: "/sharingView/wapply",
			data: {sno:sno},
			success: function(data) {
				console.log(data);
			}, error: function() {
                console.log('바보야!')
			}
		})
	var registcheck = "${registcheck}";
	if(registcheck == "true") {
		alert("신청완");
	} else {
		console.log(registcheck);
		alert("신청안돼");
	}

	}		
})

//댓글 등록 = 사용자
   $('#cmtbtn').click(function(){
		console.log("댓글 등록");
		var comment = document.getElementById("ccontent");
		if(comment.value != ''){
			alert("댓글 등록이 완료되었습니다.");	
		}
	});
</script>
</body>
</html>