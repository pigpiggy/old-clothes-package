<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link href="<c:url value="/static/css/review.css"/>" rel='stylesheet' />
	<link href="<c:url value="/static/css/free.css"/>" rel='stylesheet' />
</head>
<body>
	<c:import url='/WEB-INF/views/mypage/usermypage.jsp' />
	<c:if test="${authUser.sect eq 'users' }">
		<c:if test="${authUser.userno eq users.userno }">
	<div class="my_Tab">
			<ul class="tabs">
				<li><a href ="/mypage/umypage/${users.userno }/sell">판매 상품</a></li>
				<li><a href ="/mypage/umypage/${users.userno }/buy">구매 상품</a></li>
				<li><a href ="/mypage/umypage/${users.userno }/apply">신청 목록</a></li>
				<li class="on"><a href ="/mypage/umypage/${users.userno }/review">거래 후기</a></li>
			</ul>
	</div>
	</c:if>

	<c:if test="${authUser.userno ne users.userno }">
		<div class="my_Tab">
			<ul class="tabs">
			<li><a href ="/mypage/umypage/${users.userno }/sell">판매 상품</a></li>
			<li class="on"><a href ="/mypage/umypage/${users.userno }/review">거래 후기</a></li>
			</ul>
			</div>
		</c:if>
		</c:if>

		<c:if test="${authUser.sect eq 'business' || empty authUser}">		
			<div class="my_Tab">
			<ul class="tabs">
			<li><a href ="/mypage/umypage/${users.userno }/sell">판매 상품</a></li>
			<li class="on"><a href ="/mypage/umypage/${users.userno }/review">거래 후기</a></li>
			</ul>
			</div>
		</c:if>
	<div id="reviewcontainer">
		<div id="rCards">
			<div class="rCard-list">
				<c:forEach var="review" items="${reviewList }">
				    <c:if test = "${review.stitle != null }">
					    <div class="rcard rcard-2">
					        <div class="rcardbody">
					            <div id="reviewstar">
					                <c:if test="${review.rstar == 1}">
						            	<span class="starcontent">"최악이에요"</span>
						                <span class="eachstar">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						               		<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                </span>
					            	</c:if>
					            	<c:if test="${review.rstar == 2}">
						            	<span class="starcontent">"별로예요"</span>
						                <span class="eachstar">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						               		<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                </span>
					            	</c:if>
					            	<c:if test="${review.rstar == 3}">
						            	<span class="starcontent">"보통이에요"</span>
						                <span class="eachstar">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						               		<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                </span>
					            	</c:if>
					            	<c:if test="${review.rstar == 4}">
						            	<span class="starcontent">"만족해요"</span>
						                <span class="eachstar">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						               		<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                </span>
					            	</c:if>
					            	<c:if test="${review.rstar == 5}">
						            	<span class="starcontent">"아주 만족해요"</span>
						                <span class="eachstar">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						               		<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                </span>
					            	</c:if>
					            </div>
					            <div class="reviewCenter">
					                <div class="reviewfirst">
					                	<span class="reviewBox">상품명 </span>
					                	<h3 class="reviewTitle">${review.stitle }</h3>
					                </div>
					                <div class="reviewfirst">
					                	<span class="reviewBox">거래유형 </span>
					                	<h3 class="reviewTitle">${review.sdealtype }</h3>
					                </div>
					            	<p class="reviewContent">'${review.rcontent}'</p>
					            </div>	
					        </div>
					        <div id="reviewWriter">
					        	<div class="rNickname">
					        		<img src="/static/image/orangeuser.png">
					            	<span class="cardheader">${review.nickname }</span>
					            </div>
					            <span class="cardheader">${review.regdate }</span>
					        </div>
					    </div>
				   </c:if>
				   <c:if test = "${review.ititle != null }">
					    <div class="rcard rcard-2">
					        <div class="cardbody">
					            <div id="reviewStar">
					                <c:if test="${review.rstar == 1}">
						            	<span class="starcontent">"최악이에요"</span>
						                <span class="eachstar">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						               		<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                </span>
					            	</c:if>
					            	<c:if test="${review.rstar == 2}">
						            	<span class="starcontent">"별로예요"</span>
						                <span class="eachstar">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						               		<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                </span>
					            	</c:if>
					            	<c:if test="${review.rstar == 3}">
						            	<span class="starcontent">"보통이에요"</span>
						                <span class="eachstar">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						               		<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                </span>
					            	</c:if>
					            	<c:if test="${review.rstar == 4}">
						            	<span class="starcontent">"좋아요"</span>
						                <span class="eachstar">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						               		<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/graystar.png" alt="로고">
						                </span>
					            	</c:if>
					            	<c:if test="${review.rstar == 5}">
						            	<span class="starcontent">"아주 좋아요"</span>
						                <span class="eachstar">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						               		<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                	<img src="/static/image/yellowstar.png" alt="로고">
						                </span>
					            	</c:if>
					            </div>
					            <div class="reviewCenter">
					                <div class="reviewfirst">
					                	<span id="reviewSpace" class="reviewBox">상품명 </span>
					                	<h3 class="reviewTitle">${review.ititle }</h3>
					                </div>
					                <div class="reviewfirst">
					                	<span class="reviewBox">거래유형 </span>
					                	<h3 class="reviewTitle">${review.idealtype }</h3>
					                </div>					            	
					                <span class="reviewContent">'${review.rcontent}'</span>
					            </div>	
					        </div>
					        <div id="reviewWriter">
					        	<div class="rNickname">
					        		<img src="/static/image/skyuser.png">
					            	<span class="cardheader">${review.nickname }</span>
					            </div>
					            <span class="cardheader" id="rRegdate">${review.regdate }</span>
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
							<li><a href="/mypage/umypage/${users.userno }/review?rpage=${rpageInfo.page-1}&select=1" id="prev"><<</a></li>&nbsp;
						</c:otherwise>
					</c:choose>
					<c:forEach var="i" begin="${rpageInfo.startPage }" end="${rpageInfo.endPage }">
						<c:choose>
							<c:when test="${rpageInfo.page==i }"><li><a class="active">${i }</a></li></c:when>
							<c:otherwise>
								<li><a href="/mypage/umypage/${users.userno }/review?rpage=${i}&select=1">${i }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${rpageInfo.page>=rpageInfo.maxPage }">
							<li><a id="next">>></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="/mypage/umypage/${users.userno }/review?rpage=${rpageInfo.page+1}&select=1" id="next">>></a></li>
						</c:otherwise>
					</c:choose>
				</ul>		
		</div>
	</div>		
    <div>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
	</div>		
    <script src="<c:url value='/static/js/free/paging.js'/>"></script>
</body>
</html>