<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/mypage.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	<div class="closet_wrap">  
    <div class="title">
      <div class="nicname">
        <img id="clostick1" src="image/clostick.png" alt="옷걸이">
        <strong>알냥이의 옷장</strong>
        <img id="clostick2" src="image/clostick.png" alt="옷걸이"> 
      </div>   
      <div class="fname_closet">          
		        <a href="#">
			      <img id="like" src="image/redheart.png" alt="찜">
		        </a>          
		        <a href="/mypage/message">
			      <img id="letter" src="image/letter.png" alt="쪽지">
		        </a>          
		        <a href="#">
              <img id="prosetting" src="image/profilesetting.png" alt="프로필수정">
		        </a>
        </div>
      </div>        	    
  	

	<div class="self_Introduction">
		<div class="closetImage">
			<img src="image/closet.png" alt="옷장">
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
				<img id="setting" src="image/setting1.png" alt="소개수정">
		  </div>
  </div>
	</div>
	
	<nav class="my_Tab">
		<ul>
			<li><a href ="#card1">판매 상품</a></li>
			<li><a href ="#card2"class="on" >구매 상품</a></li>
			<li><a href ="#card3">신청 목록</a></li>
			<li><a href ="/mypage/review">거래 후기</a></li>
		</ul>
	</nav>
		
	<div class="myList">
		<div id="card1">내용1</div>
		<div id="card2">내용2</div>
		<div id="card3">내용3</div>
		<div id="card4">내용4</div>		
	</div>
  </div>
</body>
</html>