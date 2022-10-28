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
<script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/classic/ckeditor.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<head>
<meta charset="UTF-8">
<title>무료나눔 상품 등록</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sharing.css"/>" rel='stylesheet' />
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	<div class="container">
		<h1>상품등록</h1>
		<form action="sharingRegist" method="post" name="writeForm" enctype="multipart/form-data">
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
  					</select>
					<br>
					<div id="dealarea">
						거래지역: <input id="member_post" type="text" placeholder="주소검색" readonly onclick="findAddr()"> 
							<input name="jibunAddress" id="jibunAddress" type="text" placeholder="'동'을 입력하세요." readonly> <br>
					<input type="hidden" name="addressCity" id="jibun_si" />
					<input type="hidden" name="addressTown" id="jibun_dong" />
					
					</div>
				</div>
				
				<div id="priceAndAI">
					<input type="text" class="form-control" placeholder="가격: 0원" id="price" disabled />
					<span><a class="nav-link" href="#">AI 옷 상태 점검</a></span>
				</div>
			</div>
			
			<textarea name="scontent" id="editor"></textarea>
			<div id="btncontainer">
				<a href="sharingList">
					<button type="button" class="btn btn-info">목록으로</button>
				</a>
				<button type="submit" class="btn btn-warning">등록</button>
			</div>
		</form>
	</div>
	<script>
	$(function() {
		ClassicEditor.create(document.querySelector("#editor"), {
			ckfinder : {
				uploadUrl:"/upload"
			}
		}).then(editor=> {
			window.editor=editor;
		}).catch((error)=>{
			console.error(error);
		});
	});
		
		function findAddr() {
			new daum.Postcode(
					{
						oncomplete : function(data) {

							console.log(data);

							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var jibunAddr = data.jibunAddress; // 지번 주소 변수
							console.log(jibunAddr);
							let si = [];
							si = jibunAddr.split(" ")[0];
							console.log(si);
							let dong = jibunAddr.split(" ")[1].concat(" ",jibunAddr.split(" ")[2]);
							console.log(dong);
							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('member_post').value = data.zonecode;
							//document.getElementById("roadAddress").value = roadAddr;
			                document.getElementById("jibunAddress").value = data.jibunAddress;
			                document.getElementById("jibun_si").value = si;
			                document.getElementById("jibun_dong").value = dong;
			                console.log(si);
			                if (jibunAddr !== '') {
								document.getElementById("jibunAddress").value = jibunAddr;
							}
			                
			                //if (roadAddr !== '') {
								//document.getElementById("roadAddress").value = roadAddr;
							//} else if (jibunAddr !== '') {
								//document.getElementById("jibunAddress").value = jibunAddr;
							//}
						}
					}).open();
		}
		
		
	</script>

</body>
</html>