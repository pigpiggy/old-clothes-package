<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<head>
<meta charset="UTF-8">
<title>무료나눔 상품 등록</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sharing.css"/>" rel='stylesheet' />
</head>
<body>
	<div id="wrap">
		<header>
			<c:import url='/WEB-INF/views/includes/header.jsp' />
		</header>
		<div class="container">
			<h1>상품등록</h1>
			<form action="sharingRegist" method="post" name="writeForm" 
			enctype="multipart/form-data" accept="image/*" onsubmit="return valid();">
				<div>
					<input type="text" class="form-control" placeholder="제목" id="title" name="stitle">
				</div>
				<br>
				<div id="dealcontainer">
					<div class="form-group">
						<select class="form-control" name="sdealType" id="sel1">
							<option>직거래</option>
							<option>택배거래</option>
							<option>모두가능</option>
						</select> <br>
						<div id="dealarea">
							<span class="sellfont">거래지역:</span> 
							<input class="postarea" id="member_post" type="text" placeholder="주소검색" readonly onclick="findAddr()"> 
							<input class="postarea" name="saddress" id="saddress" type="text" placeholder="'동'을 입력하세요." readonly><br> 
						</div>
					</div>
	
					<div id="priceAndAI">
						<input type="text" class="form-control" placeholder="가격: 0원" id="price" disabled /> 
					</div>
				</div>
	
				<div class="form-group">
					<textarea class="form-control" rows="12" id="scontent" name="scontent"></textarea>
				</div>
				<input type="file" multiple="multiple" name="simageFile" id="image" title="한 번에 최대 5개까지 선택가능"
					onchange="addFile(this);" />
				<div id=imglist class="filebox"></div>
				<div id="btncontainer">
					<a href="sharingList">
						<button type="button" class="btn btn-info">목록으로</button>
					</a> 
					<input type="submit" id="uploadBtn" class="btn btn-warning" value="등록">
				</div>
			</form>
		</div>
<%-- 		<footer>
			<c:import url='/WEB-INF/views/includes/footer.jsp' />
		</footer>
 --%>	</div>
		<script>
		/* 파일 선택 - 미리보기 */
		$(function() { 
			$('#image').change(function(event) { //input id = file 
				$('#imglist').empty();
				for(let i=0; i<event.target.files.length; i++) {
					let img = $('<img id="rep'+i+'" src="" width="100px" height="100px"/>');
					let reader = new FileReader();
					reader.onload = function(e) { //읽어오는 시점에 맞춰서 이미지에 저장
						img.attr('src', e.target.result); //읽어들인 데이터를 attribute에 저장
					}
					reader.readAsDataURL(event.target.files[i]); //0번째 파일을 읽어라
					$('#imglist').append(img);
				}
			});
		})
		
		var fileNo = 0;
		var filesArr = new Array();		
	
		/* 첨부파일 추가 */
		function addFile(obj){
	    	var maxFileCnt = 6;   // 첨부파일 최대 개수
	    	var attFileCnt = document.querySelectorAll('#imglist').length;    // 기존 추가된 첨부파일 개수
	    	var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
	    	var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
	
	        // 첨부파일 개수 확인
	    	if (curFileCnt > remainFileCnt) {
	        	alert("첨부파일은 최대 " + 5 + "개 까지 첨부 가능합니다.");
	    		} else {
	        		for (const file of obj.files) {// 첨부파일 검증
	            		if (validation(file)) {// 파일 배열에 담기
	                		var reader = new FileReader();
	                		reader.onload = function () {
	                    	filesArr.push(file);
	                		};
	                	reader.readAsDataURL(file);
	
	                // 목록 추가
	                let htmlData = '';
	                htmlData += '<div id="file' + fileNo + '" class="filebox">';
	                htmlData += '   <p class="name">' + file.name + '</p>';
	                htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
	                htmlData += '</div>';
	                $('#imglist').append(htmlData);
	                fileNo++;
	            		} else {
	                		continue;
	            		}
	        		}
	    		}
	   // 초기화
	    	document.querySelector("input[type=file]").value = "";
		}
	
		/* 유효성 검사 */
		function valid() {
			var titleCheck = document.getElementById("title");
			var addCheck = document.getElementById("member_post");
			var contentCheck = document.getElementById("scontent");
			
			if(titleCheck.value == "") {
				alert("제목을 입력해주세요.");
				return false;
			}
			
			if(addCheck.value == "") {
				alert("주소를 입력해주세요.");
				return false;
			}
			
			
			if(contentCheck.value == "") {
				alert("내용을 입력해주세요.");
				return false;
			}
		}
		
		/* 주소 검색 */
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress;
            document.getElementById('member_post').value = data.zonecode;
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
           
          	if(jibunAddr !== '') {
                document.getElementById("saddress").value = jibunAddr;
            } else {
                document.getElementById("saddress").value = roadAddr;
            } 
         
        }
    }).open();
}
			
		</script>
</body>
</html>