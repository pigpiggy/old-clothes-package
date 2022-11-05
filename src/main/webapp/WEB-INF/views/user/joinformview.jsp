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
$(function(){
	$('#nickname').change(function(){
		$('#nicknamecheck').show();
		$('#checkednickname').hide();
	});
	
	
	//닉네임 중복확인
	$(function(){
	   $('#nicknamecheck').click(function(){
	      var nickname =$('#nickname').val(); //사용자가 입력한 id값 
	      console.log(nickname);
	      $.ajax({
	         type : "post",
	         url : "http://localhost:8090/nickname",
	         data : {nickname:nickname},
	         success:function(data,textStatus){
	            if(data=="true"){
	               alert("이미 사용중인 닉네임입니다.");
	            }else if(nickname==''){
	               alert("닉네임을 입력해주세요");
	            }else{
	               alert("사용이 가능한 닉네임입니다.");
	            }
	            $('#nicknamecheck').hide();
	    		$('#checkednickname').show();
	         }
	      })
	   });
	});
	
	
	
	
	
	
	<%--
	$('#btn-checkid').click(function(){
		var id = $('#id').val();
		if(id == ''){
			return;
		}
		// ajax 통신
		$.ajax({
			url : "${pageContext.servletContext.contextPath }/user/api/checkid?id="+id, //문자열로 인식이 되는게 아니라 서버에서 el값으로 먼저 치환후 js통신을 한다.
			type : "GET",
			dataType : "json",
			data : "", //post방식일때 값을 여기에 넣어줌
			success:function(response){
				if(response.result != "success"){
					console.error(response.message);
					return;
				}
				if(response.data == true){
					 $("#checkid-msg").text("다른 아이디로 가입해 주세요");
					 $("#checkid-msg").css("color", "red");
					$('#id').focus();
					$('#id').val("");
					return;
				}else{ 
				 $("#checkid-msg").text("사용할 수 있는 아이디 입니다");
				 $("#checkid-msg").css("color", "green");
				 }
				
				$('#btn-checkid').hide();
				$('#check-image').show();
			},
			error : function(xhr, error){ //xmlHttpRequest?
					console.error("error : "+error);
			}
		});
	})
	--%>
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
				                        <label class="form-label" for="nickname" style="position:absolute; margin:2.5%;" >닉네임<span class="req">*</span></label>
				                 		<input type="text" id="nickname" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
					                    <input type="button" id="nicknamecheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
					                    <input type="button" id="checkednickname" class="btn btn-light disabled" value="확인완료" style="margin-left:2%; display:none;">
			                        </div>
	
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="p_email" style="position:absolute; margin:2.5%;">이메일<span class="req">*</span></label>
				                        <input type="email" id="p_email" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;"/>
				                        <input type="button" id="p_emailcheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
			                        </div>
	                        
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="p_phonenumber" style="position:absolute; margin:2.5%;" >전화번호<span class="req">*</span></label>
				                 		<input type="text" id="p_phonenumber" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
					                    <input type="button" id="p_phonenumbercheck" class="btn btn-light" value="본인인증" style="margin-left:2%;">
			                        </div>
			                        
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="p_verification code" style="position:absolute; margin:2.5%;" >인증번호<span class="req">*</span></label>
				                 		<input type="text" id="p_verification code" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
					                    <input type="button" id="p_verification codecheck"class="btn btn-light" value="인증확인" style="margin-left:2%;">
			                        </div>
	
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="p_password" style="position:absolute; margin:2.5%;">비밀번호<span class="req">*</span></label>
				                        <input type="password" id="p_password" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
			                        </div>
	
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="p_checkpassword" style="position:absolute; margin:2.5%;">비밀번호 확인<span class="req">*</span></label>
				                        <input type="password" id="p_checkpassword" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
			                        </div>
							
									<br>
			                        <div class="form-check d-flex justify-content-center mb-5">
				                        <input class="form-check-input me-2" type="checkbox" value="" id="p_clause" />
				                        <label class="form-check-label" for="p_clause">
				                            <a href="#!" class="text-body"><u>약관</u></a>에 동의합니다
				                        </label>
			                        </div>
	
			                        <div class="d-flex justify-content-center">
				                        <button type="button"
				                            class="btn btn-outline-primary">가입하기</button>
			                        </div>
	
			                        <p class="text-center text-muted mt-5 mb-0">이미 계정이 있나요? <a href="#!"
			                            class="fw-bold text-body"><u>로그인하기</u></a></p>
								</div>
								
								<div id=businessform>
									<div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="brandname" style="position:absolute; margin:2.5%;" >상호명<span class="req">*</span></label>
				                 		<input type="text" id="brandname" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
					                    <input type="button" id="brandnamecheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
		                        	</div>
		                        
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="corporate number" style="position:absolute; margin:2.5%;" >사업자 번호<span class="req">*</span></label>
				                 		<input type="text" id="corporate number" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
			                        </div>
	
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="b_email" style="position:absolute; margin:2.5%;">이메일<span class="req">*</span></label>
				                        <input type="email" id="b_email" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;"/>
				                        <input type="button" id="b_emailcheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
			                        </div>
			                        
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="kakaoId" style="position:absolute; margin:2.5%;" >
				                        <span class="question">
			                        		<img src="image/question.png" class="icon2" style="width:4%;">
			                        	</span>
			                        	카카오ID
			                        	</label>
				                 		<input type="text" id="kakaoId" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
			                        </div>
			                        
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="b_phonenumber" style="position:absolute; margin:2.5%;" >전화번호<span class="req">*</span></label>
				                 		<input type="text" id="b_phonenumber" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
					                    <input type="button" id="b_phonenumbercheck"class="btn btn-light" value="본인인증" style="margin-left:2%;">
			                        </div>
			                        
			                         <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="b_verification code" style="position:absolute; margin:2.5%;" >인증번호<span class="req">*</span></label>
				                 		<input type="text" id="b_verification code" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
					                    <input type="button" id="b_verification codecheck"class="btn btn-light" value="인증확인" style="margin-left:2%;">
			                        </div>
	
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="b_password" style="position:absolute; margin:2.5%;">비밀번호<span class="req">*</span></label>
				                        <input type="password" id="b_password" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;"/>
			                        </div>
	
			                        <div class="form-outline mb-4" style="display:flex;">
				                        <label class="form-label" for="b_checkpassword" style="position:absolute; margin:2.5%;">비밀번호 확인<span class="req">*</span></label>
				                        <input type="password" id="b_checkpassword" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;"/>
			                        </div>
			                        
			                        <div class="form-outline mb-4" >
			                        	<div style="display:flex;">
					                        <label class="form-label" for="b_address" style="margin:2.5%; float:left;" >주소<span class="req">*</span></label>
					                        <div style="display:flex;">
					                        	<input type="button" class="btn btn-light btn-sm" value="우편번호 검색" >
					                        </div>
				                       	</div>
				                       	<div>
					                    	<label class="form-label" for="b_address" style="margin:2%;">도로명주소</label>
					                 		<input type="text" id="b_address" class="form-control form-control-lg" readonly/>
					                 		<label class="form-label" for="b_detailedaddress"style="margin:2%;">상세주소</label>
					                 		<input type="text" id="b_detailedaddress" class="form-control form-control-lg" />
				                 		</div>
									</div>
									<br>
			                        <div class="form-check d-flex justify-content-center mb-5">
				                        <input class="form-check-input me-2" type="checkbox" value="" id="b_clause" />
				                        <label class="form-check-label" for="b_clause">
				                            <a href="#!" class="text-body"><u>약관</u></a>에 동의합니다
				                        </label>
			                        </div>
	
			                        <div class="d-flex justify-content-center">
				                        <button type="button"
				                            class="btn btn-outline-primary">가입하기</button>
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
    <!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h3 class="modal-title" id="modal-title">번호 인증</h3>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modal-body">
      	<input type="text" class="certification" value="" placeholder="번호 입력">
      	<input type="button" class="btn btn-outline primary" value="인증요청">
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
      	<button type="submit" class="btn btn-primary" data-bs-dismiss="modal">인증완료</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>
</body>

</html>