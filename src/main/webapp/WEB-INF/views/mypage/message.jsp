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
	<div>
		<c:import url='/WEB-INF/views/mypage/mypage.jsp' />
	</div>
    <div class="messageContainer">
    <h2><strong>쪽지함</strong></h2>
    <div id="demo-modal" class="modal">
      		<div class="modal__content" id="modal__content">
      			<form action="smessage" method="post" id="messageform">
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
                <input type="checkbox" class="form-check-input1" id="checkcontent" name="option1" value="something" checked>
	            <input type="hidden" name="mno" class="mno" value="${recvmessage.mno }" />
	            <input type="hidden" name="sendUserno" class="sendUserno" value="${recvmessage.sendUserno }" />
              </td>
              <td class="sendUser">${recvmessage.nickname}</td>
              <td class="mtitle">
              	<a href="#view-modal" class="view-modal">
              		${recvmessage.mtitle }
              	</a>	
              </td>
              <td>${recvmessage.regDate }
              <a href="#demo-modal">
		          <img src="/image/letter.png" id="letter_img" alt="쪽지" title="답장하기">
		      </a>
              </td>
            </tr>
           </c:forEach>
          </tbody>
        </table>
        <div id="view-modal" class="modal">
      		<div class="modalContent"></div>
  		</div>
        <%-- 보낸쪽지함 --%>
        <table class="table table-hover" id="sendtable">
          <thead>
            <tr>
              <th>
                <input type="checkbox" class="form-check-input" id="checkhead2" name="optionth" value="something" checked>
              </th>
              <th>받는 사람</th>
              <th >제목</th>
              <th>날짜</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach var="sendmessage" items="${sendmessage }">
            <tr>
              <td class="checkbox">     
                <input type="checkbox" class="form-check-input2" id="checkcontent2" name="option2" value="something" checked>
                <input type="hidden" name="mno" class="mno2" value="${sendmessage.mno }" />
              </td>
              <td>${sendmessage.nickname}</td>
              <td class="mtitle">
              	<a href="#view-modal2" class="view-modal2">
	              	${sendmessage.mtitle }
              	</a>
              </td>
              <td>${sendmessage.regDate }</td>
            </tr>
           </c:forEach>
          </tbody>
        </table>
        <div id="view-modal2" class="modal">
      		<div class="modalContent2"></div>
  		</div>
		<div class="center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${pageInfo.page<=1}">
						<li><a id="prev"><<</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="mypage/message?page=${pageInfo.page-1}" id="prev"><<</a></li>&nbsp;
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
					<c:choose>
						<c:when test="${pageInfo.page==i }"><li><a class="active">${i }</a></li></c:when>
						<c:otherwise>
							<li><a href="mypage/message?page=${i}">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${pageInfo.page>=pageInfo.maxPage }">
						<li><a id="next">>></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="mypage/message?page=${pageInfo.page+1}" id="next">>></a></li>
					</c:otherwise>
				</c:choose>
			</ul>		
		</div>					      
      </div>
      <script src="<c:url value='/resources/js/free/paging.js'/>"></script>
      <script src="<c:url value='/resources/js/mypage/message.js'/>"></script>
</body>
</html>