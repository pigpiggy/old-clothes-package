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
	
</script>
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	<div class="closet_wrap" >  
    
    <div class="title">
 
      <div class="nickname">
      <input type="hidden" value="${authUser.userno }" id="chatuserno"/>
      <img id="clostick1" src="/image/clostick.png" alt="옷걸이">
     <c:choose>    
	    	<c:when test="${authUser.sect eq 'users' }">
	    			<strong>${authUser.nickname }의 옷장</strong>
	    	</c:when>
      <c:otherwise>
      				<strong>${business.bname }의 옷장</strong>
      </c:otherwise>
      </c:choose>
             
        <img id="clostick2" src="/image/clostick.png" alt="옷걸이"> 
      </div>   
      <div class="fname_closet">
      			<a href="javascript:openDetail('/chatList')">
							<span>채팅</span>
							<span id="messageAlert"></span><br>
				</a>
		        <a href="#">
			      <img id="like" src="/image/redheart.png" alt="찜">
		        </a>          
		        <a href="/mypage/message">
			      <img id="letter" src="/image/letter.png" alt="쪽지">
		        </a>          
		        <a href="/passcheck">
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
			  <span>상품등록 : ${totalcount } 개</span>
			  <span>거래완료 : 19건</span>
			  <span>받은 거래후기 : ${reviewcount }개</span>
		  </div>		
		  <div class="introduce">
			  <div>안녕하세요 알냥이의 옷장입니다. </div>
				<img id="setting" src="/image/setting1.png" alt="소개수정">
		  </div>
  	</div>
	</div>
  </div>
 <script>
 function openDetail(url) {
		var width = 850;
		var height = 650;
		var left = (window.screen.width - width) / 2;
		var top = (window.screen.height - height) / 2;
		window.open(url, 'detail', 'width=' + width +', height='+height +', left='+left +', top='+top +', location=no, status=no, scrollbar=yes');
	} 
 
var chatuserno = document.getElementById('chatuserno').value;
	console.log("chatuserno: " + chatuserno);

	$(document).ready(function() {
	
		if (chatuserno != null) {
			getUnread();
			getInfiniteUnread();
		}
	});

 function getUnread() {
		$.ajax({
			url: "/chatUnreadAlert/ajax",
			type: "POST",
			data: JSON.stringify({
				chatuserno: chatuserno
			}) ,
			dataType: "json",
			contentType: "application/json",
			success: function(result) {
				if (result >= 1) {
					showUnread(result);
				} else {
					showUnread('');
				}
			}
		});
	}
	
	function getInfiniteUnread() {
		setInterval(() => {
			getUnread();
		}, 1000);
	}
	
	function showUnread(result) {
		$('#messageAlert').html(result);
	}
 </script> 
</body>
</html>