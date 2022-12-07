<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	<input type=checkbox>


<script>
function catelist(){
	let category = $("#catelist option:selected").val();
	
}


</script>


</body>
</html>