<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판 글수정</title>
<link href="<c:url value="/static/css/free.css"/>" rel='stylesheet' />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function() {
		ClassicEditor.create(document.querySelector("#editor"),{
			ckfinder : {
				uploadUrl:"/upload"
			}
		}).then(editor=> {
			editor.setData('${article.fcontent}');
			window.editor=editor;
		}).catch((error)=> {
			console.error(error);
		})
	});
	
	/*유효성검사*/
	 function valid() {
				
			if (window.editor.getData() == "") {  //then   window.editor = editor;
		        alert("내용을 입력해주세요");
		        window.editor.editing.view.focus();    
		        return false; 
		 	} 
	}
</script>
<style>

</style>
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>

	<div class="board_wrap">
		<div class="board_title">
			<strong>글 수정</strong>
		</div>
		<form action="/freeModify/${article.fno }" method="post" onsubmit="return valid();">
			<input type="hidden" name="fno" value="${article.fno }" />
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<dl class="dltitle">
							<dt class="dttitle">제목</dt>
							<dd class="ddtitle">
								<input type="text" name="ftitle" value="${article.ftitle}" required>
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea id="editor" name="fcontent" value="${article.fcontent}"></textarea>
					</div>
				</div>
				<div class="bt_wrap_regist">
					<input id="input1"  type="submit"  value="수정"> 
					<a id="input2" href="/freeList">취소</a>
				</div>
			</div>
		</form>
	</div>

</body>
</html>