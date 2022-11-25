<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>searchid</title>
    
     <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<style>

	
</style>
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
    <section class="vh-100 bg-image">
        <div class="mask d-flex align-items-center h-100 gradient-custom-3">
            <div class="container h-100" style="width:1200px;">
            	<div class="row d-flex justify-content-center align-items-center h-100">
                	<div class="col-12 col-md-9 col-lg-7 col-xl-6">
                	<div class="card" style="border-radius: 15px;">
                    	<div class="card-body p-5">
                    	<!-- <h3 class="text-uppercase text-center mb-5">아이디 찾기</h3> -->

                        <p>회원님의 정보와 일치하는 아이디입니다.</p><br> <!-- 아이디 forEach로 출력 -->
							<c:if test="${business != null}">
								<h2 class="text-center mb-5">업체아이디:
									<c:forEach var="bid" items="${business }" varStatus="status">
									${bid }<c:if test="${not status.last }"> ,</c:if>
									</c:forEach>
								</h2>
							</c:if>
							<c:if test="${user != null}">
								<h2 class="text-center mb-5">개인아이디:
									<c:forEach var="uid" items="${user }" varStatus="status">
									${uid }<c:if test="${not status.last }"> ,</c:if>
									</c:forEach>
								</h2>
							</c:if>
			                        <div class="d-flex justify-content-center">
                                        <button type="button" class="btn btn-outline-primary" style="margin-right:3%;" onclick="location.href='login'">&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;&nbsp;</button>
				                        <button type="button" class="btn btn-outline-success" style="margin-left:3%;" onclick="location.href='checkidnphone'">비밀번호 찾기</button>
			                        </div>
								</div>								
                    	</div>
                	</div>
                	</div>
            	</div>
            </div>
        </div>
    </section>
  	
</body>

</html>