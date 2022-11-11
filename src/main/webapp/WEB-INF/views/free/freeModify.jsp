<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판 글수정</title>
    <link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<<<<<<< HEAD
	<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />  
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script	src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
	
=======
	<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />
		<script src="https://cdn.ckeditor.com/ckeditor5/35.3.0/classic/ckeditor.js"></script>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		ClassicEditor.create(document.querySelector("#editor1"),{
			ckfinder : {
				uploadUrl:"/upload"
			}
		}).then(editor=> {
			editor.setData('${fcontent}');
			window.editor=editor;
		}).catch((error)=> {
			console.error(error);
		})
	});
</script>
	    
>>>>>>> 959769eeb82c580b58d37fe86d17b68a8cb87952
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	
    <div class="board_wrap">
        <div class="board_title">
            <strong>글 수정</strong>
        </div>
        <form action="/freeupdate" method="post">
        <input type="hidden" name="fno" value="${free.fno }">
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
<<<<<<< HEAD
                        <dd><input type="text" name="ftitle" placeholder='${article.ftitle}'></dd>
                    </dl>
                </div>               
                <div class="cont">
                 <textarea id="editor" name="fcontent"></textarea>
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
                </div>
            </div>
            <div class="bt_wrap">
                <input id="input3" type="submit" value="수정">
                <a href="freeList">취소</a>
=======
                        <dd><input type="text" name="ftitle" placeholder="제목 입력"></dd>
                    </dl>
                </div>               
                <div class="cont">
                  	<textarea id="editor1" name="fcontent"></textarea><br>
                </div>
            </div>
            <div class="bt_wrap">
                <input type="submit" value="수정">
                <a href="/freeList">취소</a>
>>>>>>> 959769eeb82c580b58d37fe86d17b68a8cb87952
            </div>
        </div>
        </form>
    </div>
    
</body>
</html>