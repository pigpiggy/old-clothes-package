<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html id="sharingHtml">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sharing.css"/>"rel='stylesheet' />
</head>
<body id="sharingBody">
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	 <section class="news-detail-header-section text-center">
            <div class="section-overlay"></div>

            <div class="container">
                <div class="row" id="sharingheader">
                    <div class="col-lg-12 col-12">
                        <h1 class="text-white">무료 나눔</h1>
                    </div>
                </div>
            </div>
     </section>
  <div id="sharingList">
    <h1 id="sharingListSubject"></h1>
    
    <div id="buttonAndSelect">
      <div class="bt_wrap">
	    <c:if test="${!empty authUser}">
	    	<c:if test="${authUser.sect eq 'users'}">    
		  		<a href="sharingRegistForm" class="on">글쓰기</a>
		  	</c:if>
      	</c:if>
      </div>
      <div class="search-box">
      	<form id="search_form" action="sharingList" method="get">
        	<input class="search-input" type="text" id="kwd" name="kwd" placeholder="Search something..">
        	<button class="search-btn" type="submit"><i class="fas fa-search"></i></button>
        	<input type="hidden" name="keyword" id="keyword" value="${kwd}"/>
        </form>
      </div>
    </div>
	
    <div id="cards">
    	<div class="card-list">
		  <c:forEach var="sharing" items="${sharingList}">
	     <a href="sharingView/${sharing.sno}">
		     <div class="card" data-sno=${sharing.sno }>
		          <div class="card-image">
		          	<c:if test="${'거래 완료' == sharing.sstatus}">
		          		<div class="sharingStatus">${sharing.sstatus }</div>
		          	</c:if>
		          	<c:choose>
		          		<c:when test="${empty sharing.sfileids }">
		          			<img src="image/logo3.png" alt="로고">
		          		</c:when>
		          		<c:otherwise>
		              		<img src="upload/${ sharing.sfileids}" alt="무료나눔 옷">
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
	      
		  </c:forEach>
	    </div>
    </div>
    
  </div>
<script src="<c:url value='/resources/js/sharing/sigungu.js'/>"></script>
<script src="<c:url value='/resources/js/sharing/infiniteScroll.js'/>"></script>
</body>
</html>