
//신청서 유효성 검사
function Valids(){	
	//개인
	var check = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
	var regex = /[^0-9]/gi;
	var aname = document.getElementById("aname");//신청자 이름
	var aaddress = document.getElementById("aaddress")//신청자 주소
	var weight = document.getElementById("weight")//신청자 옷 무게	
	var aphone = document.getElementById("aphone")//신청자 전화 번호
	var apickup = document.getElementById("apickup")//신청자 희망 날짜 	
	if(aname.value==''){
		alert("이름을 입력해주세요.");
		return false;
	}
	
	
	if(aaddress.value==''){
		alert("주소를 입력해주세요.");
		return false;
	}
	
	if(weight.value==''){
		alert("무게를 입력해주세요.");
		return false;
	}
	/*if(regex.test(weight.value)){
		alert("숫자로 입력해주세요.");
		return false;
	}*/

	if(aphone.value==''){
		alert("전화번호를 입력해주세요.");
		return false;
	}
	if(!check.test(aphone.value)){
		
		alert("번호를 제대로 입력해주세요.");
		return false;
	}
	
	if(apickup.value==''){
		alert("희망날짜를 입력해주세요.");
		return false;
	}
	
	
}




