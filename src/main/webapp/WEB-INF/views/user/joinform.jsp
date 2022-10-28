<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
  <script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
//인증번호 전송
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
		if (authNumber != '' && parseInt(authNumber) > 0) {	// val()로 받으면 문자열이기 때문에 형변환
			if(authNumber == authCode){
				cnfCheck = true;
				alert('휴대폰 번호 인증이 완료되었습니다. 감사합니다.');
			} else {
				alert('인증번호가 일치하지 않습니다.');
			}
			// 인증번호를 입력하지 않았을 경우
		}else{alert("인증번호를 입력 해 주세요"); cnfCheck = false;}
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
	<input class="inp" id="authNumber" type="tel" placeholder="SMS로 수신된 인증번호 5자리를 입력해주세요"/>
	<input type="hidden" id="authCode"/>
	<input type="button" class="half_button" id="confirmBnt" value="인증" />
</div>

</body>
</html>