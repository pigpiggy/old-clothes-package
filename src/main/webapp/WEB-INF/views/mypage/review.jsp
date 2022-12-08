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
				    <div class="rcard rcard-2">
				        <div class="cardbody">
				            <div id="reviewstar">
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
				                <h3 class="reviewTitle">거래물품: ${review.stitle }</h3>
				                <div class="reviewDealType">거래유형: ${review.sdealtype }</div>
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
			   <c:if test = "${review.ititle != null }">
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
					            	<span class="starcontent">"좋아요"</span>
					                <span class="eachstar">
					                	<img src="/image/yellowstar.png" alt="로고">
					               		<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/yellowstar.png" alt="로고">
					                	<img src="/image/graystar.png" alt="로고">
					                </span>
				            	</c:if>
				            	<c:if test="${review.rstar == 5}">
					            	<span class="starcontent">"아주 좋아요"</span>
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
				                <h3 class="reviewTitle">거래물품: ${review.ititle }</h3>
				                <div class="reviewDealType">거래유형: ${review.idealtype }</div>
				            	<p class="reviewContent">'${review.rcontent}'</p>
				            </div>	
				        </div>
				        <div id="reviewWriter">
				        	<div class="rNickname">
				        		<img src="/image/skyuser.png">
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
		
		<script>
			$(document).ready(function(){
				var index = 0;
				
					$('.my_Tab .tabs a').on('click',function(e){ //탭 메뉴에 있는 링크를 클릭했을 때	
						e.preventDefault();
						var idx = $(this).parent().index(); //현재 클릭한 링크의 부모가 몇번째 인지 idx 변수에 넣는다.
						
						$(this).parent().siblings().removeClass('on'); //현재 클릭한 링크의 부모를 제외 한 나머지 li에 on클래스를 제거하고
						
						$(this).parent().addClass('on'); //현재 클릭한 링크의 부모 li에 on클래스를 넣는다.
						
						$(this).parent().parent().siblings('.tab_con').removeClass('on'); 
						//현재 클릭한 부모 li의 부모 ul을 제외한 나머지 클래스 .tab_con에 클래스 on을 지워준다
						
						$(this).parent().parent().siblings('.tab_con').eq(idx).addClass('on');
						//현재 클릭한 부모 li의 부모 ul을 제외한 나머지 클래스 .tab_con을 선택하고 그 중  eq번째에 클래스 on을 넣는다.
						index = idx;
						
					});
					
					
			});
			
			$.ajax({
				type : "get",
				url : "/cancelDeal",
				data : {index:index},
				success : function(data) {
					console.log(data);
					console.log("성공");
					location.reload();
				},
				error : function(err) {
					console.log(err);
				}
			});
		</script>							   
</body>
</html>