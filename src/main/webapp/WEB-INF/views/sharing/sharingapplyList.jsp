<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매신청목록</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
html {
	background-color: lightblue;
}
#applyListContainer {
    background-color: white;
    border-radius: 18px;
    width: 350px;
    height: 500px;
    display: flex;
    justify-content: center;
    margin: 13% auto 15%;
    box-shadow: 15px 15px 15px lightslategrey;
}
h2 {
  font-size: 2em;
  text-align: center;
  margin-top: 15px;
  padding: 10px;

}
#divider {
  width: 230px; 
  height: 2px; 
  background: black;
  margin: -30px auto 0;
  background: #ddd;
}

li {
	list-style: none;
}
.buttoncontent {
    width: 6em;
    height: 2.5em;
    border: none;
    background: #5bc1ac;
    color: #fff;
    text-decoration: none;
    border-radius: 9px;
    font-size: 1em;
    margin: 0 auto;
    display: block;
    position: absolute;
    bottom: 34px;
    left: 50%;
    transform: translateX(-50%);
}

/* 체크박스 */
[type="radio"]:checked,
[type="radio"]:not(:checked) {
    position: absolute;
    left: -9999px;
}
[type="radio"]:checked + label,
[type="radio"]:not(:checked) + label
{
    position: relative;
    padding-left: 28px;
    cursor: pointer;
    line-height: 20px;
    display: inline-block;
    color: #666;
}
[type="radio"]:checked + label:before,
[type="radio"]:not(:checked) + label:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    width: 18px;
    height: 18px;
    border: 1px solid #ddd;
    border-radius: 100%;
    background: #fff;
}
[type="radio"]:checked + label:after,
[type="radio"]:not(:checked) + label:after {
    content: '';
    width: 12px;
    height: 12px;
    background: #F87DA9;
    position: absolute;
    top: 4px;
    left: 4px;
    border-radius: 100%;
    -webkit-transition: all 0.2s ease;
    transition: all 0.2s ease;
}
[type="radio"]:not(:checked) + label:after {
    opacity: 0;
    -webkit-transform: scale(0);
    transform: scale(0);
}
[type="radio"]:checked + label:after {
    opacity: 1;
    -webkit-transform: scale(1);
    transform: scale(1);
}
#userInfo {
	padding: 0;
    width: 100%;
}
#nickname {
	font-size: 16px;
	font-weight: bold;
	margin-bottom: 4px;
}
#applyDate {
	color: gray;
}
#liContainer {
    border-bottom: 1px solid #ddd;
    margin-bottom: 12px;
    padding-bottom: 7px;
}
</style>
</head>
<body>
<div id="applyListContainer">
	<form action="/selectSharingApply" method="get" style="position:relative;">
		<div id="applyList">
			<h2>구매 신청 목록</h2>
			<ul id="userInfo">
				<c:forEach var="users" items="${users }" varStatus="status">
					<div id="liContainer">
						<li class="nickDate" id="nickname" class="radio"><input type="radio" name="radio-group" id="test${status.index }" value="${users.userno}"/><label for="test${status.index }">${users.nickname }</label><input type="hidden" name="userno" value="${users.userno}"/></li>
						<li class="nickDate" id="applyDate">${users.joinDate }</li>
					</div>	
				</c:forEach>			        					
		 	</ul>
	 		<input type="hidden" name="sno" value="${sno }">
	 	</div>
	 	<input type="submit" value="확인" class="submitButton buttoncontent"/>
 	</form>
</div> 	
 	<script>
	 	/* 신청확인 버튼 비활성화 */
	 	var sstatus = "${sharing.sstatus}";
	 	if(sstatus != '등록완료'){
	 		$('.submitButton').attr("disabled", true);
	 	} else {
	 		if(${fn:length(users) } == 0){
	 			$('.submitButton').attr("disabled", true);
	 		}
	 	}
	 	
	 	$('.submitButton').click(function(){
	          alert('신청이 완료되었습니다.');
	          opener.parent.location.reload();
	       });
 	</script>
</body>
</html>