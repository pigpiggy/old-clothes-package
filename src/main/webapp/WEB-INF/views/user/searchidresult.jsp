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

                        <p>회원님의 정보와 일치하는 아이디입니다.</p><br>
                        <c:choose>
							<c:when test="${business.businessid != null}">
								<h2 class="text-uppercase text-center mb-5">${business.businessid }</h2>
							</c:when>
							<c:otherwise>
								<h2 class="text-uppercase text-center mb-5">${user.userid }</h2>
							</c:otherwise>
						</c:choose>	            			
			                        <div class="d-flex justify-content-center">
                                        <button type="button" class="btn btn-outline-primary" style="margin-right:3%;" onclick="location.href='login'">&nbsp;&nbsp;&nbsp;&nbsp;로그인&nbsp;&nbsp;&nbsp;&nbsp;</button>
				                        <button type="button" class="btn btn-outline-success" style="margin-left:3%;" onclick="location.href='#'">비밀번호 찾기</button>
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