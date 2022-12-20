<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html id="individualHtml">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<link href="<c:url value="/resources/css/individual.css"/>" rel='stylesheet' />
</head>
<body id="individualBody">
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	<section class="news-detail-header-section-sell text-center">
            <div class="section-overlay"></div>
            <div class="container">
                <div class="sellrow" id="individualheader">
                    <div class="col-lg-12 col-12">
                        <h1 class="text-white">개인 판매</h1>
                    </div>
                </div>
            </div>
    </section>
  <div id="individualList">
    <div id="buttonAndSelect">
      <div class="bt_wrap">
	    <c:if test="${!empty authUser}">    
	    	<c:if test="${'users' eq authUser.sect}">
		  		<a href="sellRegistForm" class="on">글쓰기</a>
		  	</c:if>
      	</c:if>
      </div>
      <div class="search-box">
      	<form id="search_form" action="sellList" method="get">
        	<input class="search-input" type="text" id="kwd" name="kwd" placeholder="Search something..">
        	<button class="search-btn" type="submit"><i class="fas fa-search"></i></button>
        	<input type="hidden" name="keyword" id="keyword" value="${kwd}"/>
        </form>
      </div>
    </div>
	
    <div class="card-list">
	  <c:forEach var="sell" items="${sellList}">
     <a href="sellView/${sell.ino}">
	     <div class="card" data-sno=${sell.ino }>
     		  <div class="individualCard-header">
	     	  	  ${sell.idealType}
	     	  </div>
	          <div class="card-image">
	          	<c:if test="${'거래 완료' == sell.istatus}">
	          		<div class="individualStatus">${sell.istatus }</div>
	          	</c:if>
	          	<c:choose>
	          		<c:when test="${empty sell.ifileids }">
	          			<img src="image/logo3.png" alt="로고">
	          		</c:when>
	          		<c:otherwise>
	              		<img src="upload/${ sell.ifileids}" alt="무료나눔 옷">
	          		</c:otherwise>
	          	</c:choose>
	          </div>
	          <div class="card-body">
	              <div class="priceAndDate"><span class="price">${sell.price}원</span><span class="date">${sell.regDate}</span></div>
	              <h2 class="sharingTitle">${sell.ititle }</h2>
	              <div class="individualDealNick"><p><img src="/image/greenuser.png">${sell.nickname}</p></div>
	          </div>
	          	
		          <div class="card-footer">
		              <img src="/image/pin.png"><p>${sell.iaddress}</p>
		          </div>
	      </div>
     </a>
      
	  </c:forEach>
    </div>
    
  </div>
<script src="<c:url value='/resources/js/sell/infiniteScroll.js'/>"></script>
</body>
</html>