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
    width: 400px;
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
  opacity: 0;
  -webkit-animation: fade 2s 1.5s linear; 
  -webkit-animation-fill-mode: forwards;
}
#divider {
  width: 0px; height: 2px; 
  background: black;
  margin: -30px auto 0;
  opacity: 0;
  -webkit-animation: fade 1s 0.75s linear,
    						  stretch 1s 0.4s linear;
  -webkit-animation-fill-mode: forwards;  
  background: #ddd;
}

@-webkit-keyframes fade {
  from { opacity: 0; }
  to   { opacity: 1; }
}

@-webkit-keyframes up {
  0%    { margin-top: 90px; }
  60%   { margin-top: 30px; }
  70%   { margin-top: 25px;  }
  80%   { margin-top: 30px; }
  90%   { margin-top: 25px;  } 
  100%  { margin-top: 30px; }
}

@-webkit-keyframes stretch {
  from { width: 0px;   }
  to   { width: 185px; } 
}
li {
	list-style: none;
}
.submitButton {
	margin: 0 auto;
    display: flex;
}

/* 체크박스 */
[type="radio"] {
  border: 0; 
  clip: rect(0 0 0 0); 
  height: 1px; margin: -1px; 
  overflow: hidden; 
  padding: 0; 
  position: absolute; 
  width: 1px;
}

/* One radio button per line */
label {
  display: block;
  cursor: pointer;
  line-height: 2.5;
  font-size: 1.5em;
}

[type="radio"] + span {
  display: block;
}

/* the basic, unchecked style */
[type="radio"] + span:before {
  content: '';
  display: inline-block;
  width: 1em;
  height: 1em;
  vertical-align: -0.25em;
  border-radius: 1em;
  border: 0.125em solid #fff;
  box-shadow: 0 0 0 0.15em #000;
  margin-right: 0.75em;
  transition: 0.5s ease all;
}

/* the checked style using the :checked pseudo class */
[type="radio"]:checked + span:before {
  background: green;
  box-shadow: 0 0 0 0.25em #000;
}

/* never forget focus styling */
[type="radio"]:focus + span:after {
  content: '\0020\2190';
  font-size: 1.5em;
  line-height: 1;
  vertical-align: -0.125em;
}
</style>
</head>
<body>
<div id="applyListContainer">
	<form action="/selectSharingApply" method="get">
		<div id="applyList">
			<h2>구매 신청 목록</h2>
			<div id="divider"></div>
			<ul id="userInfo">
				<c:forEach var="users" items="${users }">
					<li class="nickDate" id="nickname" class="radio"><input type="radio" name="list" value="${users.userno}"/>${users.nickname }<input type="hidden" name="userno" value="${users.userno}"/></li>
					<li class="nickDate" id="applyDate">${users.joinDate }</li>
				</c:forEach>			        					
		 	</ul>
	 		<input type="hidden" name="sno" value="${sno }">
	 	</div>
	 	<input type="submit" value="확인" class="submitButton"/>
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
 	</script>
</body>
</html>