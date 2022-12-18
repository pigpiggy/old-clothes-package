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
<script>
	var msg ="${msg}";
	if (msg != ""){
		alert(msg)
	} 
</script>

</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	<br>
    <section class="vh-100 bg-image">
        <div class="mask d-flex align-items-center h-100 gradient-custom-3">
            <div class="container h-100" style="width:1200px;">
            	<div class="row d-flex justify-content-center align-items-center h-100">
                	<div class="col-12 col-md-9 col-lg-7 col-xl-6">
                	<div class="card" style="border-radius: 15px;">
                    	<div class="card-body p-5">
                    	<!-- <h3 class="text-uppercase text-center mb-5">아이디 찾기</h3> -->
                    	<c:if test="${authUser.sect eq 'users'}">						
                    		<form action="upasscheck" method="POST">               			
								<div id=checkupassform>
									<br>
									<p>개인비밀번호를 입력해주세요.</p>
									
			                        <div class="form-outline mb-4" >
				                        <label class="form-label" for="pass" style="margin:2.5%;">비밀 번호</label>
				                        <input type="password" id="pass" name="pass" class="form-control form-control-lg" placeholder="비밀번호입력" />
			                        </div>
									
			                        <div class="d-flex justify-content-center">
				                        <button type="submit"
				                            class="btn btn-outline-primary">비밀번호 확인</button>
			                        </div>
								</div>								
                    		</form>
                    	</c:if>
                    	<c:if test="${authUser.sect eq 'business'}">						
                    		<form action="bpasscheck" method="POST">               			
								<div id=checkbpassform>
									<br>
									<p>업체비밀번호를 입력해주세요.</p>
									
			                        <div class="form-outline mb-4" >
				                        <label class="form-label" for="pass" style="margin:2.5%;">비밀 번호</label>
				                        <input type="password" id="pass" name="pass" class="form-control form-control-lg" placeholder="비밀번호입력" />
			                        </div>
									
			                        <div class="d-flex justify-content-center">
				                        <button type="submit"
				                            class="btn btn-outline-primary">비밀번호 확인</button>
			                        </div>
								</div>								
                    		</form>
                    	</c:if>
                    	</div>
                	</div>
                	</div>
            	</div>
            </div>
        </div>
    </section>
    <div>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
	</div>
</body>

</html>