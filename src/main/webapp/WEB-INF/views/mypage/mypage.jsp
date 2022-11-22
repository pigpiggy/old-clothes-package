<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 옷장</title>
<link href="<c:url value="/resources/css/mypage.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link href="<c:url value="/resources/css/review.css"/>" rel='stylesheet' />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	
		$('.closet_wrap .my_Tab .tabs a').on('click',function(){ //탭 메뉴에 있는 링크를 클릭했을 때	
			var idx = $(this).parent().index(); //현재 클릭한 링크의 부모가 몇번째 인지 idx 변수에 넣는다.
			
			$(this).parent().siblings().removeClass('on'); //현재 클릭한 링크의 부모를 제외 한 나머지 li에 on클래스를 제거하고
			
			$(this).parent().addClass('on'); //현재 클릭한 링크의 부모 li에 on클래스를 넣는다.
			
			$(this).parent().parent().siblings('.tab_con').removeClass('on'); 
			//현재 클릭한 부모 li의 부모 ul을 제외한 나머지 클래스 .tab_con에 클래스 on을 지워준다
			
			$(this).parent().parent().siblings('.tab_con').eq(idx).addClass('on');
			//현재 클릭한 부모 li의 부모 ul을 제외한 나머지 클래스 .tab_con을 선택하고 그 중  eq번째에 클래스 on을 넣는다.
						
		});
		
});
</script>
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	<div class="closet_wrap" >  
    
    <div class="title">
      <div class="nicname">
        <img id="clostick1" src="/image/clostick.png" alt="옷걸이">
        <strong>알냥이의 옷장</strong>
        <img id="clostick2" src="/image/clostick.png" alt="옷걸이"> 
      </div>   
      <div class="fname_closet">          
		        <a href="#">
			      <img id="like" src="/image/redheart.png" alt="찜">
		        </a>          
		        <a href="/mypage/message">
			      <img id="letter" src="/image/letter.png" alt="쪽지">
		        </a>          
		        <a href="#">
              <img id="prosetting" src="/image/profilesetting.png" alt="프로필수정">
		        </a>
        </div>
      </div>        	    
  	

	<div class="self_Introduction">
		<div class="closetImage">
			<img src="/image/closet.png" alt="옷장">
    </div>
    <div class="second">
		  <div class= "myRecord">
			  <span>상품등록 : 25개</span>
			  <span>작성한 글 : 19건</span>
			  <span>거래완료 : 19건</span>
			  <span>받은 거래후기 : 12개</span>
		  </div>		
		  <div class="introduce">
			  <div>안녕하세요 알냥이의 옷장입니다. </div>
				<img id="setting" src="/image/setting1.png" alt="소개수정">
		  </div>
  </div>
	</div>
	
	<div class="my_Tab">
		<ul class="tabs">
			<li class="on"><a href ="#a">판매 상품</a></li>
			<li><a href ="#b">구매 상품</a></li>
			<li><a href ="#c">신청 목록</a></li>
			<li><a href ="#d">거래 후기</a></li>
		</ul>
		<div class="tab_con on">판매상품 목록 띄워주세요!</div>
		<div class="tab_con">구매상품 목록 띄워주세요!</div>
		<div class="tab_con">신청 목록 띄워주세요!</div>
		<div class="tab_con">
		<div class="card border-light mb-3" style="max-width: 18rem;">
        <div class="card-body">
            <div id="reviewStar">
                <h5 class="card-title">만족해요</h5>
                <span>★★★★☆</span>
            </div>
            <div class="reviewcontent" id="reviewTitle">
                <span class="card-text">글제목: </span> 
                <p>좋아요</p>
            </div>
            <div class="reviewcontent" id="reviewDealType">
                <span class="card-text">거래 유형: </span>
                <p> 직거래</p>
            </div>
            <p class="card-text">잘 입을게요~ 싸게 잘 샀네요 ㅎㅎㅎ</p>
        </div>
            <div class="card-header">
                <span>도라에몽</span>
                <span>2022-11-18</span>
            </div>
    </div>
		</div>
	</div>
  </div>
</body>
</html>