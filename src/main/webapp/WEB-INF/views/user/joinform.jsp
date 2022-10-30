<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
  <script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
//인증번호 5자리 번호 = 전송
$(function(){
	
	let userPhoneNum;
	let authCode= $('#authCode');
		
	$(document).on('click','#goSMS', function () {		// 버튼을 클릭 했을 경우
		let userPhoneNum = $('#userPhoneNum').val();	// 사용자가 입력한 전화번호
		let authCode= $("#authCode");	//휴대폰 인증번호 담을 변수
	
		// 사용자가 입력한 전화번호가 공백이 아니고, 8자리 이상일 경우
		if (userPhoneNum != '' && userPhoneNum.length > 8) {
			$.ajax({
				url: '/main/execute',	// 요청보낼 url
				method: 'get',
				data: {'userPhoneNum': userPhoneNum},	// 사용자가 입력한 휴대폰번호 전송
				success: function (response) {
					authCode.attr('value', response);	// authCode의 속성 value값을 인증번호로 설정
					console.log("input태그에 담긴 인증번호: " + authCode.val());	// 확인용
	
					alert('인증 번호가 발송 되었습니다.');
				
				},
				error: function(response) {
					alert('인증번호 발송에 실패하였습니다.\n잠시 후 다시 시도해주시기 바랍니다.')
				}
			});
		}else{
			alert("휴대폰 번호를 입력 해 주세요");
		}
	});


	//인증번호 확인
	$(document).on('click', '#confirmBnt', function () {
			// 인증번호가 공백이 아니고 0 이상일 경우
			console.log("text에 사용자가 입력한 인증 번호 : " + authNumber.value);
			console.log("coolsms에서 받아온 인증 번호 : " + authCode.val());
			if (authNumber.value!='' && parseInt(authNumber.value)>0) {	// val()로 받으면 문자열이기 때문에 형변환
				if(authNumber.value == authCode.val()){
					cnfCheck = true;
					alert('휴대폰 번호 인증이 완료되었습니다. 감사합니다.');
				} else {
					alert('인증번호가 일치하지 않습니다.');
				}
				// 인증번호를 입력하지 않았을 경우
			}else{alert("인증번호를 입력 해 주세요"); cnfCheck = false;}
		});

})

//닉네임 중복확인
$(function(){
	$('#checkname').click(function(){
		var checknick =$('#checknick').val(); //사용자가 입력한 id값 
		
		$.ajax({
			type : "post",
			url : "http://localhost:8090/checknick",
			data : {checknick:checknick},
			success:function(data,textStatus){
				if(data=="true"){
					alert("이미 사용중인 닉네임입니다.");
				}else if(checknick==''){
					alert("닉네임을 입력해주세요");
				}else{
					alert("사용이 가능한 닉네임입니다.");
				}
			}
		})
	});
});

//이메일 중복확인
$(function(){
	$('#emailcheck').click(function(){
		var checkemail =$('#checkemail').val();
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		console.log(checkemail.value);
		$.ajax({
			type : "post",
			url : "http://localhost:8090/checkemail",
			data : {checkemail:checkemail},
			success:function(data,textStatus){
				if(data=="true"){
					alert("이미 사용중인 이메일입니다");
				}else if (checkemail==''){
					alert("이메일을 입력해주세요");
				}else if(exptext.test(checkemail)==false){
					alert("이메일 형식이 올바르지 않습니다.");	
				}else{
					alert("사용 가능한 이메일 입니다.");
				}
			}
		})
	});
});


</script>
</head>
<body>
<div class="line_inp">
	<p class="form_title">휴대폰 번호</p>
	<input type="tel" class="inp" id="userPhoneNum" name="userPhoneNum" placeholder=" - 없이 입력"/>
	<input type="button" class="half_button" id="goSMS" value="SMS 전송" />
</div>
<div class="line_inp confirmDiv">
	<p class="form_title">인증번호</p>
	<input class="inp" id="authNumber" type="tel" placeholder="인증번호 5자리를 입력"/>
	<input type="hidden" id="authCode"/>
	<input type="button" class="half_button" id="confirmBnt" value="인증" />
</div>
<div>
	<input type="text" name="checknick" id="checknick">
	<input type="button" value="닉네임 중복 확인" id="checkname">
</div>

<div>
	<input type="email" name="checkemail" id="checkemail" placeholder="test@naver.com">
	<input type="button" value="이메일 중복 확인" id="emailcheck">
</div>


</body>
</html>