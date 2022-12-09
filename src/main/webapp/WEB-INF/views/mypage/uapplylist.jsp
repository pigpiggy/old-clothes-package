<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자신청목록</title>
<link href="<c:url value="/resources/css/bmypage.css"/>" rel='stylesheet' />
<style>
.item{	
	width:100%;
}
#ucards{
	display: flex;    
    flex-wrap: wrap;
    justify-content: center;
}
.aindividualStatus {
    position: absolute;
    left: 51%;
    top: 27%;
    transform: translate(-50%, -50%);
    background: black;
    opacity: 0.4;
    color: white;
    width: 45%;
    text-align: center;
    font-size: 30px;
    line-height: 2;
    border-radius: 2px;
}
.applyList{
	position: relative;
    display: block;
}
</style>
</head>
<body>	
	<c:import url='/WEB-INF/views/mypage/usermypage.jsp' />
	<div class="my_Tab">
			<ul class="tabs">
				<li><a href ="/mypage/umypage/${users.userno }/sell">판매 상품</a></li>
				<li><a href ="/mypage/umypage/${users.userno }/buy">구매 상품</a></li>
				<li class="on"><a href ="/mypage/umypage/${users.userno }/apply">신청 목록</a></li>
				<li><a href ="/mypage/umypage/${users.userno }/review">거래 후기</a></li>
			</ul>
	</div>
	<div id="total" style="width:1000px; margin:0 auto;">
	<div id="ucards">
	<c:forEach var="wapply" items="${wapply }">	  
		<div class="applyList">
			<c:choose>	        
				<c:when test="${'신청중' != wapply.astatus}">
	          			<div class="aindividualStatus">${wapply.astatus }</div>
	          	</c:when>
	          	<c:when test="${wapply.astatus == '신청중'}">
	          			<div class="aindividualStatus">신청완료</div>
	          	</c:when>
			</c:choose>	          	
	            <div class="item" style="width:100%;">		            
	            <strong>[ ${wapply.bname } ]</strong>		
	            	<div class="title"></div>                                 		                
	                <div class="allapply" style="padding: 2%;">		                
	                    <div class="cont">	                    	
	                        <div class="aname"><p>${wapply.aname }</p></div>
	                        <div class="aphone"><p>${wapply.aphone }</p></div>                        
	                        <div class="aadress"><p>${wapply.aaddress }</p></div>
	                        <div class="apickup"><p>${wapply.apickup }</p></div>                                          
	                        <div class="wei">
	                            <div class="weight"><p>${wapply.weight }</p></div>                        
	                        	<p>kg</p>
	                        </div>		                    
	                     </div>
	                    <c:choose>                     
	                    <c:when test="${wapply.astatus eq '신청중' }">
		                     <div class="btn">
		                        <input type="hidden" id="userno" name="userno" value="${wapply.userno }">             	                    			                    		                      
	                   			<input type="hidden" id="ano" name="ano" value="${wapply.ano }">										
		                        <button type="button" id="apply_close_btn" name="cancel" data-abtn2="${wapply.userno }" data-abtn3="${wapply.ano }">신청취소</button>
		                    </div>
	                    </c:when>
	                    <c:when test="${wapply.astatus eq '신청완료' }">
		                    <div class="btn">	                        
		                        <button type="submit" form="form" id="applying" disabled >수거대기</button>
		                    </div>                   
	                    </c:when>	                    
		                    
	                    </c:choose>
	                    <c:choose> 
	                    <c:when test="${wapply.astatus eq '수거완료' }">
			                    <div class="btn">	                        
			                        <button type="submit" form="form" id="applying">수거완료</button>
			                    </div>                   
		                 </c:when>
		                 <c:otherwise>
		                 	<c:if test="${wapply.astatus eq '신청거절' }">

							</c:if>
		                 </c:otherwise>	
		                 </c:choose> 
	                 </div>		               	            
	        </div>		        
	    </div>	 
	</c:forEach>	 
</div>
	
    
    <ul class="pagination">
		<c:choose>
			<c:when test="${pageInfo.page<=1}">
				<li><a id="prev"><<</a></li>
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
				<li><a id="next">>></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="freeList?page=${pageInfo.page+1}" id="next">>></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
    </div>
	
	<script>
	var cano;
	var cuserno;
	//수거 거절
	$('[name=cancel]').click(function(e){ //수거승인 등록 버튼 클릭시 		 
		 var targetElement = e.target;		 
		 cuserno = targetElement.getAttribute("data-abtn2");
		 cano = targetElement.getAttribute("data-abtn3");		 
		 console.log("cuserno : " + cuserno);
		 console.log("cano : " + cano);
	     wapplydelete(); //삭제함수 호출
	});
  	
	
	function wapplydelete(){		
		 console.log("신청 취소");		 
		    $.ajax({
		        url : '/wapplydelete/'+cano+'/'+cuserno,
		        type : 'get',		        
		        success : function(data){		            		            
					alert(data);				
					location.reload();
		        },
		        error :function(){
		        	alert("수거 거절 오류");
		        }
		    });
		}
	
	</script>
</body>
</html>