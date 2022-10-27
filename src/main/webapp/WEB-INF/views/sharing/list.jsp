<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
<link href="<c:url value="/resources/css/sharing.css"/>" rel='stylesheet'/>

</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp'/>
	</div>
	<div id="listcontent">
      <h1>무료 나눔</h1>
      <div id="addressAndSearch">
        <div>
          <select>
            <option>서울특별시</option>
          </select>
          <select>
            <option>강남구</option>
          </select>
          <select>
            <option>압구정동</option>
          </select>
        </div>
        <form>
          <input type="search" placeholder="검색어를 입력하세요" />
          <span id="searchFormIcon">
            <i class="fa-sharp fa-solid fa-magnifying-glass"></i>
          </span>
        </form>
      </div>
      <div id="buttonAndOption">
        <button type="button" value="상품등록" />
        <select>
          <option>거리순</option>
          <option>후기많은 순</option>
          <option>높은 평점 순</option>
          <option>낮은 평점 순</option>
          <option>조회순</option>
        </select>
      </div>
    </div>
</body>
</html>