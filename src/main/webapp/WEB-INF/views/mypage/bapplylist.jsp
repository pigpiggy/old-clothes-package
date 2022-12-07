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
</head>
<body>
	<div id="cards">
    	<div class="card-list">
		  <c:forEach var="apply" items="${apply}">
		  	<div class="card border-light mb-3" style="max-width: 18rem;">
        		<div class="card-body">
            		<div id="reviewStar">
                		<h5 class="card-title">${apply.aname }</h5>                		
            		</div>
            		<div class="reviewcontent" id="reviewTitle">
                		<span class="card-text">글제목: ${apply.aaddress }</span> 
                		<p>좋아요</p>
            		</div>
            		<div class="reviewcontent" id="reviewDealType">
                		<span class="card-text">휴: ${apply.aphone }</span>
                		<p> 직거래</p>
            		</div>
            		<p class="card-text">${apply.apickup }</p>
        		</div>
        			<div class="card-header">
            			<span>${apply.aname }</span>
            			<span>${apply.apickup }</span>
        			</div>
    		</div>
			
	 	 </c:forEach>
	    </div>
    </div>
    
    <ul class="pagination">
		<c:choose>
			<c:when test="${pageInfo.page<=1}">
				<li><a id="prev"><<</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="freeList?page=${pageInfo.page-1}" id="prev"><<</a></li>&nbsp;
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
			<c:choose>
				<c:when test="${pageInfo.page==i }"><li><a class="active">${i }</a></li></c:when>
				<c:otherwise>
					<li><a href="freeList?page=${i}">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${pageInfo.page>=pageInfo.maxPage }">
				<li><a id="next">>></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="freeList?page=${pageInfo.page+1}" id="next">>></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
    
	
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
				url : "/completeDeal",
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
	</script>
</body>
</html>