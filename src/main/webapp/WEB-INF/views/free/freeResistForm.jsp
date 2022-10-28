<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/35.2.0/classic/ckeditor.js"></script>
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
</script>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 등록</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>

</head>
<body>

	<!--  CKEDITOR.instance.content.getData() -->
<form action="/write" method="post">
<div>제목<input name="title" id="title" size="80">
		</div>
		<br>
<textarea id="editor" name="content"></textarea>
<input type="submit" value="전송">
</form>

</body>


</html>