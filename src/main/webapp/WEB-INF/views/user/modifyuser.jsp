<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보수정</title>
    
     <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>

.req{
	color:red;
}


 
</style>
</head>
<body>
	<div id="wrap">
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
	                    	<h2 class="text-uppercase text-center mb-5">회원정보수정</h2>
	                    			<br>
	                    			<%--개인 --%>
	                    			
									
									<div id=personalform>
									<form action="modifyuser" method="POST" onsubmit="return Validation();">
				                        <div class="form-outline mb-4" style="display:flex;">
				                        	<input type="hidden" name="userno" value="${Uauthuser.userno }">
				                        	<input type="hidden" name="sect" value="users"/>
					                        <label class="form-label" for="nickname" style="position:absolute; margin:2.5%;" >닉네임<span class="req">*</span></label>
					                 		<input type="text" id="nickname" name="nickname" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" value="${Uauthuser.nickname }"/>
						                    <input type="button" id="nicknamecheck" class="btn btn-light" value="중복확인" style="margin-left:2%; display:none;">
						                    <input type="hidden" name="check_nick" id="check_nick" value="${Uauthuser.nickname }">
						                    <input type="button" id="checkednickname" class="btn btn-light disabled" value="사용가능" style="margin-left:2%;">
				                        </div>

		                        		<div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="userid" style="position:absolute; margin:2.5%;">아이디<span class="req">*</span></label>
					                        <input type="text" id="userid" name="userid" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" value="${Uauthuser.userid }" readonly="readonly"/>
				                        </div>
				                
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="phone" style="position:absolute; margin:2.5%;" >전화번호<span class="req">*</span></label>
					                 		<input type="text" id="phone" name="phone" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" 
					                 		placeholder="'-'없이 입력해주세요." value="${Uauthuser.phone }"/>
						                    <input type="button" id="goSMS" class="btn btn-light" value="본인인증" style="margin-left:2%;">
				                        </div>
				                        
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="authNumber" style="position:absolute; margin:2.5%;" >인증번호<span class="req">*</span></label>
					                 		<input type="tel" id="authNumber" name="authNumber" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
					                 		<input type="hidden" id="authCode"/>
						                    <input type="button" id="confirmBnt" class="btn btn-light" value="인증확인" style="margin-left:2%; display:none;" >
						                    <input type="button" id="checkedauthNumber" class="btn btn-light disabled" value="확인완료" style="margin-left:2%;">
				                        </div>
		
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="password" style="position:absolute; margin:2.5%;">비밀번호<span class="req">*</span></label>
					                        <input type="password" id="password" name="password" onchange="isSame()" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;"
					                        placeholder="6~10로 입력하세요." value="${Uauthuser.password }"/>
				                        </div>
		
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="pcheckpassword" style="position:absolute; margin:2.5%;">비밀번호 확인<span class="req">*</span></label>
					                        <input type="password" id="pcheckpassword" name="pcheckpassword" onchange="isSame()" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" value="${Uauthuser.password }"/>
				                        </div>
				                        <span id="same"></span>
								
										<br>
		
				                        <div class="d-flex justify-content-center">
					                        <button type="submit"
					                            class="btn btn-outline-primary" style="margin-right:3%;">수정하기</button><button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#myModal">탈퇴하기</button>
				                        </div>
									</form>
									</div>
	                    	</div>
	                	</div>
	                	</div>
	            	</div>
	            </div>
	        </div>
	    </section>
	    <footer>
			<c:import url='/WEB-INF/views/includes/footer.jsp' />
		</footer>
	</div>
	
	<%--모달 --%>
	<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">회원탈퇴</h4>        
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        정말 회원 탈퇴를 하실건가요..?
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
       	 <form action="uretire" method="post">
	        <button type="submit" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
	        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
         </form>
      </div>

    </div>
  </div>
</div>
	
<script src="<c:url value='/resources/js/users/modifyuser.js'/>"></script>
<script src="<c:url value='/resources/js/users/validation.js'/>"></script>
</body>

</html>