$(function () {
	/* 쪽지함 위 nav 숨김 */
	$(".my_Tab").hide();
	
	
	/*var sect = $("#recv option:selected").val();
		console.log(sect);
		if(sect == "receive") {
			$("#sendtable").css('display','none');
			$("#recvtable").css('display','table');
			
		} else {
			$("#recvtable").css('display','none');
			$("#sendtable").css('display','table');
		}*/
		
	/*$("#recv").change(function() {
		var sect = $("#recv option:selected").val();
		console.log(sect);
		if(sect == "receive") {
			$("#sendtable").css('display','none');
			$("#recvtable").css('display','table');
			
		} else {
			$("#recvtable").css('display','none');
			$("#sendtable").css('display','table');
		}
	})*/
	
	/* 전체 선택 */
	$("#checkhead").change(function() {
		console.log("answkd");
		if($("#checkhead").is(":checked")) {
			$("input:checkbox").prop("checked", true);
		} else {
			$("input:checkbox").prop("checked", false);
		}
	})

	$("#checkhead2").change(function() {
		console.log("바꿔~");
		if($("#checkhead2").is(":checked")) {
			$("input:checkbox").prop("checked", true);
		} else {
			$("input:checkbox").prop("checked", false);
		}
	})
	
	/* 삭제 */
	$("#delete").click(function() {
		var recv = document.querySelectorAll('input[name="option1"]:checked');
		console.log(recv.length);
		var send = document.querySelectorAll('input[name="option2"]:checked');
		console.log(send.length);

		if(recv.length == 0) { //체크박스가 비어있으면
			alert("삭제할 항목을 선택해주세요.");
		} else if(send.length == 0) {
			alert("삭제할 항목을 선택해주세요.");
		} else {
			recv.forEach((el) => {
				console.log(el.parentElement.parentElement.querySelector('.mno').value);
				var mno = el.parentElement.parentElement.querySelector('.mno').value;
				$.ajax({
					type : "get",
					url : "/recvDelete",
					data : {mno:mno},
					success : function(data) {
						alert("삭제가 완료되었습니다.");
					},
					error : function(err) {
						console.log(err);
					}
				});
			})
			
			recv.forEach((el) => {
				console.log(el.parentElement.parentElement.querySelector('.mno').value);
				var mno = el.parentElement.parentElement.querySelector('.mno').value;
				$.ajax({
					type : "get",
					url : "/sendDelete",
					data : {mno:mno},
					success : function(data) {
						alert("삭제가 완료되었습니다.");
					},
					error : function(err) {
						console.log(err);
					}
				});
			})
		}
		
	})
	
	
})