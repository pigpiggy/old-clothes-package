<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판 글목록</title>
<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />


</head>
<body>

	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	
	<div class="board_wrap">
		<div id="subjectAndSearch">
			<div class="board_title">
				<strong>자유게시판</strong>
			</div>		
			<div class="search-box">
		      	<form id="search_form" action="freeList" method="get">
		        	<input class="search-input" type="text" id="kwd" name="kwd" placeholder="검색어를 입력하세요">
		        	<button class="search-btn" type="submit"><i class="fas fa-search"></i></button>
		        	<input type="hidden" name="keyword" id="keyword" value="${kwd}"/>
		        </form>
	      	</div>
		</div>
		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">글번호</div>
					<div class="title">제목</div>
					<div class="writer">닉네임</div>
					<div class="date">작성일</div>
					<div class="count">조회수</div>
				</div>
				<c:forEach var="free" items="${articleList}">
				
				<div>
					<div class="num">${free.fno}</div>
					<div class="title">
						<a href="/freeView/${free.fno}">${free.ftitle}</a>
					</div>
					<div class="writer">${free.fname}</div>
					<div class="date">${free.regdate}</div>
					<div class="count">${free.freadcount}</div>
				</div>
				
				</c:forEach>						
			</div>
			<div class="listview" id="viewlist">
				<ul class="pagination">
				<c:choose>
					<c:when test="${pageInfo.page<=1}">
						<li><a id="prev"><<</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="freeList?page=${pageInfo.page-1}" id="prev"><<</a></li>&nbsp;
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${pageInfo.page==i }"><li><a class="active">${i }</a></li></c:when>
						<c:otherwise>
							<li><a href="freeList?page=${i}">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						<li><a id="next">>></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="freeList?page=${pageInfo.page+1}" id="next">>></a></li>
					</c:otherwise>
				</c:choose>
			</ul>		
		</div>					
			<div class="bt_wrap">
			<c:if test="${!empty authUser}">
				<a href="freeRegistForm" class="on">글쓰기</a> </c:if>
			</div>
		</div>
	</div>
	<div>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
	</div>			
	<script src="<c:url value='/resources/js/free/paging.js'/>"></script>
</body>
</html>