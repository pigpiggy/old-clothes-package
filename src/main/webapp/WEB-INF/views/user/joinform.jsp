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
    <title>joinform</title>
    
     <!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
</script>
<style>

.req{
	color:red;
}
.my_img {
	display:none;
	width:495px;
	height:400px;
    
}

.form-outline:hover .my_img {
    display: block;
}
<!--카카오 ID 넣는 방법 설명[hover 순서 중요] 안 될시 req위로 display:block올리고 none 그 밑으로 올리고 왔다갔다하면 됩니다.. -->

#wrapper{
  height: auto;
  min-height: 100%;
  padding-bottom: 50px;
}

footer{
  height: 50px;
  position : relative;
  transform : translateY(-100%);
}

.my_img {
	display:none;
	width:495px;
	height:400px;
}
.form-outline:hover .my_img {
    display: block;
}
 

 
</style>
</head>
<body>
	<div id="wrapper">
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
	                    			<div class="form-radio" style="text-align:center;">
				                        <input type="radio" name="member_level" value="person" id="person" checked="checked" />
				                        <label for="person">개인</label>
										 &nbsp; &nbsp;
				                        <input type="radio" name="member_level" value="business" id="business" />
				                        <label for="business">사업자</label>
	                    			</div>
	                    			<br>
	                    			<%--개인 --%>
	                    			
									
									<div id=personalform>
									<form action="personnal" method="POST" onsubmit="return Validation();">
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="nickname" style="position:absolute; margin:2.5%;" >닉네임<span class="req">*</span></label>
					                 		<input type="text" id="nickname" name="nickname" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;"/>
						                    <input type="button" id="nicknamecheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
						                    <input type="hidden" name="check_nick" id="check_nick" value=0>
						                    <input type="button" id="checkednickname" class="btn btn-light disabled" value="사용가능" style="margin-left:2%; display:none;">
						                    <input type="button" id="checkednickname" class="btn btn-light disabled" value="확인완료" style="margin-left:2%; display:none;">
				                        </div>
		
										<%--[개인]이메일 form 
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="email" style="position:absolute; margin:2.5%;">이메일<span class="req">*</span></label>
					                        <input type="text" id="email" name="email" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;"/>
					                        <input type="button" id="emailcheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
					                        <input type="button" id="checkedemail" class="btn btn-light disabled" value="사용가능" style="margin-left:2%; display:none;">
				                        </div>
		                        		--%>
		                        		<div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="userid" style="position:absolute; margin:2.5%;">아이디<span class="req">*</span></label>
					                        <input type="text" id="userid" name="userid" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;"/>
					                        <input type="button" id="useridcheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
					                        <input type="button" id="checkeduserid" class="btn btn-light disabled" value="사용가능" style="margin-left:2%; display:none;">
					                        <input type="button" id="checkedemail" class="btn btn-light disabled" value="확인완료" style="margin-left:2%; display:none;">
				                        </div>
				                
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="phone" style="position:absolute; margin:2.5%;" >전화번호<span class="req">*</span></label>
					                 		<input type="text" id="phone" name="phone" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" 
					                 		placeholder="'-'없이 입력해주세요."/>
						                    <input type="button" id="goSMS" class="btn btn-light" value="본인인증" style="margin-left:2%;">
				                        </div>
				                        
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="authNumber" style="position:absolute; margin:2.5%;" >인증번호<span class="req">*</span></label>
					                 		<input type="tel" id="authNumber" name="authNumber" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
					                 		<input type="hidden" id="authCode"/>
						                    <input type="button" id="confirmBnt" class="btn btn-light" value="인증확인" style="margin-left:2%;">
						                    <input type="button" id="checkedauthNumber" class="btn btn-light disabled" value="확인완료" style="margin-left:2%; display:none;">
				                        </div>
		
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="password" style="position:absolute; margin:2.5%;">비밀번호<span class="req">*</span></label>
					                        <input type="password" id="password" name="password" onchange="isSame()" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;"
					                        placeholder="6~10로 입력하세요."/>
				                        </div>
		
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="pcheckpassword" style="position:absolute; margin:2.5%;">비밀번호 확인<span class="req">*</span></label>
					                        <input type="password" id="pcheckpassword" name="pcheckpassword" onchange="isSame()" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;"/>
				                        </div>
				                        <span id="same"></span>
								
										<br>
				                        <div class="form-check d-flex justify-content-center mb-5">
					                        <input class="form-check-input me-2" type="checkbox" value="" id="p_clause" />
					                        <label class="form-check-label" for="p_clause">
					                            <a href="#myModal" class="text-body" data-bs-toggle="modal" ><u>약관</u></a>에 동의합니다
					                        </label>
				                        </div>
		
				                        <div class="d-flex justify-content-center">
					                        <button type="submit"
					                            class="btn btn-outline-primary">가입하기</button>
				                        </div>
		
				                        <p class="text-center text-muted mt-5 mb-0">이미 계정이 있나요? <a href="login"
				                            class="fw-bold text-body"><u>로그인하기</u></a></p>
									</form>
									</div>
									
									<%--업체 --%>
									<div id=businessform>
									<form action="businesss" method="post" onsubmit="return Valid();">
										<div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="bname" style="position:absolute; margin:2.5%;" >상호명<span class="req">*</span></label>
					                 		<input type="text" id="bname" name="bname" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" />
						                    <input type="button" id="brandnamecheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
						                    <input type="button" id="checkedbrandname" class="btn btn-light disabled" value="사용가능" style="margin-left:2%; display:none;">
			                        	</div>
			                        
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="bnumber" style="position:absolute; margin:2.5%;" >사업자 번호<span class="req">*</span></label>
					                 		<input type="text" id="bnumber" name="bnumber" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" 
					                 		placeholder="'-'없이 입력해주세요."/>
				                        </div>
										<%--[업체]이메일
				                        <div class="form-outline mb-4" style="display:flex;">
			                       			<label class="form-label" for="b_email" style="position:absolute; margin:2.5%;">이메일<span class="req">*</span></label>
					                        <input type="email" id="b_email" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;"/>
					                        <input type="button" id="b_emailcheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
					                        <input type="button" id="b_checkedemail" class="btn btn-light disabled" value="확인완료" style="margin-left:2%; display:none;">
				                        </div>
				                         --%>
				                         
				                         <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="businessid" style="position:absolute; margin:2.5%;">아이디<span class="req">*</span></label>
					                        <input type="text" id="businessid" name="businessid" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;"/>
					                        <input type="button" id="b_businessidcheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
					                        <input type="button" id="b_checkedbusinessid" class="btn btn-light disabled" value="사용가능" style="margin-left:2%; display:none;">
				                        </div>
				                        
				                        <div class="form-outline mb-4" style="display:flex;" >
					                        <div>
						                        <label class="form-label" for="bkakaoid" style="position:absolute; margin:2.5%;" >카카오ID</label>
						                 		<input type="text" id="bkakaoid" name="bkakaoid" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" 
						                 		title="카카오톡채널상담에 필요하니, 카카오채널관리자 페이지에 나오는 아이디 입력 부탁드립니다." placeholder="카카오 ID(오픈채팅)"/>					                 		
						                 		<img class="my_img" src="../../resources/image/kakaopre.png" title="카카오톡채널상담에 필요하니, 카카오채널관리자 페이지에 나오는 아이디 입력 부탁드립니다.">
					                 		</div>
				                        </div>
				                        
				                        
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="bphone" style="position:absolute; margin:2.5%;" >전화번호<span class="req">*</span></label>
					                 		<input type="text" id="bphone" name="bphone" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" 
					                 		placeholder="'-'없어도 됩니다."/>
						                    <input type="button" id="bgoSMS"class="btn btn-light" value="본인인증" >
				                        </div>
				                        
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="bauthNumber" style="position:absolute; margin:2.5%;" >인증번호<span class="req">*</span></label>
					                 	 	<input type="tel" id="bauthNumber" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
					                 		<input type="hidden" id="bauthCode"/>
						                    <input type="button" id="bconfirmBnt" class="btn btn-light" value="인증확인" style="margin-left:2%;">
						                    <input type="button" id="bcheckedauthNumber" class="btn btn-light disabled" value="확인완료" style="margin-left:2%; display:none;">
				                        </div>
		
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="bpassword" style="position:absolute; margin:2.5%;">비밀번호<span class="req">*</span></label>
					                        <input type="password" id="bpassword" name="bpassword" onchange="isSame1()" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" 
					                        placeholder="6~10로 입력하세요."/>
				                        </div>
		
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="b_checkpassword" style="position:absolute; margin:2.5%;">비밀번호 확인<span class="req">*</span></label>
					                        <input type="password" id="b_checkpassword" onchange="isSame1()"  class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" "/>
				                        </div>
				                        <span id="same1"></span>
	
				                        <div class="form-outline mb-4" >
				                        	<div style="display:flex;">
						                        <label class="form-label" for="baddress" style="margin:2.5%; float:left;" >주소<span class="req">*</span></label>
						                        <div style="display:flex;">
						                        	<input type="button" class="btn btn-light btn-sm" value="우편번호 검색" readonly onclick="findAddr()">
						                        </div>
					                       	</div>
					                       	<div>
						                    	<label class="form-label" for="baddress" style="margin:2%;">[도로명]주소</label>
						                 		<input type="text" id="baddress" name="baddress" class="form-control form-control-lg" readonly
						                 		placeholder="도로명 주소 선택해주세요."/>
						                 		<label class="form-label" for="bdetailadd"style="margin:2%;">상세주소</label>
						                 		<input type="text" id="bdetailadd" name="bdetailadd" class="form-control form-control-lg" placeholder="ex)101호"/>
					                 		</div>
										</div>
										<br>
				                        <div class="form-check d-flex justify-content-center mb-5">
					                        <input class="form-check-input me-2" type="checkbox" value="" id="b_clause" />
					                        <label class="form-check-label" for="b_clause">
					                            <a href="#myModal" class="text-body" data-bs-toggle="modal" ><u>약관</u></a>에 동의합니다
					                        </label>
				                        </div>
		
				                        <div class="d-flex justify-content-center">
					                        <button type="submit"
					                            class="btn btn-outline-primary">가입하기</button>
				                        </div>
		
				                        <p class="text-center text-muted mt-5 mb-0">이미 계정이 있나요? <a href="login"
				                            class="fw-bold text-body"><u>로그인하기</u></a></p>
				                       </form>
									</div>
	                    	</div>
	                	</div>
	                	</div>
	            	</div>
	            </div>
	        </div>
	    </section>
	</div>
	<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">하우헌옷 이용약관</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
       <h3>Some text to enable scrolling..</h3>
        <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, 
        consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna 
        aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip 
        ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse 
        cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, 
        sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat 
        nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia 
        deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor 
        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

        <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
        Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat 
        nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia 
        deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor 
        incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud 
        exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p> 
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<script src="<c:url value='/resources/js/users/join.js'/>"></script>
<script src="<c:url value='/resources/js/users/validation.js'/>"></script>
</body>

</html>