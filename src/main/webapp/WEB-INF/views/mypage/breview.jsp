<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<link href="<c:url value="/resources/css/breview.css"/>" rel='stylesheet' />
	<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />
</head>
<body>
	<c:import url='/WEB-INF/views/mypage/bmypage.jsp' />
	<c:if test="${authUser.sect eq 'business' }">
	<c:if test="${authUser.bno eq business.bno }">
	<div class="my_Tab">
			<ul class="tabs">
				<li><a href ="/mypage/bmypage/${business.bno }/apply">신청 목록</a></li>				
				<li class="on"><a href ="/mypage/bmypage/${business.bno }/review">거래 후기</a></li>
			</ul>			
	</div>
	</c:if>
	
	<c:if test="${authUser.bno ne business.bno }">
	<div class="my_Tab">
			<ul class="tabs">						
				<li class="on"><a href ="/mypage/bmypage/${business.bno }/review">거래 후기</a></li>
			</ul>			
	</div>
	</c:if>
	</c:if>
	
	<c:if test="${authUser.sect eq 'users' || empty authUser}">
	<div class="my_Tab">
			<ul class="tabs">						
				<li class="on"><a href ="/mypage/bmypage/${business.bno }/review">거래 후기</a></li>
			</ul>			
	</div>
	</c:if>
	
	<div id="rCards">
		<div class="rCard-list">
			<c:forEach var="review" items="${reviewList }">
				<c:if test = "${review.bno != null }">
				    <div class="rcard rcard-2">
				        <div class="cardbody">
				            <div id="reviewStar">
				                <c:if test="${review.rstar == 1}">
					            	<span class="starcontent">"최악이에요"</span>
					                <span class="eachstar">
					                	<img src="/image/yellowstar.png" alt="로고">
					               		<img src="/image/graystar.png" alt="로고">
					                	<img src="/image/graystar.png" alt="로고">
					                	<img src="/image/graystar.png" alt="로고">
					                	<img src="/image/graystar.png" alt="로고">
					                </span>
				            	</c:if>
				            	<c:if test="${review.rstar == 2}">
					            	<span class="starcontent">"별로예요"</span>
					                <span class="eachstar">
					                	<img src="/image/yellowstar.png" alt="로고">
					               		<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/graystar.png" alt="로고">
					                	<img src="/image/graystar.png" alt="로고">
					                	<img src="/image/graystar.png" alt="로고">
					                </span>
				            	</c:if>
				            	<c:if test="${review.rstar == 3}">
					            	<span class="starcontent">"보통이에요"</span>
					                <span class="eachstar">
					                	<img src="/image/yellowstar.png" alt="로고">
					               		<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/graystar.png" alt="로고">
					                	<img src="/image/graystar.png" alt="로고">
					                </span>
				            	</c:if>
				            	<c:if test="${review.rstar == 4}">
					            	<span class="starcontent">"만족해요"</span>
					                <span class="eachstar">
					                	<img src="/image/yellowstar.png" alt="로고">
					               		<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/graystar.png" alt="로고">
					                </span>
				            	</c:if>
				            	<c:if test="${review.rstar == 5}">
					            	<span class="starcontent">"아주 만족해요"</span>
					                <span class="eachstar">
					                	<img src="/image/yellowstar.png" alt="로고">
					               		<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/yellowstar.png" alt="로고">
					                </span>
				            	</c:if>
				            </div>
				            <div class="reviewCenter">
				                <h3 class="reviewTitle">상호명: ${review.bname }</h3>
				            	<p class="reviewContent">'${review.rcontent}'</p>
				            </div>	
				        </div>
				        <div id="reviewWriter">
				        	<div class="rNickname">
				        		<img src="/image/orangeuser.png">
				            	<span class="cardheader">${review.nickname }</span>
				            </div>
				            <span class="cardheader">${review.regdate }</span>
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
						<li><a href="/mypage/bmypage/${business.bno }/review?rpage=${rpageInfo.page-1}&select=1" id="prev"><<</a></li>&nbsp;
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${rpageInfo.startPage }" end="${rpageInfo.endPage }">
					<c:choose>
						<c:when test="${rpageInfo.page==i }"><li><a class="active">${i }</a></li></c:when>
						<c:otherwise>
							<li><a href="/mypage/bmypage/${business.bno }/review?rpage=${i}&select=1">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${rpageInfo.page>=rpageInfo.maxPage }">
						<li><a id="next">>></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="/mypage/bmypage/${business.bno }/review?rpage=${rpageInfo.page+1}&select=1" id="next">>></a></li>
					</c:otherwise>
				</c:choose>
			</ul>		
		</div>		
		
		<script src="<c:url value='/resources/js/free/paging.js'/>"></script>
</body>
</html>