<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자신청목록</title>
<link href="<c:url value="/resources/css/bmypage.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/free.css"/>" rel='stylesheet' />
<style>
.center{
	position: relative;
}
.item{	
	width:100%;
}
#bcards{
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

.bapplyButtons {
	position: relative;
}

#bapplyListContainer {
	margin-bottom: 25%;
}
#bapplyPaging {
	margin-top: 10%;
}
#bapplying{
    position: relative;
    bottom: 208%;
    width: 6em;
    height: 2.5em;
    border: none;
    background: #5BC1AC;
    color: #fff;
    text-decoration: none;
    border-radius: 9px;
    font-size: 1em;
    /* margin: 3% 6%; */
    cursor: pointer;
}
#bapply_close_btn{
     width: 6em;
    height: 2.5em;
    border: none;
    background:  #B5AFAF;
    color: #fff;
    text-decoration: none;
    border-radius: 9px;
    font-size: 1em;
    margin: 5% 3%;
    cursor: pointer;
}
#bapplyend{
    position: relative;
    width: 6em;
    height: 2.5em;
    border: none;
    background: #5BC1AC;
    color: #fff;
    text-decoration: none;
    border-radius: 9px;
    font-size: 1em;
    margin-top: 10px;
    cursor: pointer;
}
/* Hover state animation applied here */
#bapplying:hover { 
  -webkit-animation: hover 1200ms linear 2 alternate;
  animation: hover 1200ms linear 2 alternate;
}
#bapply_close_btn:hover { 
  -webkit-animation: hover 1200ms linear 2 alternate;
  animation: hover 1200ms linear 2 alternate;
}
#bapplyend:hover { 
  -webkit-animation: hover 1200ms linear 2 alternate;
  animation: hover 1200ms linear 2 alternate;
}
/* Hover state animation keyframes below */
@keyframes hover { 
  0% { -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  1.8% { -webkit-transform: matrix3d(1.016, 0, 0, 0, 0, 1.037, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.016, 0, 0, 0, 0, 1.037, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  3.5% { -webkit-transform: matrix3d(1.033, 0, 0, 0, 0, 1.094, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.033, 0, 0, 0, 0, 1.094, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  4.7% { -webkit-transform: matrix3d(1.045, 0, 0, 0, 0, 1.129, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.045, 0, 0, 0, 0, 1.129, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  5.31% { -webkit-transform: matrix3d(1.051, 0, 0, 0, 0, 1.142, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.051, 0, 0, 0, 0, 1.142, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  7.01% { -webkit-transform: matrix3d(1.068, 0, 0, 0, 0, 1.158, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.068, 0, 0, 0, 0, 1.158, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  8.91% { -webkit-transform: matrix3d(1.084, 0, 0, 0, 0, 1.141, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.084, 0, 0, 0, 0, 1.141, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  9.41% { -webkit-transform: matrix3d(1.088, 0, 0, 0, 0, 1.132, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.088, 0, 0, 0, 0, 1.132, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  10.71% { -webkit-transform: matrix3d(1.097, 0, 0, 0, 0, 1.107, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.097, 0, 0, 0, 0, 1.107, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  12.61% { -webkit-transform: matrix3d(1.108, 0, 0, 0, 0, 1.077, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.108, 0, 0, 0, 0, 1.077, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  14.11% { -webkit-transform: matrix3d(1.114, 0, 0, 0, 0, 1.067, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.114, 0, 0, 0, 0, 1.067, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  14.41% { -webkit-transform: matrix3d(1.115, 0, 0, 0, 0, 1.067, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.115, 0, 0, 0, 0, 1.067, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  16.32% { -webkit-transform: matrix3d(1.119, 0, 0, 0, 0, 1.077, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.119, 0, 0, 0, 0, 1.077, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  18.12% { -webkit-transform: matrix3d(1.121, 0, 0, 0, 0, 1.096, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.121, 0, 0, 0, 0, 1.096, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  18.72% { -webkit-transform: matrix3d(1.121, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.121, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  20.02% { -webkit-transform: matrix3d(1.121, 0, 0, 0, 0, 1.113, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.121, 0, 0, 0, 0, 1.113, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  21.82% { -webkit-transform: matrix3d(1.119, 0, 0, 0, 0, 1.119, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.119, 0, 0, 0, 0, 1.119, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  24.32% { -webkit-transform: matrix3d(1.115, 0, 0, 0, 0, 1.11, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.115, 0, 0, 0, 0, 1.11, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  25.53% { -webkit-transform: matrix3d(1.113, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.113, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  29.23% { -webkit-transform: matrix3d(1.106, 0, 0, 0, 0, 1.089, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.106, 0, 0, 0, 0, 1.089, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  29.93% { -webkit-transform: matrix3d(1.105, 0, 0, 0, 0, 1.09, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.105, 0, 0, 0, 0, 1.09, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  35.54% { -webkit-transform: matrix3d(1.098, 0, 0, 0, 0, 1.105, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.098, 0, 0, 0, 0, 1.105, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  36.64% { -webkit-transform: matrix3d(1.097, 0, 0, 0, 0, 1.106, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.097, 0, 0, 0, 0, 1.106, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  41.04% { -webkit-transform: matrix3d(1.096, 0, 0, 0, 0, 1.099, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.096, 0, 0, 0, 0, 1.099, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  44.04% { -webkit-transform: matrix3d(1.096, 0, 0, 0, 0, 1.097, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.096, 0, 0, 0, 0, 1.097, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  51.45% { -webkit-transform: matrix3d(1.099, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.099, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  52.15% { -webkit-transform: matrix3d(1.099, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.099, 0, 0, 0, 0, 1.102, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  58.86% { -webkit-transform: matrix3d(1.101, 0, 0, 0, 0, 1.099, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.101, 0, 0, 0, 0, 1.099, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  63.26% { -webkit-transform: matrix3d(1.101, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.101, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  66.27% { -webkit-transform: matrix3d(1.101, 0, 0, 0, 0, 1.101, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.101, 0, 0, 0, 0, 1.101, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  73.77% { -webkit-transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  81.18% { -webkit-transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  85.49% { -webkit-transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  88.59% { -webkit-transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  96% { -webkit-transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  100% { -webkit-transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.1, 0, 0, 0, 0, 1.1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); } 
}
#btnAccept {
	height: auto;
    width: auto;
}
.btnBox {
	display: flex;
	justify-content: space-evenly;
	align-items: center;
	margin-top: -4px;
}
#btnComplete {
	display: flex;
	justify-content: center;
	align-items: center;	
}
#bapplying:active {
	border: none;
}
#bapplyend:active {
	border: none;
}
#btnComplete2:active {
	border: none;
}
</style>
</head>
<body>
	<c:import url='/WEB-INF/views/mypage/bmypage.jsp' />	
			<c:if test="${authUser.sect eq 'business' }">
			<c:if test="${authUser.bno eq business.bno }">
			<div class="my_Tab">
					<ul class="tabs">
						<li class="on"><a href ="/mypage/bmypage/${business.bno }/apply">신청 목록</a></li>				
						<li><a href ="/mypage/bmypage/${business.bno }/review">거래 후기</a></li>
					</ul>			
			</div>
			</c:if>
			</c:if>
<div id="bapplyListContainer">	
	<c:if test="${authUser.sect eq 'business' }">	
	<div id="total" style="width:1000px; margin:0 auto;">
	<div id="bcards">		
	<c:forEach var="apply" items="${apply }">	
	<c:if test="${authUser.bno eq apply.bno }">		 
		<div class="applyList">	       
		<c:choose>	        
				<c:when test="${'신청중' == apply.astatus}">
	          			<div class="aindividualStatus">신청대기</div>
	          	</c:when>
	          	<c:when test="${apply.astatus == '신청완료'}">
	          			<div class="aindividualStatus">수거중</div>
	          	</c:when>
	          	<c:when test="${apply.astatus == '수거완료'}">
	          			<div class="aindividualStatus">수거완료</div>
	          	</c:when>	          		          
	          	
	          	<c:when test="${apply.astatus == '후기등록완료'}">
	          			<div class="aindividualStatus">완료</div>
	          	</c:when>
	          	<c:otherwise>
	          		<c:if test="${apply.astatus == '신청거절' }">
	          			<div class="aindividualStatus">수거거절</div>
	          		</c:if>
	          	</c:otherwise>
			</c:choose>	  
	            <div class="item" style="width:100%;">		            
	            <strong>[ 헌옷 수거 신청 ]</strong>		
	            	<div class="title"></div>                                 		                
	                <div class="allapply" style="padding: 2%;">		                
	                    <form name="bapply" method="post">
		                    <div class="cont">
		                        <div class="aname"><p>${apply.aname }</p></div>
		                        <div class="aphone"><p>${apply.aphone }</p></div>                        
		                        <div class="aadress"><p>${apply.aaddress }</p></div>
		                        <div class="apickup"><p>${apply.apickup }</p></div>                                          
		                        <div class="wei">
		                            <div class="weight"><p>${apply.weight }</p></div>                        
		                        	<p>kg</p>
		                        </div>	
		                        <input type="hidden" id="astatus" name="astatus" value="${apply.astatus }">	                    
		                     </div>	
		                     <div class="bapplyButtons">
		                     <c:if test="${apply.astatus eq '신청중' }">
		                     	<div class="btnBox">
				                    <div class="btn1" >
				                    	<input type="hidden" id="userno" name="userno" value="${apply.userno }">             	                    			                    		                      
				                    	<input type="hidden" id="ano" name="ano" value="${apply.ano }">
				                    	<button type="button" id="bapply_close_btn" name="cancel" data-abtn4="${apply.astatus }" data-abtn5="${apply.userno }" data-abtn6="${apply.ano }">수거거절</button>
				                    </div>  		                                    
				                    <div class="btn" id="btnAccept">		       
				                    	<input type="hidden" id="userno" name="userno" value="${apply.userno }">             	                    			                    		                      
				                    	<input type="hidden" id="ano" name="ano" value="${apply.ano }">
				                        <button type="submit" form="form" data-abtn1="${apply.astatus }" data-abtn2="${apply.userno }" data-abtn3="${apply.ano }" id="bapplying" name="applying" >수거승인</button>
				                    </div>
				                </div>    
		                    </c:if>		 
		                    <c:if test="${apply.astatus eq '신청완료' }">                   			                   
	                    	<c:choose>
	                    		<c:when test="${apply.astatus eq '신청완료' }">
		                    		<div class="btn" id="btnComplete">		      
		                    			<input type="hidden" id="userno" name="userno" value="${apply.userno }">             	                    			                    		                      
		                    			<input type="hidden" id="ano" name="ano" value="${apply.ano }">										
		                        		<button type="submit" form="form" data-abtn1="${apply.astatus }" data-abtn2="${apply.userno }" data-abtn3="${apply.ano }" id="bapplyend" name="applyend">수거완료</button>
	                        		</div>
	                        	</c:when>	                        	
	                        </c:choose>				                   
	                        </c:if>
	                        <c:choose>
	                        <c:when test="${apply.astatus eq '수거완료' }">
	                        		<div class="btn" id="btnComplete2">		      
			                    		<input type="hidden" id="userno" name="userno" value="${apply.userno }">             	                    			                    		                      
			                    		<input type="hidden" id="ano" name="ano" value="${apply.ano }">		                        		
	                        		</div>
	                        	</c:when>
	                        </c:choose>
	                        </div>
	                    </form>                   
	                 </div>		               	            
	        </div>		        
	    </div>	
	    </c:if>	    
	</c:forEach>		
</div>
</div>
</c:if>
   <div class="center" id="bapplyPaging">
    <ul class="pagination bapaging">
		<c:choose>
			<c:when test="${bapageInfo.page<=1}">
				<li><a id="prev"><<</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/mypage/bmypage/${business.bno }/apply?bapage=${bapageInfo.page-1}&select=1" id="prev"><<</a></li>&nbsp;
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${bapageInfo.startPage }" end="${bapageInfo.endPage }">
			<c:choose>
				<c:when test="${bapageInfo.page==i }"><li><a class="active">${i }</a></li></c:when>
				<c:otherwise>
					<li><a href="/mypage/bmypage/${business.bno }/apply?bapage=${i}&select=1">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${bapageInfo.page>=bapageInfo.maxPage }">
				<li><a id="next">>></a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/mypage/bmypage/${business.bno }/apply?bapage=${bapageInfo.page+1}&select=1" id="next">>></a></li>
			</c:otherwise>
		</c:choose>
	</ul>
    </div>
</div>    
    <div>
		<c:import url='/WEB-INF/views/includes/footer.jsp' />
	</div>	
	<script>
	var anos;
	var usernos;	
	var status;
	
	var cano;
	var cuserno;
	var cstatus;
	//수거 승인 
	$('[name=applying]').click(function(e){ //수거승인 등록 버튼 클릭시 
		 var updateData = $('[name=astatus]').val(); //bapply의 내용을 가져옴
		 var targetElement = e.target;
		 status = targetElement.getAttribute("data-abtn1");
		 usernos = targetElement.getAttribute("data-abtn2");
		 anos = targetElement.getAttribute("data-abtn3");
		 console.log("status11 : " + status);
		 console.log("usernos : " + usernos);
		 console.log("anos : " + anos);
	     applyupdate(status); //Insert 함수호출(아래)
	});
   	
	
	function applyupdate(status){		
		 console.log("수거 신청");		 
		    $.ajax({
		        url : '/bapply/'+anos+'/'+usernos,
		        type : 'get',
		        data : {"astatus":status},
		        success : function(data){		            		            
					if(data == '신청완료'){
						alert("수거 승인 완료");
					}else if(data == '수거완료'){
						alert("수거 완료");
					}
					
					location.reload();
		        },
		        error :function(){
		        	alert("수거 승인 오류");
		        }
		    });
		}
	
	//수거 거절
	$('[name=cancel]').click(function(e){ //수거승인 등록 버튼 클릭시 
		 var updateData = $('[name=astatus]').val(); //bapply의 내용을 가져옴
		 var targetElement = e.target;
		 cstatus = targetElement.getAttribute("data-abtn4");
		 cuserno = targetElement.getAttribute("data-abtn5");
		 cano = targetElement.getAttribute("data-abtn6");
		 console.log("cstatus : " + cstatus);
		 console.log("cuserno : " + cuserno);
		 console.log("cano : " + cano);
	     applydelete(cstatus); //Insert 함수호출(아래)
	});
  	
	
	function applydelete(cstatus){		
		 console.log("수거 거절");		 
		    $.ajax({
		        url : '/bapplydelete/'+cano+'/'+cuserno,
		        type : 'get',
		        data : {"astatus":cstatus},
		        success : function(data){		            		            
					alert(data);				
					location.reload();
		        },
		        error :function(){
		        	alert("수거 거절 오류");
		        }
		    });
		}
	
	
	//수거완료
	$('[name=applyend]').click(function(e){ //수거승인 등록 버튼 클릭시 
		 var updateData = $('[name=astatus]').val(); //bapply의 내용을 가져옴
		 var targetElement = e.target;
		 status = targetElement.getAttribute("data-abtn1");
		 usernos = targetElement.getAttribute("data-abtn2");
		 anos = targetElement.getAttribute("data-abtn3");
		 console.log("status11 : " + status);
		 console.log("usernos : " + usernos);
		 console.log("anos : " + anos);
	     applyend(status); //Insert 함수호출(아래)
	});
  
	function applyend(status){
		
		
		 console.log("수거 완료");		 
		    $.ajax({
		        url : '/bapply/'+anos+'/'+usernos,
		        type : 'get',
		        data : {"astatus":status},
		        success : function(data){		            		            
					alert(data);		
					location.reload();
		        },
		        error :function(){
		        	alert("수거 완료 오류");
		        }
		    });
		}
	
	
	</script>
	<script src="<c:url value='/resources/js/free/paging.js'/>"></script>
</body>
</html>