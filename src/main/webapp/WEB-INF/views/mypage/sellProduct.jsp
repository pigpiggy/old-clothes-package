<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/individual.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sharing.css"/>"rel='stylesheet' />
<link href="<c:url value="/resources/css/sellProduct.css"/>"rel='stylesheet' />

</head>
<body>
	<c:import url='/WEB-INF/views/mypage/usermypage.jsp' />
		<c:if test="${authUser.sect eq 'users' }">
		<c:if test="${authUser.userno eq users.userno }">	
		<div class="my_Tab">
			<ul class="tabs">
				<li class="on"><a href ="/mypage/umypage/${users.userno }/sell">판매 상품</a></li>
				<li><a href ="/mypage/umypage/${users.userno }/buy">구매 상품</a></li>
				<li><a href ="/mypage/umypage/${users.userno }/apply">신청 목록</a></li>
				<li><a href ="/mypage/umypage/${users.userno }/review">거래 후기</a></li>
			</ul>			
		</div>
		</c:if>
		
		<c:if test="${authUser.userno ne users.userno }">
		<div class="my_Tab">
			<ul class="tabs">
				<li class="on"><a href ="/mypage/umypage/${users.userno }/sell">판매 상품</a></li>
				<li><a href ="/mypage/umypage/${users.userno }/review">거래 후기</a></li>
				</ul>			
		</div>
		</c:if>
		</c:if>
		
		<c:if test="${authUser.sect eq 'business' || empty authUser}">		
			<div class="my_Tab">
			<ul class="tabs">
				<li class="on"><a href ="/mypage/umypage/${users.userno }/sell">판매 상품</a></li>
				<li><a href ="/mypage/umypage/${users.userno }/review">거래 후기</a></li>
				</ul>			
		</div>
		</c:if>				
				
				
	<div class="sellProductWrap">
		<select class="sellProductSelect">
	    	<option value="개인 판매">개인 판매</option>
	    	<option value="무료 나눔">무료 나눔</option>
	    </select>
	    
		<div id="cards" class="sellCards">
	    	<div class="card-list">
			  <c:forEach var="sell" items="${sellList}">
			  	<div class="sellList">
					     <a href="/sellView/${sell.ino}">
						     <div class="card" data-sno=${sell.ino }>
					          <div class="card-image">
					          	<c:if test="${'등록완료' != sell.istatus}">
					          		<div class="individualStatus">${sell.istatus }</div>
					          	</c:if>
					          	<c:choose>
					          		<c:when test="${empty sell.ifileids }">
					          			<img src="/image/logo3.png" alt="로고">
					          		</c:when>
					          		<c:otherwise>
					              		<img src="/upload/${ sell.ifileids}" alt="무료나눔 옷">
					          		</c:otherwise>
					          	</c:choose>
					          </div>
					          <div class="card-body">
					              <div class="priceAndDate"><span class="price">${sell.price}원</span><span class="date">${sell.regDate}</span></div>
					              <h2 class="sharingTitle">${sell.ititle }</h2>
					              <p>${sell.iaddress}</p>
					          </div>
					          <c:choose>
					          	<c:when test="${empty sell.iaddress}">
					          		<div class="card-footer">
					          			${sell.idealType}
					          		</div>
					          	</c:when>
					          	<c:otherwise>
						          <div class="card-footer">
						              ${sell.idealType} 
						          </div>
					          	</c:otherwise>
					          </c:choose>
					      </div>				      
				     </a>
				     <c:if test="${'거래중' eq sell.istatus}">
				     	<c:if test="${sell.sellCompletedCount eq 0}">
		          			<button class="cancel">거래 취소</button>
		          			<button class="complete">거래 완료</button>
		          		</c:if>
		          	</c:if>
			  	</div>
		 	 </c:forEach>
		    </div>
	    </div>
	    
	    <ul class="pagination sellPage">
			<c:choose>
				<c:when test="${pageInfo.page<=1}">
					<li><a id="prev"><<</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/mypage/umypage/${authUser.userno}/sell?page=${pageInfo.page-1}" id="prev"><<</a></li>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<c:choose>
					<c:when test="${pageInfo.page==i }"><li><a class="active">${i }</a></li></c:when>
					<c:otherwise>
						<li><a href="/mypage/umypage/${authUser.userno}/sell?page=${i}">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					<li><a id="next">>></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/mypage/umypage/${authUser.userno}/sell?page=${pageInfo.page+1}" id="next">>></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	    
	    <div id="cards" class="sharingCards">
	    	<div class="card-list">
			  <c:forEach var="sharing" items="${sharingList}">
			  <div class="sellList">
		     <a href="/sharingView/${sharing.sno}">
			     <div class="card sharingcard" data-sno=${sharing.sno }>
			          <div class="card-image">
			          	<input type="hidden" name="sstatus" value="${sharing.sstatus}">
			          	<c:if test="${'등록완료' != sharing.sstatus}">
			          		<div class="sharingStatus">${sharing.sstatus}</div>
			          	</c:if>
			          	<c:choose>
			          		<c:when test="${empty sharing.sfileids }">
			          			<img src="/image/logo3.png" alt="로고">
			          		</c:when>
			          		<c:otherwise>
			              		<img src="/upload/${sharing.sfileids}" alt="무료나눔 옷">
			          		</c:otherwise>
			          	</c:choose>
			          </div>
			          <div class="card-body">
			              <span class="date">${sharing.regDate}</span>
			              <h2 class="sharingTitle">${sharing.stitle }</h2>
			              <p>${sharing.saddress}</p>
			          </div>
			          <c:choose>
			          	<c:when test="${empty sharing.saddress}">
			          		<div class="card-footer">
			          			${sharing.sdealType}
			          		</div>
			          	</c:when>
			          	<c:otherwise>
				          <div class="card-footer">
				              ${sharing.sdealType} 
				          </div>
			          	</c:otherwise>
			          </c:choose>
			      </div>
		     		</a>
		     		<c:if test="${'거래중' eq sharing.sstatus}">
		     			<c:if test="${sharing.sellCompletedCount eq 0}">
		          			<button class="cancel1">거래 취소</button>
		          			<button class="complete1">거래 완료</button>
		          		</c:if>
		          	</c:if>
		     	 </div>
			  </c:forEach>
		    </div>
	    </div>
	    
	    <ul class="pagination sharingPage">
			<c:choose>
				<c:when test="${spageInfo.page<=1}">
					<li><a id="prev"><<</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/mypage/umypage/${authUser.userno}/sell?spage=${spageInfo.page-1}" id="prev"><<</a></li>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${spageInfo.startPage }" end="${spageInfo.endPage }">
				<c:choose>
					<c:when test="${spageInfo.page==i }"><li><a class="active">${i }</a></li></c:when>
					<c:otherwise>
						<li><a href="/mypage/umypage/${authUser.userno}/sell?spage=${i}">${i }</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${spageInfo.page>=spageInfo.maxPage }">
					<li><a id="next">>></a></li>
				</c:when>
				<c:otherwise>
					<li><a href="/mypage/umypage/${authUser.userno}/sell?spage=${spageInfo.page+1}" id="next">>></a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
    <div>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
	</div>		
	<script>
		$('.cancel').click(function(){
			var index = $(this).parent().index();
			var ino = $(".card:eq("+index+")").attr("data-sno");
			$.ajax({
				type : "get",
				url : "/cancelDeal",
				data : {ino:ino},
				success : function(data) {
					console.log(data);
					console.log("성공");
					location.reload();
				},
				error : function(err) {
					console.log(err);
				}
			});

		})
		
		$('.complete').click(function(){
			var index = $(this).parent().index();
			$(this).attr("disabled", true);
			var ino = $(".card:eq("+index+")").attr("data-sno");
			$.ajax({
				type : "get",
				url : "/completeSellDeal",
				data : {ino:ino},
				success : function(data) {
					console.log(data);
					console.log("성공");
					location.reload();
				},
				error : function(err) {
					console.log(err);
				}
			});

		})
		
		$('.cancel1').click(function(){
			var index = $(this).parent().index();
			var sno = $(".sharingcard:eq("+index+")").attr("data-sno");
			$.ajax({
				type : "get",
				url : "/cancelSharingDeal",
				data : {sno:sno},
				success : function(data) {
					console.log(data);
					console.log("성공");
					location.reload();
				},
				error : function(err) {
					console.log(err);
				}
			});

		})
		
		$('.complete1').click(function(){
			var index = $(this).parent().index();
			$(this).attr("disabled", true);
			var sno = $(".sharingcard:eq("+index+")").attr("data-sno");
			$.ajax({
				type : "get",
				url : "/completeSharingDeal",
				data : {sno:sno},
				success : function(data) {
					console.log(data);
					console.log("성공");
					location.reload();
				},
				error : function(err) {
					console.log(err);
				}
			});

		})
		
		$('.sharingCards').hide();
		$('.sharingPage').hide();
		
		$(".sellProductSelect").change(function() {
			var sect = $(".sellProductSelect option:selected").val();
			console.log(sect);
			if(sect == "개인 판매") {
				$('.sharingCards').hide();
				$('.sharingPage').hide();
				
				$('.sellCards').show();
				$('.sellPage').show();
				
			} else {
				$('.sellCards').hide();
				$('.sellPage').hide();
				
				$('.sharingCards').show();
				$('.sharingPage').show();
			}
		})
		
	</script>
</body>
</html>