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
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


</script>
<style>
#timer{
	position: absolute;
    width: 8%;
    border:none;
    left:65%;
    top:48%;
}
#timer1{
	position: absolute;
    width: 8%;
    border:none;
    left:66%;
    top:44.5%;
}
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

.my_img {
	display:none;
	width:495px;
	height:400px;
}
.form-outline:hover .my_img {
    display: block;
}

#wrap{
	margin-top:5%;
	margin-bottom:35%;
}
 

 
</style>
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	<div id="wrap">
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
				                        	<input type="hidden" name="sect" value="users"/>
					                        <label class="form-label" for="nickname" style="position:absolute; margin:2.5%;" >닉네임<span class="req">*</span></label>
					                 		<input type="text" id="nickname" name="nickname" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;"/>
						                    <input type="button" id="nicknamecheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
						                    <input type="hidden" name="check_nick" id="check_nick" value=0>
						                    <input type="button" id="checkednickname" class="btn btn-light disabled" value="사용가능" style="margin-left:2%; display:none;">						                    
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
				                        </div>
				                
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="phone" style="position:absolute; margin:2.5%;" >전화번호<span class="req">*</span></label>
					                 		<input type="text" id="phone" name="phone" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" 
					                 		placeholder="'-'없이입력 ex)01012344321."/>
						                    <input type="button" id="goSMS" class="btn btn-light" value="본인인증" style="margin-left:2%;">
				                        </div>
				                        
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" id="authlabel" for="authNumber" style="position:absolute; margin:2.5%;" >인증번호<span class="req">*</span></label>
					                 		<input type="tel" id="authNumber" name="authNumber" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
					                 		<input type="hidden" id="authCode"/>
					                 		<input type="text" id="timer" value="" readonly>
						                    <input type="button" id="confirmBnt" class="btn btn-light" value="인증확인" style="margin-left:2%;">
						                    <input type="button" id="checkedauthNumber" class="btn btn-light disabled" value="확인완료" style="margin-left:2%; display:none;">
				                        </div>
		
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="password" style="position:absolute; margin:2.5%;">비밀번호<span class="req">*</span></label>
					                        <input type="password" id="password" name="password" onchange="isSame()" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;"
					                        placeholder="10이하로 입력하세요."/>
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
											<input type="hidden" name="sect" value="business"/>
					                        <label class="form-label" for="bname" style="position:absolute; margin:2.5%;" >상호명<span class="req">*</span></label>
					                 		<input type="text" id="bname" name="bname" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" />
						                    <input type="button" id="brandnamecheck" class="btn btn-light" value="중복확인" style="margin-left:2%;">
						                    <input type="button" id="checkedbrandname" class="btn btn-light disabled" value="사용가능" style="margin-left:2%; display:none;">
			                        	</div>
			                        
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="bnumber" style="position:absolute; margin:2.5%;" >사업자 번호<span class="req">*</span></label>
					                 		<input type="text" id="bnumber" name="bnumber" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" 
					                 		placeholder="ex) 123-12-12345"/>
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
						                 		title="카카오톡채널상담에 필요하니, 카카오채널관리자 페이지에 나오는 아이디 입력 부탁드립니다." placeholder="카카오채널 ex)_Qpdel"/>					                 		
						                 		<img class="my_img" src="../../resources/image/kakaoid.png" title="카카오톡채널상담에 필요하니, 카카오채널관리자 페이지에 나오는 아이디 입력 부탁드립니다.">
					                 		</div>
				                        </div>
				                        
				                        
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="bphone" style="position:absolute; margin:2.5%;" >전화번호<span class="req">*</span></label>
					                 		<input type="text" id="bphone" name="bphone" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" 
					                 		placeholder="'-'없이입력 ex)01012344321"/>
						                    <input type="button" id="bgoSMS"class="btn btn-light" value="본인인증" style="margin-left:2%;" >
				                        </div>
				                        
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" id="bauthlabel" for="bauthNumber" style="position:absolute; margin:2.5%;" >인증번호<span class="req">*</span></label>
					                 	 	<input type="tel" id="bauthNumber" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 8rem;" />
					                 		<input type="hidden" id="bauthCode"/>
					                 		<input type="text" id="timer1" value="" readonly>
						                    <input type="button" id="bconfirmBnt" class="btn btn-light" value="인증확인" style="margin-left:2%;">
						                    <input type="button" id="bcheckedauthNumber" class="btn btn-light disabled" value="확인완료" style="margin-left:2%; display:none;">
				                        </div>
		
				                        <div class="form-outline mb-4" style="display:flex;">
					                        <label class="form-label" for="bpassword" style="position:absolute; margin:2.5%;">비밀번호<span class="req">*</span></label>
					                        <input type="password" id="bpassword" name="bpassword" onchange="isSame1()" class="form-control form-control-lg" style="padding:.5rem 1rem .5rem 7rem;" 
					                        placeholder="10이하로 입력하세요."/>
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
	<div>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
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
       <br>
<h4>제 1 조(목적)</h4>
<p>본 회원약관은 하우헌옷(이하 '갑'이라 한다)이 운영하는 인터넷관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 관리자와 이용자(이하 '회원'이라 한다)의 권리, 의무 및 책임사항을 규정함을 목적으로 한다.</p>
<br>
<h4>제 2 조 (약관의 효력)</h4>
<p>1. 본 약관은 '갑'에게 회원 가입 시 회원들에게 통지함으로써 효력을 발생한다.</p>
<p>2. '갑'은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생한다.</p>
<p>3. 약관의 변경사항 및 내용은 '갑'의 홈페이지에 게시하는 방법으로 공시한다.</p>
<br>
<h4>제3조 (약관 이외의 준칙)</h4>
<p>이 약관에 명시되지 않은 사항이 전기 통신 기본법, 전기통신 사업법, 기타 관련 법령에 규정되어 있는 경우 그 규정에 따른다.</p>
<br>
<h4>제 4 조 (이용계약의 체결)</h4>
<p>회원 가입 시 회원 약관 밑에 있는 동의버튼을 누르면 약관에 동의하여 이 계약이 체결된 것으로 간주한다.</p>
<br>
<h4>제 5 조 (용어의 정의)</h4>
<p>이 약관에서 사용하는 용어의 정의는 다음과 같다.</p>
<p>1. 회원: '갑'과 서비스 이용에 관한 계약을 체결한 자</p>
<p>2. 아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 '갑'이 승인하는 문자와 숫자의 조합</p>
<p>3. 비밀번호: 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합</p>
<br>
<h4>제 6 조 (이용신청)</h4>
<p>1. 회원 가입은 온라인으로 가입신청 양식에 기록하여 '갑'에 제출함으로써 이용신청을 할 수 있다.</p>
<br>
<h4>제 7 조 (회원가입의 승낙)</h4>
<p>'갑'의 회원 가입 신청 양식에 가입 희망 회원이 인터넷으로 제6조와 같이 신청하면 '갑'은 바로 가입을 승인하여 서비스를 이용할 수 있다.</p>
<br>
<h4>제 8 조(회원가입 신청거절 및 강제 탈퇴)</h4>
<p>1. '갑'은 타인의 명의나 주민등록번호를 도용하여 회원가입신청을 할 경우 회원가입신청을 거절할 수 있다.</p>
<p>2. 회원가입신청이 승인이 된 후에도 허위사실의 기재가 발각되거나 '갑'의 명예를 훼손시키거나 음란물이나 불건전한 내용을 게재할 경우 회원의 자격을 강제 탈퇴시킬 수 있다.</p>
<br>
<h4>제 9 조 (서비스 제공의 중지)</h4>
<p>'갑'은 다음 각 호의 1에 해당하는 경우 서비스의 제공을 중지할 수 있다.</p>
<p>1. 설비의 보수 등을 위하여 부득이한 경우 </p>
<p>2. 전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지하는 경우 </p>
<p>3. 기타 '갑'이 서비스를 제공할 수 없는 사유가 발생한 경우.</p>
<br>
<h4>제 10 조 ('갑'의 의무)</h4>
<p>1. '갑'은  계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 한다.</p>
<p>2. '갑'은 항상 회원의 신용정보를 포함한 개인신상정보의 보안에 대하여 관리에 만전을 기함으로서 회원의 정보보안에 최선을 다하여야 한다.</p>
<br>
<h4>제 11 조 (개인정보보호)</h4>
<p>1. '갑'은 이용자의 정보수집시 서비스의 제공에 필요한 최소한의 정보를 수집한다.</p> 
<p>2. 회원은 언제든지 '갑'이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 '갑'은 이에 대해 지체없이 처리한다.</p>
<br>
<h4>제 12 조 (회원의 의무)</h4>
<p>1. 회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 '갑'이 통지하는 사항을 준수하여야 하며, 기타 '갑'의 업무에 방해되는 행위를 하여서는 안된다.</p>
<p>2. 회원은 '갑'의 사전 승낙 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없다.</p>
<p>3. 회원은 서비스를 이용하여 얻은 정보를 '갑'의 사전 승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없다.</p>
<p>4. 회원은 이용신청서의 기재내용 중 변경된 내용이 있는 경우 서비스를 통하여 그 내용을 '갑'에게 통지하여야 한다.</p>
<p>5. 회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안된다.</p> 
	<p style="text-indent:8px;">①다른 회원의 아이디(ID)를 부정 사용하는 행위</p> 
	<p style="text-indent:8px;">②범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위</p> 
	<p style="text-indent:8px;">③선량한 풍속, 기타 사회질서를 해하는 행위</p>
	<p style="text-indent:8px;">④타인의 명예를 훼손하거나 모욕하는 행위</p>  
	<p style="text-indent:8px;">⑤타인의 지적재산권 등의 권리를 침해하는 행위</p> 
	<p style="text-indent:8px;">⑥해킹행위 또는 컴퓨터바이러스의 유포행위</p>  
	<p style="text-indent:8px;">⑦타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송 또는 타 사이트를 링크하는 행위</p> 
	<p style="text-indent:8px;">⑧서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위</p>
	<p style="text-indent:8px;">⑨기타 관계법령에 위배되는 행위</p>  
	<p style="text-indent:8px;">⑩게시판 등 커뮤니티를 통한 상업적 광고홍보 또는 상거래 행위</p>
<br>
<h4>제 13 조 (게시물 또는 내용물의 삭제)</h4> 
<p>'갑'은 서비스의 게시물 또는 내용물이 제12조의 규정에 위반되거나 '갑' 소정의 게시기간을 초과하는 경우 사전 통지나 동의 없이 이를 삭제할 수 있다.</p>
<br>
<h4>제 14 조 (게시물에 대한 권리·의무)</h4>
<p>게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있다.</p>
<br>
<h4>제 15 조 (양도금지)</h4>
<p>회원이 서비스의 이용권한, 기타 이용계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없다.</p>
<br>
<h4>제 16 조 (공개게시물의 삭제 또는 이용제한)</h4> 
<p>1. 회원의 공개게시물의 내용이 다음 각 호에 해당하는 경우 회사는 해당 공개게시물에 회원에게 사전 통지 없이 해당 공개게시물을 삭제 또는 변경할 수 있고, 해당 회원의 회원 자격을 제한, 정지 또는 상실시킬 수 있다.</p>
	<p style="text-indent:8px;">① 다른 회원 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용</p>
	<p style="text-indent:8px;">② 음란물, 욕설 등 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용</p>
	<p style="text-indent:8px;">③ 범죄행위와 관련이 있다고 판단되는 내용</p>
	<p style="text-indent:8px;">④ 다른 회원 또는 제3자의 저작권 등 기타 권리를 침해하는 내용</p>
	<p style="text-indent:8px;">⑤ 종교적, 정치적 분쟁을 야기하는 내용으로서, 이러한 분쟁으로 인하여 하우헌옷의 업무가 방해되거나 방해되리라고 판단되는 경우</p>
	<p style="text-indent:8px;">⑥ 타인의 개인정보, 사생활을 침해하거나 명예를 손상시키는 경우</p>
	<p style="text-indent:8px;">⑦ 동일한 내용을 중복하여 다수 게시하는 등 게시의 목적에 어긋나는 경우</p>
	<p style="text-indent:8px;">⑧ 불필요하거나 승인되지 않은 광고, 판촉물을 게재하는 경우</p>
	<p style="text-indent:8px;">⑨ 반복적인 내용이나 무의미한 도배성 행위</p>
<p>2. 회원의 공개게시물로 인한 법률상 이익 침해를 근거로, 다른 회원 또는 제3자가 회원 또는 회사를 대상으로 하여 민형사상의 법적 조치(예:고소, 가처분신청, 손해배상청구소송)를 취하는 동시에 법적 조치와 관련된 게시물의 삭제를 요청해오는 경우, 하우헌옷은 동 법적 조치의 결과(예: 검찰의 기소, 법원의 가처분결정, 손해배상판결)가 있을 때까지 관련 게시물에 대한 접근을 잠정적으로 제한할 수 있다.</p>
<p>3. 하우헌옷은 서비스 악용 방지를 위해 일부 게시물에 대해 수정 및 삭제 가능 여부를 제한할 수 있다.</p>
<br>
<h4>제 17 조 (면책·배상)</h4>
<p>1. '갑'은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고,  회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사 선택, 기타서비스 이용과 관련하여 어떠한 불이익이 발생 하더라도 이에 대한 모든 책임은 회원에게 있다.</p>
<p>2. '갑'은 제12조의 규정에 위반하여 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않는다. </p>
<p>3. 회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생 되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두 회원에게 있다.</p>
<p>4. 회원이 제12조, 기타 이 약관의 규정을 위반함으로 인하여 '갑'이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이로써 '갑'에게 손해가 발생하게 되는 경우, 이 약관을 위반한 회원은 '갑'에게  발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 '갑'을 면책시켜야 한다.</p>
<br>
<h4>제 18 조 (분쟁의 해결)</h4> 
<p>1. '갑'과 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다.</p>
<p>2. 1항의 규정에도 불구하고 분쟁으로 인하여 소송이 제기될 경우 소송은 '갑'의 소재지를 관할하는 법원의 관할로 한다.</p>
<br>
<h3>부  칙</h3>
<br>
<h4>제 1 조 (시행일)</h4> 
<p>이 약관은 2022년 12월 26일부터 시행한다.</p>      
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
<script>
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
<script src="<c:url value='/resources/js/users/join.js'/>"></script>
<script src="<c:url value='/resources/js/users/validation.js'/>"></script>
</body>

</html>