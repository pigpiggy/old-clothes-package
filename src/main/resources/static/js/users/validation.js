
//회원가입 유효성 검사
function Validation(){
	//[개인]
	var pcheck = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	var PPwd = document.getElementById("password");//비밀번호[개인]
	var PPwd1 = document.getElementById("pcheckpassword")//비밀번호[개인]
	var PAgree = document.getElementById("p_clause")//동의[업체]
	var Pphone = document.getElementById("phone");//전화번호
	if($('#checkednickname').css("display")=="none"){
		alert("닉네임 중복확인 확인부탁드립니다.");
		return false;
	}
	 
	if($('#checkeduserid').css("display")=="none"){
		alert("아이디 중복확인 확인부탁드립니다.");
		return false;
	}
	
	if(!pcheck.test(Pphone.value)){
		alert("전화번호를 예시에 맞게 입력해주세요.");
		return false;
	}
	
	if($('#checkedauthNumber').css("display")=="none"){
	      alert("본인 인증 완료해주세요.");
	      return false;
	}
	
	if(PPwd.value==''){
		alert("비밀 번호를 입력해주세요.");
		return false;
	}

	if(PPwd1.value==''){
		alert("비밀번호일치 확인해주세요.");
		return false;
	}

	if( PPwd.value != PPwd1.value){
		alert("비밀번호가 일치하지 않습니다!!")
		return false;
	}
	
	if(PPwd.value.length >= 10){
	   alert("비밀번호가 길어요.");
	   return false;
	}

	if(PAgree.checked==false){
		alert("약관 동의 체크해주세요.");
		return false;
	}

}	

function Valid(){

	//[업체]
	var BPwd = document.getElementById("bpassword");//비밀번호[업체]
	var BPwd1 = document.getElementById("b_checkpassword")//비밀번호일치[업체]]
	var BNumber = document.getElementById("bnumber")//사업자 번호[업체]]
	//var BKaokao = document.getElementById("bkakaoid")//카카오[업체]]
	var BAddress = document.getElementById("baddress")//주소[업체]]
	var BDetailadd = document.getElementById("bdetailadd")//상세주소[업체]
	var BAgree = document.getElementById("b_clause")//동의[업체]
	var BPhone = document.getElementById("bphone");//전화번호[업체]
	var Bcheck = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	if(BNumber.value==''){
		alert("사업자 번호를 입력해주세요.");
		return false;
	}
	
	if($('#b_checkedbusinessid').css("display")=="none"){
		alert("아이디 중복확인 확인부탁드립니다.");
		return false;
	}
	/*if(BKaokao.value==''){
		alert("카카오 아이디를 입력해주세요.");
		return false;
	}*/
	
	
	if($('#checkedbrandname').css("display")=="none"){
		alert("상호명 중복확인 확인부탁드립니다.");
		return false;
	}
	if(!Bcheck.test(BPhone.value)){
		alert("전화번호를 예시에 맞게 입력해주세요.");
		return false;
	}

	if($('#bcheckedauthNumber').css("display")=="none"){
	      alert("본인 인증 완료해주세요.");
	      return false;
	}
	
	if(BPwd.value==''){
		alert("비밀 번호를 입력해주세요.");
		return false;
	}

	if(BPwd1.value==''){
		alert("비밀번호일치 확인해주세요.");
		return false;
	}

	if( BPwd.value != BPwd1.value){
		alert("비밀번호가 일치하지 않습니다!!")
		return false;
	}
	if(BPwd.value.length >= 10){
	   alert("비밀번호가 길어요.");
	   return false;
	}

	
	
	if(BAddress.value=='' || BDetailadd.value==''){
		alert("주소를 정확하게 입력해주세요.");
		return false;
	}
	
	if(BAgree.checked==false){
		alert("약관 동의 체크해주세요.");
		return false;
	}
	
}