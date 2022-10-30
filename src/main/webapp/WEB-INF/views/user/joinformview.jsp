<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
     <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function(){
	$('#businessform').hide();
	$('#personalform').show();
	$('input[type="radio"][id="person"]').on('click', function(){
		var chkValue = $('input[type=radio][id="person"]:checked').val();
		if(chkValue){
			$('#businessform').hide();
			$('#personalform').show();
		}
	});
	$('input[type="radio"][id="business"]').on('click', function(){
		var chkValue = $('input[type=radio][id="business"]:checked').val();
		if(chkValue){
			$('#businessform').show();
			$('#personalform').hide();
		}
	});
});

</script>
<style>
.req{
	color:red;
}
</style>
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
                    	<h2 class="text-uppercase text-center mb-5">회원가입</h2>
                    		<form>
                    			<div class="form-radio" style="text-align:center;">
			                        <input type="radio" name="member_level" value="person" id="person" checked="checked" />
			                        <label for="person">개인</label>
									 &nbsp; &nbsp;
			                        <input type="radio" name="member_level" value="business" id="business" />
			                        <label for="business">사업자</label>
                    			</div>
                    			<br>
								<div id=personalform>
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="form3Example1cg" style="position:absolute; margin:2.5%;" >닉네임<span class="req">*</span></label>
				                 		<input type="text" id="form3Example1cg" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" />
					                    <input type="button" id="nicknamecheck" class="btn btn-outline-primary" value="중복확인">
			                        </div>
	
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="form3Example3cg" style="position:absolute; margin:2.5%;">이메일<span class="req">*</span></label>
				                        <input type="email" id="form3Example3cg" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;"/>
				                        <input type="button" id="emailcheck" class="btn btn-outline-secondary" value="중복확인">
			                        </div>
	                        
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="form3Example5cg" style="position:absolute; margin:2.5%;" >전화번호<span class="req">*</span></label>
				                 		<input type="text" id="form3Example5cg" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" />
					                    <input type="button" class="btn btn-light" value="본인인증">
			                        </div>
	
			                        <div class="form-outline mb-4">
				                        <label class="form-label" for="form3Example4cg">비밀번호<span class="req">*</span></label>
				                        <input type="password" id="form3Example4cg" class="form-control form-control-lg" />
			                        </div>
	
			                        <div class="form-outline mb-4">
				                        <label class="form-label" for="form3Example4cdg">비밀번호 확인<span class="req">*</span></label>
				                        <input type="password" id="form3Example4cdg" class="form-control form-control-lg" />
			                        </div>
							
									<br>
			                        <div class="form-check d-flex justify-content-center mb-5">
				                        <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg" />
				                        <label class="form-check-label" for="form2Example3g">
				                            <a href="#!" class="text-body"><u>약관</u></a>에 동의합니다
				                        </label>
			                        </div>
	
			                        <div class="d-flex justify-content-center">
				                        <button type="button"
				                            class="btn btn-primary btn-block btn-lg text-body">가입하기</button>
			                        </div>
	
			                        <p class="text-center text-muted mt-5 mb-0">이미 계정이 있나요? <a href="#!"
			                            class="fw-bold text-body"><u>로그인하기</u></a></p>
								</div>
								
								<div id=businessform>
									<div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="form3Example1cg" style="position:absolute; margin:2.5%;" >상호명<span class="req">*</span></label>
				                 		<input type="text" id="form3Example1cg" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" />
					                    <input type="button" id="brandnamecheck" class="btn btn-outline-primary" value="중복확인">
		                        	</div>
		                        
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="form3Example6cg" style="position:absolute; margin:2.5%;" >사업자 번호<span class="req">*</span></label>
				                 		<input type="text" id="form3Example6cg" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" />
			                        </div>
	
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="form3Example3cg" style="position:absolute; margin:2.5%;">이메일<span class="req">*</span></label>
				                        <input type="email" id="form3Example3cg" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;"/>
				                        <input type="button" id="emailcheck" class="btn btn-outline-secondary" value="중복확인">
			                        </div>
			                        
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="form3Example7cg" style="position:absolute; margin:2.5%;" >카카오ID</label>
				                 		<input type="text" id="form3Example7cg" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" />
			                        </div>
			                        
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="form3Example5cg" style="position:absolute; margin:2.5%;" >전화번호<span class="req">*</span></label>
				                 		<input type="text" id="form3Example5cg" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" />
					                    <input type="button" class="btn btn-light" value="본인인증">
			                        </div>
	
			                        <div class="form-outline mb-4">
				                        <label class="form-label" for="form3Example4cg">비밀번호<span class="req">*</span></label>
				                        <input type="password" id="form3Example4cg" class="form-control form-control-lg" />
			                        </div>
	
			                        <div class="form-outline mb-4">
				                        <label class="form-label" for="form3Example4cdg">비밀번호 확인<span class="req">*</span></label>
				                        <input type="password" id="form3Example4cdg" class="form-control form-control-lg" />
			                        </div>
			                        
			                        <div class="form-outline mb-4" >
			                        	<div style="display:flex;">
					                        <label class="form-label" for="form3Example8cg" style="margin:2.5%; float:left;" >주소<span class="req">*</span></label>
					                        <div style="display:flex;">
					                        	<input type="button" class="btn btn-light btn-sm" value="우편번호 검색" >
					                        </div>
				                       	</div>
				                       	<div>
					                    	<label class="form-label" for="form3Example8cgr" style="margin:2%;">도로명주소</label>
					                 		<input type="text" id="form3Example8cgr" class="form-control form-control-lg" readonly/>
					                 		<label class="form-label" for="form3Example8cdg"style="margin:2%;">상세주소</label>
					                 		<input type="text" id="form3Example8cgd" class="form-control form-control-lg" />
				                 		</div>
									</div>
									<br>
			                        <div class="form-check d-flex justify-content-center mb-5">
				                        <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3cg" />
				                        <label class="form-check-label" for="form2Example3g">
				                            <a href="#!" class="text-body"><u>약관</u></a>에 동의합니다
				                        </label>
			                        </div>
	
			                        <div class="d-flex justify-content-center">
				                        <button type="button"
				                            class="btn btn-primary btn-block btn-lg text-body">가입하기</button>
			                        </div>
	
			                        <p class="text-center text-muted mt-5 mb-0">이미 계정이 있나요? <a href="#!"
			                            class="fw-bold text-body"><u>로그인하기</u></a></p>
								</div>
                    		</form>
                    	</div>
                	</div>
                	</div>
            	</div>
            </div>
        </div>
    </section>
</body>

</html>