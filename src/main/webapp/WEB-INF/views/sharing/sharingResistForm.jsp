<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   <script src="https://code.jquery.com/jquery-latest.js"></script>
   <script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/classic/ckeditor.js"></script>
    
<head>
<meta charset="UTF-8">
<title>무료나눔 상품 등록</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
<link href="<c:url value="/resources/css/sharing.css"/>" rel='stylesheet'/>
</head>
<body>
<div>
	<c:import url='/WEB-INF/views/includes/header.jsp'/>
</div>
<div class="container"> 
    <h1>상품등록</h1>
    <form action="sharingResist" method="post" name = "writeForm" enctype="multipart/form-data">
       <div>           
         <input type="text" class="form-control" placeholder="제목" id="title" name="title">
       </div><br>
       <div id="dealcontainer">
        <div class="dropdown">
            <button type="button" class="btn dropdown-toggle" data-toggle="dropdown">
              거래 유형
            </button><br>
            <div class="dropdown-menu">
              <a class="dropdown-item" href="#">직거래</a>
              <a class="dropdown-item" href="#">택배거래</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">모두 가능</a>
            </div><br>
        </div>
        <div>거래지역: 
 		 <input id="member_post"  type="text" placeholder="Zip Code" readonly onclick="findAddr()">
 		 <input id="member_addr" type="text" placeholder="Address" readonly> <br>
  		 <input type="text" placeholder="Detailed Address">
            
            
        </div>
     </div>
        <textarea name="text" id="editor"></textarea>
        <p><input type="submit" value="전송"></p>
    </form>
    </div>   
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    ClassicEditor.create( document.querySelector( '#editor' ) );

		function findAddr(){
			new daum.Postcode({
        		oncomplete: function(data) {
        	
        		console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}
</script>

</body>
</html>