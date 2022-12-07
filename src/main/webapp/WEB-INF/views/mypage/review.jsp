<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link href="<c:url value="/resources/css/review.css"/>" rel='stylesheet' />
</head>
<body>
	<div id="rCards">
		<div class="rCard-list">
			<c:forEach var="review" items="${reviewList }">
			    <c:if test = "${review.stitle != null }">
				    <div class="reviewList card border-light mb-3" style="max-width: 18rem;">
				        <div class="card-body">
				            <div id="reviewStar">
				                <c:if test="${review.rstar == 1}">
					            	<span>"최악이에요"</span>
					                <span>★☆☆☆☆</span>
				            	</c:if>
				            	<c:if test="${review.rstar == 2}">
					            	<span>"별로예요"</span>
					                <span>★★☆☆☆</span>
				            	</c:if>
				            	<c:if test="${review.rstar == 3}">
					            	<span>"보통이에요"</span>
					                <span>★★★☆☆</span>
				            	</c:if>
				            	<c:if test="${review.rstar == 4}">
					            	<span>"만족해요"</span>
					                <span>★★★★☆</span>
				            	</c:if>
				            	<c:if test="${review.rstar == 5}">
					            	<span>"아주 만족해요"</span>
					                <span>★★★★★</span>
				            	</c:if>
				            </div>
				            <div class="reviewcontent" id="reviewTitle">
				                <h5 class="card-title">${review.stitle }</h5>
				            </div>
				            <div class="reviewcontent" id="reviewDealType">
				                <span class="card-text">[${review.sdealtype }] </span>
				            </div>
				           	<div class="reviewcontent" id="reviewDealType">
				            	<p class="card-text">${review.rcontent}</p>
				            </div>	
				        </div>
				        <div class="card-header" id="reviewWriter">
				            <span>${review.nickname }</span>
				            <span>${review.regdate }</span>
				        </div>
				    </div>
			   </c:if>
			   <c:if test = "${review.ititle != null }">
				    <div class="reviewList card border-light mb-3" style="max-width: 18rem;">
				        <div class="card-body">
				            <div id="reviewStar">
				                <c:if test="${review.rstar == 1}">
					            	<span>"최악이에요"</span>
					                <span>★☆☆☆☆</span>
				            	</c:if>
				            	<c:if test="${review.rstar == 2}">
					            	<span>"별로예요"</span>
					                <span>★★☆☆☆</span>
				            	</c:if>
				            	<c:if test="${review.rstar == 3}">
					            	<span>"보통이에요"</span>
					                <span>★★★☆☆</span>
				            	</c:if>
				            	<c:if test="${review.rstar == 4}">
					            	<span>"만족해요"</span>
					                <span>★★★★☆</span>
				            	</c:if>
				            	<c:if test="${review.rstar == 5}">
					            	<span>"아주 만족해요"</span>
					                <span>★★★★★</span>
				            	</c:if>
				            </div>
				            <div class="reviewcontent" id="reviewTitle">
				                <h5 class="card-title">${review.ititle }</h5>
				            </div>
				            <div class="reviewcontent" id="reviewDealType">
				                <span class="card-text">[${review.idealtype }] </span>
				            </div>
				           	<div class="reviewcontent" id="reviewDealType">
				            	<p class="card-text">${review.rcontent}</p>
				            </div>	
				        </div>
				        <div class="card-header" id="reviewWriter">
				            <span>${review.nickname }</span>
				            <span>${review.regdate }</span>
				        </div>
				    </div>
			   </c:if>
		    </c:forEach>
		</div>
	</div>
	
	<%-- 페이징 --%>
	<div class="center">
			<ul class="pagination rpaging">
				<c:choose>
					<c:when test="${rpageInfo.page<=1}">
						<li><a id="prev"><<</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/mypage/umypage/${users.userno }?rpage=${rpageInfo.page-1}&select=1" id="prev"><<</a></li>&nbsp;
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${rpageInfo.startPage }" end="${rpageInfo.endPage }">
					<c:choose>
						<c:when test="${rpageInfo.page==i }"><li><a class="active">${i }</a></li></c:when>
						<c:otherwise>
							<li><a href="/mypage/umypage/${users.userno }?rpage=${i}&select=1">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${rpageInfo.page>=rpageInfo.maxPage }">
						<li><a id="next">>></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/mypage/umypage/${users.userno }?rpage=${rpageInfo.page+1}&select=1" id="next">>></a></li>
					</c:otherwise>
				</c:choose>
			</ul>		
		</div>									   
</body>
</html>