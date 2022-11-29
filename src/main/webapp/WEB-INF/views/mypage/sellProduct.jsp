<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/individual.css"/>" rel='stylesheet' />
</head>
<body>
	<div id="cards">
    	<div class="card-list">
		  <c:forEach var="sell" items="${sellList}">
		  	<div class="sellList">
		  		<div class="buyapplylist">구매 신청 목록</div>
				     <a href="sellView/${sell.ino}">
					     <div class="card" data-sno=${sell.ino }>
				          <div class="card-image">
				          	<c:if test="${!'등록완료' eq sell.istatus}">
				          		<div class="individualStatus">${sell.istatus }</div>
				          	</c:if>
				          	<c:choose>
				          		<c:when test="${empty sell.ifileids }">
				          			<img src="/image/logo3.png" alt="로고">
				          		</c:when>
				          		<c:otherwise>
				              		<img src="upload/${ sell.ifileids}" alt="무료나눔 옷">
				          		</c:otherwise>
				          	</c:choose>
				          </div>
				          <div class="card-body">
				              <div class="priceAndDate"><span class="price">${sell.price}원</span><span class="date">${sell.regDate}</span></div>
				              <h2 class="sharingTitle">${sell.ititle }</h2>
				              <p>${sell.addressCity} ${sell.addressTown }</p>
				          </div>
				          <c:choose>
				          	<c:when test="${empty sell.addressCity}">
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
		  	</div>
	  </c:forEach>
	    </div>
    </div>
</body>
</html>