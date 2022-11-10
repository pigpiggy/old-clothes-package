/**
 * 
 */
 
  //업체 개인 radio버튼 체크씨 view전환
$(function(){
	$('#offlineview').hide();
	$('#onlineview').show();
	$('input[type="radio"][id="online"]').on('click', function(){
		var chkValue = $('input[type=radio][id="online"]:checked').val();
		if(chkValue){
			$('#offlineview').hide();
			$('#onlineview').show();
		}
	});
	$('input[type="radio"][id="offline"]').on('click', function(){
		var chkValue = $('input[type=radio][id="offline"]:checked').val();
		if(chkValue){
			$('#offlineview').show();
			$('#onlineview').hide();
		}
	});
});
