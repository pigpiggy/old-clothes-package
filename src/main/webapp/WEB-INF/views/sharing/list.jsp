<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
	#content h1 {
        text-align: center;
      }

      #addressAndSearch {
        display: flex;
        justify-content: space-around;
      }

      #buttonAndOption {
        justify-content: space-around;
      }
</style>
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp'/>
	</div>
	<div id="content">
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