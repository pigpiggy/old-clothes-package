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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script src="https://kit.fontawesome.com/5231ffc51c.js" crossorigin="anonymous"></script>
<title>무료나눔 상세</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sharing.css"/>" rel='stylesheet' />
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
	
	$("#heart_img").on("click", function() {
		var logincheck = "<c:out value='${logincheck}'/>";
		//let likeVal = document.getElementById('like_check').value;
		const likeImg = document.getElementById('heart_img');
		if(logincheck == "false") {
			alert("로그인 후 이용해주세요.")
			location.href="/login";
		} else {
			likeImg.src = "/image/redheart.png";
		}
	})
		
	
		
	
	
	
    let likeVal = document.getElementById('like_check').value
    const boardId = $("#boardId").val();
    const memberId = $("#memberId").val();
    console.log(memberId);
    console.log(likeVal);
    const likeImg = document.getElementById("likeImg")

    if (likeVal > 0) {
        likeImg.src = "/assets/img/like_click.png";
    } else {
        likeImg.src = "/assets/img/like_empty.png";
    }
    // 좋아요 버튼을 클릭 시 실행되는 코드
    $("#likeImg").on("click", function () {
        $.ajax({
            url: '/board/like',
            type: 'POST',
            data: {'boardId': boardId, 'memberId': memberId},
            success: function (data) {
                if (data == 1) {
                    $("#likeImg").attr("src", "/assets/img/like_click.png");
                    location.href="/board/"+boardId;

                } else {
                    $("#likeImg").attr("src", "/assets/img/like_empty.png");
                    location.href="/board/"+boardId;
                }
            }, error: function () {
                $("#likeImg").attr("src", "/assets/img/like_click.png");
                console.log('오타 찾으세요')
            }

        });

    });
	
});
</script>
</head>
<body>
<<<<<<< HEAD
<header>
	<c:import url='/WEB-INF/views/includes/header.jsp' />
</header>
	<div id="viewcontainer">
    <section class="content_main">
      <section id="content_left">
        <!-- Swiper -->
        <div class="swiper mySwiper">
          <div class="swiper-wrapper">
			<c:forEach var="sfileids" items="${files }">
            	<div class="swiper-slide">
                	<img src="/upload/${sfileids}" alt="무료나눔 옷">
        		</div>
        	</c:forEach>            
          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
          <div class="swiper-pagination"></div>
        </div>
      </section>
      <section id="content_right">
        <h4>${sharing.stitle}</h4>
        <input type="hidden" name="sno" data-sno=${sharing.sno }>
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
        		<c:if test="${authUser.userno ne sharing.userno }">
	          		<div class="letterAndHeart">	
		          		<img src="/image/letter.png" id="letter_img" alt="쪽지">
	        				<a href='javascript: like_func();'>
		          				<img src="/image/heart.png" id="heart_img" alt="찜신청전">
	        				</a>
        			</div>
        		</c:if>
         	</c:otherwise>
		</c:choose>
        </div>
		        <div id="sreview">거래후기: 12건</div>
		        <div id="sbtn">
		        	<input type="button" class="btn btn-info" value="옷장열기" />
		        	<input type="button" class="btn btn-warning" value="구매신청" />
        		</div>
        <div>현재 신청 인원 : 3명</div>
        <!-- Swiper JS -->
      </section>
      <div class="scontent">
        <h3>상품정보</h3>
        <div id=sdetail>${sharing.scontent}</div>
      </div>
      
    </section>
    </div>
<%-- <footer>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
</footer> --%>
=======
<div id="wrap">
	<header>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</header>
		<div id="viewcontainer">
	    <section class="content_main">
	      <section id="content_left">
	        <!-- Swiper -->
	        <div class="swiper mySwiper">
	          <div class="swiper-wrapper">
				<c:forEach var="sfileids" items="${files }">
	            	<div class="swiper-slide">
	                	<img src="/upload/${sfileids}" alt="무료나눔 옷">
	        		</div>
	        	</c:forEach>            
	          </div>
	          <div class="swiper-button-next"></div>
	          <div class="swiper-button-prev"></div>
	          <div class="swiper-pagination"></div>
	        </div>
	      </section>
	      <section id="content_right">
	        <h4>${sharing.stitle}</h4>
	        <input type="hidden" name="sno" data-sno=${sharing.sno }>
	        <div id="sharingname">
	          <span>${sharing.sname }</span>
	        </div>
	        <c:choose>
	        	<c:when test="${empty authUser }">
		          	<a href='javascript: login_need();'>
		          		<img src="/image/letter.png" id="letter_img" alt="쪽지">
		          		<img src="/image/heart.png" id="heart_img" alt="찜신청전">
		          	</a>
	        	</c:when>
	        	<c:otherwise>
	        		<c:if test="${authUser.userno ne sharing.userno }">
		          		<img src="/image/letter.png" alt="쪽지">
	        				<a href='javascript: like_func();'>
		          				<img src="/image/heart.png" id="heart_img" alt="찜신청전">
	        				</a>
	        		</c:if>
	         	</c:otherwise>
			</c:choose>
			        <div id="sreview">거래후기: 12건</div>
			        <div id="sbtn">
			        	<input type="button" value="옷장열기" />
			        	<input type="button" value="구매신청" />
	        		</div>
	        <div>현재 신청 인원 : 3명</div>
	        <!-- Swiper JS -->
	      </section>
	      <div class="scontent">
	        <h3>상품정보</h3>
	        <div id=sdetail>${sharing.scontent}</div>
	      </div>
	      
	    </section>
	    </div>
		<footer>
				<c:import url='/WEB-INF/views/includes/footer.jsp' />
		</footer> 
	</div>
>>>>>>> ed3c84a63e3720196d8cb767e8c24fa04d44f07e

</body>
</html>