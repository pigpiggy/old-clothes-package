<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    
     <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<script>
	var msg = "${msg}";
	if(msg != ''){
		alert(msg);
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
                    	<h3 class="text-uppercase text-center mb-5">로그인</h3>
                    		<form action="loginaction" method="post">               			
								<div id=loginform>
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="id" style="position:absolute; margin:2.5%;"><img src="image/icons8-user-40.png" style="width:65%; margin-bottom:15%;"></label>
				                        <input type="text" id="id" name="id" class="form-control form-control-lg" placeholder="아이디" style="padding:.5rem 1rem .5rem 3rem;" />
			                        </div>
	
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="password" style="position:absolute; margin:2.5%;"><img src="image/icons8-lock-40.png" style="width:65%; margin-bottom:15%;"></label>
				                        <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder="비밀번호" style="padding:.5rem 1rem .5rem 3rem;" />
			                        </div>
									
	
			                        <div class="d-flex justify-content-center">
				                        <button type="submit"
				                            class="btn btn-outline-primary">로그인</button>
			                        </div>
									<c:if test='${result eq "fail" }'>
							      		<p style="color:red;">
											로그인 실패<br>
											아이디/패스워드를 확인해 주세요
										</p>
									</c:if>
									<br>
			                        <p class="text-center text-muted mt-5 mb-0">
                                        <a href="searchid" class="fw-bold text-body" style="text-decoration: none;"><u style="text-decoration: none;">아이디 찾기</u></a>&nbsp;&nbsp;&nbsp;
                                        <a href="checkidnphone" class="fw-bold text-body" style="text-decoration: none;"><u style="text-decoration: none;">비밀번호 찾기</u></a>
                                    </p>
								</div>								
                    		</form>
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