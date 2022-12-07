<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<c:import url='/WEB-INF/views/mypage/mypage.jsp' />
	<div id="cate" class="select">
		<select id="catelist" onchange="catelist()">
			<option value="free">무료나눔</option>
			<option value="indi">개인판매</option>
			<option value="busi">업체판매</option>
		</select>
	</div>
	<div id="list" class="list" style="width:80%; padding:3%;">
		<c:forEach var="sharing" items="${sharing }">
			<div style="display:flex;width: 100%; height: 20%;">
				<div style="width: 15%; height: 40%;">
					<c:choose>
						<c:when test = "${empty sharing.sfileids }">
							<img src="/image/logo3.png" alt="로고" style="width:100%; height:100%">
						</c:when>
						<c:otherwise>
							<img src="/upload/${ sharing.sfileids}" alt="무료나눔 옷" style="width:100%; height:100%">
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<div>${sharing.stitle }</div>
					<div>${sharing.regDate }</div>
				</div>
				<div>삭제버튼 넣을것</div>
			</div>	
		</c:forEach>
	</div>	


<script>
function catelist(){
	let category = $("#catelist option:selected").val();
	
}


</script>


</body>
</html>