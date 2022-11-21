<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<link href="<c:url value="/resources/css/message.css"/>" rel='stylesheet' />
	<link href="<c:url value="/resources/css/modal.css"/>" rel='stylesheet' />
</head>
<body>
    <div class="container">
    <h2>쪽지함</h2>
    <div id="demo-modal" class="modal">
      		<div class="modal__content">
      			<form action="smessage" method="post" id="messageform">
      				<input type="hidden" name="recvUserno" value="${uservo.userno }">
      				<h5>받는 사람: </h5> 
	      			<div>
		      			<label class="mcontext" for="mtitle">제목 </label>
		      			<input type="text" class="form-control" name="mtitle" id="mtitle" /><br>
	      			</div>
	      			<div>
		      			<label class="mcontext" for="mcontent">내용 </label>
		      			<textarea class="form-control" rows="3" cols="50" name="mcontent" id="mcontent"> </textarea><br>
	      			</div>
	      			<input type="submit" class="btn btn-warning center" value="보내기" />
      			</form>
				<a href="#" class="modal__close">&times;</a>
      		</div>
  		</div>
  		
        <div id="select">
            <div class="select">
            <select id="recv" name="sect">
            	<option value="receive">받은 쪽지</option>
            	<option value="send">보낸 쪽지</option>
            </select>
            </div>	
	        <div id="delete">
				<button type="button" class="btn btn-secondary" id="delete">삭제</button>
	        </div>
        </div>
        <%-- 받은쪽지함 --%>
        <table class="table table-hover" id="recvtable">
          <thead>
            <tr>
              <th>
                <input type="checkbox" class="form-check-input" id="checkhead" name="optionth" value="something" checked>
              </th>
              <th>보낸 사람</th>
              <th>제목</th>
              <th>날짜</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="recvmessage" items="${recvmessage }">
            <tr>
              <td class="checkbox">     
                <input type="checkbox" class="form-check-input" id="checkcontent" name="option1" value="something" checked>
	            <input type="hidden" name="mno" class="mno" value="${recvmessage.mno }" />
              </td>
              <td>${recvmessage.nickname}</td>
              <td>${recvmessage.mtitle }</td>
              <td>${recvmessage.regDate }
              <a href="#demo-modal">
		          <img src="/image/letter.png" id="letter_img" alt="쪽지">
		        </a>
              </td>
            </tr>
           </c:forEach>
          </tbody>
        </table>
        <%-- 보낸쪽지함 --%>
        <table class="table table-hover" id="sendtable">
          <thead>
            <tr>
              <th>
                <input type="checkbox" class="form-check-input" id="checkhead2" name="optionth" value="something" checked>
              </th>
              <th>받는 사람</th>
              <th>제목</th>
              <th>날짜</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="sendmessage" items="${sendmessage }">
            <tr>
              <td class="checkbox">     
                <input type="checkbox" class="form-check-input" id="checkcontent2" name="option2" value="something" checked>
                <input type="hidden" name="mno" value="${sendmessage.mno }" />
              </td>
              <td>${sendmessage.nickname}</td>
              <td>${sendmessage.mtitle }</td>
              <td>${sendmessage.regDate }</td>
            </tr>
           </c:forEach>
          </tbody>
        </table>
		<div class="center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pageInfo.page<=1}">
						<li id="prev"><a><<</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="freeList?page=${pageInfo.page-1}" id="prev"><<</a></li>&nbsp;
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${pageInfo.page==i }"><li><a class="active">${i }</a></li></c:when>
						<c:otherwise>
							<li><a href="freeList?page=${i}">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						<li id="next"><a>>></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="freeList?page=${pageInfo.page+1}" id="next">>></a></li>
					</c:otherwise>
				</c:choose>
			</ul>		
		</div>					      
      </div>
      <script src="<c:url value='/resources/js/free/paging.js'/>"></script>
      <script src="<c:url value='/resources/js/mypage/message.js'/>"></script>
</body>
</html>