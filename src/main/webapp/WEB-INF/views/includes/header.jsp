<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/5231ffc51c.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
 	<link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/resources/css/bootstrap-icons.css"/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value="/resources/css/templatemo-kind-heart-charity.css"/>" rel="stylesheet" type="text/css"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
    font-family: 'SUIT-Regular';
}
.site-header {
	font-weight: 300;
}
</style>
</head>
<body>
 <header class="site-header">
        <div class="container">
            <div class="row">

                <div class="col-lg-8 col-12 d-flex flex-wrap">
                    <p class="d-flex me-4 mb-0">
                       	<img src="/image/location.png" style="width: 13px;height: 18px;" class="bi-geo-alt me-2" alt="쪽지">
							KOSTA, 70, Gasan digital 1-ro, Geumcheon-gu, Seoul, Republic of Korea
                    </p>

                </div>

                <div class="col-lg-4 col-12 d-lg-block d-none">
                    <ul class="social-icon">
                            <a href="https://github.com/sajo4jo/old-clothes-package">
                               	<img src="/image/github.png" style="width:30px;" class="bi-geo-alt me-2" alt="쪽지" />
                   	 		</a>
                    </ul>
                </div>

            </div>
        </div>
    </header>

    <nav class="navbar navbar-expand-lg bg-light shadow-lg">
        <div class="container">
            <a class="navbar-brand" href="/">
                <span>
                	<img src="/image/logo1.png" class="logo img-fluid" alt="Kind Heart Charity">
                </span>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link click-scroll" href="/">하우헌옷</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link click-scroll dropdown-toggle" href="#section_2" id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">버리기/기부 ∨
                        </a>
                            <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
	                            <li><a class="dropdown-item" href="/clothingbin">내 주변 헌옷 수거함</a></li>
	
	                            <li><a class="dropdown-item" href="/information">기부처 안내</a></li>
                        	</ul>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link click-scroll" href="/sharingList">무료나눔</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link click-scroll dropdown-toggle" href="#section_4" id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">헌옷 사고 팔기</a>
                   		<ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
                            <li><a class="dropdown-item" href="/businessinfo">업체 판매</a></li>
                            <li><a class="dropdown-item" href="/sellList">개인 판매</a></li>
                        </ul>        
                    </li>

                    <li class="nav-item">
                        <a class="nav-link click-scroll" href="/freeList">커뮤니티</a>
                    </li>
				<c:choose>
					<c:when test="${authUser == null }">
	                    <li class="nav-item ms-3">
	                        <a class="nav-link custom-btn custom-border-btn btn" href="/login">Login</a>
	                    </li>
	                    <li class="nav-item ms-3">
	                        <a class="nav-link custom-btn custom-border-btn btn" href="/joinform">Join</a>
	                    </li>
	                </c:when>
	                <c:otherwise>
						<c:if test="${authUser.sect=='users' }">
							<li class="nav-item ms-3">
						        <a class="nav-link custom-btn custom-border-btn btn" href="/mypage/umypage/${authUser.userno }/sell">Mypage</a>
						        <a class="nav-link custom-btn custom-border-btn btn" href="/logout">Logout</a>
						    </li>     
				        </c:if>
				        <c:if test="${authUser.sect=='business' }">
				       		<li class="nav-item ms-3">
					        	<a class="nav-link custom-btn custom-border-btn btn" href="/mypage/bmypage/${authUser.bno }/apply">Mypage</a>
						        <a class="nav-link custom-btn custom-border-btn btn" href="/logout">Logout</a>
						    </li>    
						</c:if>		                
	                </c:otherwise>
	            </c:choose>        
                </ul>
            </div>
        </div>
    </nav>
    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/bootstrap.min2.js"></script>
    <script src="/resources/js/jquery.sticky.js"></script>
    <script src="/resources/js/click-scroll.js"></script>
    <script src="/resources/js/counter.js"></script>
    <script src="/resources/js/custom.js"></script>
    <script src="/resources/js/header.js"></script>    