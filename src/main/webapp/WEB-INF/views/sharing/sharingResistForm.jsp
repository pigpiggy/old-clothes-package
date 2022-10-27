<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
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
            <input type="text" class="form-control" id="usr" name="username">
        </div>
        <div id="imgcontainer">
           	
           	<input type = "file" name = "imageFile" id ="imageFile"/>
            <img src="welshcorgi1.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236"> 
        
            <textarea class="form-control" rows="5" id="comment"></textarea>
        
        </div>
    </form>
    </div>
</body>
</html>