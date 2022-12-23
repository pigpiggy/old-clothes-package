<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/static/css/bmypage.css"/>" rel='stylesheet' />

</head>
<body>
	<c:import url='/WEB-INF/views/mypage/mypage.jsp' />

<script src="<c:url value='/static/js/mypage/mypage.js'/>"></script>
</body>
</html>