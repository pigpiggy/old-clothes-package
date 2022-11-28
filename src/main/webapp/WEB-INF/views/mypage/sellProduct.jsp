<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/sharing.css"/>"rel='stylesheet' />
</head>
<body>
	<div id="cards">
    	<div class="card-list">
		  <c:forEach var="sharing" items="${sharingList}">
	     <a href="sharingView/${sharing.sno}">
		     <div class="card" data-sno=${sharing.sno }>
		          <div class="card-image">
		          	<c:if test="${!'등록완료' eq sharing.sstatus}">
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
		              <p>${sharing.addressCity} ${sharing.addressTown }</p>
		          </div>
		          <c:choose>
		          	<c:when test="${empty sharing.addressCity}">
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
</body>
</html>