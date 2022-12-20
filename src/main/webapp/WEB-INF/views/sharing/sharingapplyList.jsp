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
</head>
<body>
	<h2>구매신청목록</h2>
	<form action="/selectSharingApply" method="get">
		<ul>
			<c:forEach var="users" items="${users }">
				<li>${users.nickname }<input type="radio" name="list" value="${users.userno}"/><input type="hidden" name="userno" value="${users.userno}"/></li>
				<li>${users.joinDate }</li>
			</c:forEach>			        					
	 	</ul>
	 	<input type="hidden" name="sno" value="${sno }">
	 	<input type="submit" value="확인" class="submitButton"/>
 	</form>
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