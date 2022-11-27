<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link href="<c:url value="/resources/css/review.css"/>" rel='stylesheet' />
</head>
<body>
    <div class="card border-light mb-3" style="max-width: 18rem;">
        <div class="card-body">
            <div id="reviewStar">
                <h5 class="card-title">만족해요</h5>
                <span>★★★★☆</span>
            </div>
            <div class="reviewcontent" id="reviewTitle">
                <span class="card-text">글제목: </span> 
                <p>좋아요</p>
            </div>
            <div class="reviewcontent" id="reviewDealType">
                <span class="card-text">거래 유형: </span>
                <p> 직거래</p>
            </div>
            <p class="card-text">잘 입을게요~ 싸게 잘 샀네요 ㅎㅎㅎ</p>
        </div>
        <div class="card-header">
            <span>도라에몽</span>
            <span>2022-11-18</span>
        </div>
    </div>
</body>
</html>