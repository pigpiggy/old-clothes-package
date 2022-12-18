<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>자유게시판 글수정</title>
<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
<script>	

</script>
</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>

	<div class="board_wrap">
		<div class="board_title">
			<strong>댓글 수정</strong>
		</div>
		<form action="/sharingcmtModify/${cmt.sno }" method="post">
			<input type="hidden" name="sno" value="${cmt.sno }" />						
			<input type="hidden" name="cno" value="${cmt.cno }" />
			  <div class="container">
					<div class="form-group">										
						<table class="table table-striped" style="position: relative;width: 1090px;left: 0%;text-align: center; border: 1px solid #dddddd">
							<tr>
								<td style="border-bottom:none;" valign="middle"><br><br><p id="cname" name="cname">${authUser.nickname }</p></td>
									<td><input type="text" style="position:relative;height:100px;width:900px;left:0%" class="form-control" name = "ccontent" value="${cmt.ccontent }"></td>
								<td><br><br><input type="submit" class="btn-primary pull" id="modbtn"value="수정완료"></td>
								<td><br><br><a href="/sharingView/${cmt.sno }"><button id="outbtn">취소</button></a></td>
							</tr>								
						</table>						
					</div>
				</div>
		</form>
	</div>

</body>
</html>