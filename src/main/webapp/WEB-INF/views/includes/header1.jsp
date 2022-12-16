<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/header.css"/>" rel='stylesheet' />
</head>
<body>
	<div id="sticky-wrapper" class="sticky-wrapper" style="height: 90px;">
		<nav class="navbar navbar-expand-lg bg-light shadow-lg">
	        <div class="headerContainer">
	            <a class="navbar-brand" href="/">
	                <img src="/image/logo1.png" class="logo img-fluid" alt="하우헌옷 로고">
	            </a>
	
	            <div class="collapse navbar-collapse" id="navbarNav">
	                <ul class="navbar-nav ms-auto">
	                    <li class="nav-item">
	                        <a class="nav-link click-scroll dropdown-toggle" href="#section_5"
	                            id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown"
	                            aria-expanded="false">버리기/기부</a>
	                        <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
	                            <li><a class="dropdown-item" href="/clothingbin">내 주변 헌옷수거함</a></li>
	
	                            <li><a class="dropdown-item" href="/information">기부처 안내</a></li>
	                        </ul>
	                    </li>
	
	                    <li class="nav-item">
	                        <a class="nav-link click-scroll" href="/sharingList">무료나눔</a>
	                    </li>
	
	                    <li class="nav-item">
	                        <a class="nav-link click-scroll dropdown-toggle" href="#section_5"
	                            id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown"
	                            aria-expanded="false">헌옷 사고 팔기</a>
	                        <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
	                            <li><a class="dropdown-item" href="/businessinfo">업체 판매</a></li>
	
	                            <li><a class="dropdown-item" href="/sellList">개인 판매</a></li>
	                        </ul>
	                    </li>
	
	                    <li class="nav-item">
	                        <a class="nav-link click-scroll dropdown-toggle" href="#section_5"
	                            id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown"
	                            aria-expanded="false">커뮤니티</a>
	                        <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
	                            <li><a class="dropdown-item" href="/freeList">자유게시판</a></li>
	                        </ul>
	                    </li>
						<c:choose>
	      					<c:when test="${authUser == null}">
			                    <li class="nav-item ms-3">
			                        <a class="nav-link custom-btn custom-border-btn btn" href="/joinform">회원가입</a>
			                    </li>
			                    <li class="nav-item ms-3">
			                        <a class="nav-link custom-btn custom-border-btn btn" href="/login">로그인</a>
			                    </li>
			                </c:when>
						    <c:otherwise>
						    	<c:if test="${authUser.sect=='users' }">
						    		<li class="nav-item ms-3">
				                        <a class="nav-link custom-btn custom-border-btn btn" href="/mypage/umypage/${authUser.userno }/sell">마이페이지</a>
				                    </li>
				                    <li class="nav-item ms-3">
				                        <a class="nav-link custom-btn custom-border-btn btn" href="/logout">로그아웃</a>
				                    </li>
				                </c:if>
			        			<c:if test="${authUser.sect=='business' }">
			        				<li class="nav-item ms-3">
				                        <a class="nav-link custom-btn custom-border-btn btn" href="/mypage/bmypage/${authUser.bno }/apply">마이페이지</a>
				                    </li>
				                    <li class="nav-item ms-3">
				                        <a class="nav-link custom-btn custom-border-btn btn" href="/logout">로그아웃</a>
				                    </li>
				                </c:if>			        
					    </c:otherwise>
			        </c:choose>
	                </ul>
	            </div>
	        </div>
	    </nav>
	</div>
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.sticky.js'/>"></script>
	<script src="<c:url value='/resources/js/click-scroll.js'/>"></script>
	<script src="<c:url value='/resources/js/counter.js'/>"></script>
	<script src="<c:url value='/resources/js/custom.js'/>"></script>
</body>
</html>