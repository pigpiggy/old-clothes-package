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
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<header>
    <div id="topMenu">
      <div id="hamburger">
        <i class="fa-solid fa-bars" id="hamburgerBar"></i>
      </div>
      <div id="logo">
      	<a href="/">
        	<img src="image/logo1.png" alt="하우헌옷 로고">
        </a>
      </div>
      <div id="headerMenu">
      	<c:choose>
      		<c:when test="${authUser == null }">
	      		<a href="joinform">회원가입</a>
		        <a href="login">로그인</a>
		    </c:when>
		    <c:otherwise>
		        <a href="#">마이페이지</a>
		        <a href="logout">로그아웃</a>
		    </c:otherwise>
        </c:choose>
      </div>
    </div>
    <div class="headerMenuBar">
      <ul>
        <li class="hederMenuList">
          <span>하우 헌옷</span>
          <ul class="sideMenu">
            <li><a href="#">하우 헌옷 소개</a></li>
            <li><a href="#">공지사항</a></li>
          </ul>
        </li>
        <li class="hederMenuList">
          <span>헌옷 버리기/기부</span>
          <ul class="sideMenu">
            <li><a href="information">내 주변 헌옷수거함</a></li>
            <li><a href="information">기부처 안내</a></li>
          </ul>
        </li>
        <li class="hederMenuList">
          <a href="sharingList">무료나눔</a>
        </li>
        <li class="hederMenuList">
          <span>헌옷 사고 팔기</span>
          <ul class="sideMenu">
            <li><a href="#">업체 판매</a></li>
            <li><a href="#">개인 판매</a></li>
          </ul>
        </li>
        <li class="hederMenuList">
          <span>커뮤니티</span>
          <ul class="sideMenu">
            <li><a href="freeList">자유게시판</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </header>
<script src="<c:url value='/resources/js/header.js'/>"></script>