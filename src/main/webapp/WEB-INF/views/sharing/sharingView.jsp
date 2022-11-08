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
<script>
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
</script>
<title>무료나눔 상세</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sharing.css"/>" rel='stylesheet' />

</head>
<body>
<header>
	<c:import url='/WEB-INF/views/includes/header.jsp' />
</header>
	<div id="viewcontainer">
    <section class="content_main">
      <section id="content_left">
        <!-- Swiper -->
        <div class="swiper mySwiper">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src="upload/${ file.fileid}" alt="무료나눔 옷">
            </div>
            <div class="swiper-slide">Slide 3</div>
            <div class="swiper-slide">Slide 4</div>
            <div class="swiper-slide">Slide 5</div>
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
          <span>level icon</span>
          <span>${sharing.sname }</span>

          <span class="letterAndHeart"><img src="image/letter.png" alt="쪽지">
          </span>
          <span class="letterAndHeart"><img src="image/heart.png" alt="찜신청전"></span>
        </div>
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
        <div id=sdetail>
        	${sharing.scontent}
        	<c:forEach var="sfileids" items="${files }">
                <img src="/upload/${sfileids}" alt="무료나눔 옷">
        	</c:forEach>
        </div>
      </div>
      
    </section>
    </div>
<%-- <footer>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
</footer> --%>
</body>
</html>