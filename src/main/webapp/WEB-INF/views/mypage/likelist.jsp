<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="<c:url value="/resources/css/selectoption.css"/>" rel='stylesheet'/>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
<link href="<c:url value="/resources/css/mypage.css"/>" rel='stylesheet' />
<title>Insert title here</title>
<style>
#full{
	padding-left:24%; 
	padding-right:24%;
}

#list{
	width:100%; padding:3%;
}
#big {
	display:flex;
	width: 100%; 
	height: 20%;
	border: 2px solid gray;
	border-radius:2%;
	margin-bottom:1%;
	
}
#pic{
	width: 15%; 
	height: 40%; 
	margin-right:5%;
	margin-left:2%;
}
#content{
	width:80%; 
	margin:2%;
}
#title{
	margin-bottom: 5%;
}
#deletebu{
	width: 6%;
	margin-top:10%;
}
.form{
	witdh:300px;
}
.allapply{	
	padding: 5px 20px;
	position: absolute;
	top: 50%;
	left:50%;
	width:360px; height: 265px;
	margin-left: -220px;
	margin-top: -170px;
	display:flex;
	flex-direction:column;
	justify-content: center;
	align-items:center;
}
.form>div {
	display:flex;
	margin-bottom: 20px;
	padding-bottm:7px;
	align-items:center;	
}
.allapply>button{
	width:85px;
	float:right;
	padding:3px;
}
.form>div>input{	
	width:250px;
	margin-left:15px;
	padding:5px;
}

</style>
</head>
<body>
	<c:import url='/WEB-INF/views/mypage/mypage.jsp' />
	<div id="full">
		<div id="cate" class="select" >
			<select id="catelist" onchange="catelist()">
				<option value="free">무료나눔</option>
				<option value="indi">개인판매</option>
				<option value="busi">업체판매</option>
			</select>
		</div>
		<div id="list" class="list">
			
		</div>
	</div>
	<!-- 헌옷 수거 신청 모달창 -->
		<div id="modal" class="modal">
   
		    <div class="modal_content">
		    	<ul>
		    		<li class="item">		    			 
				            
				             <div class="title">
				               <strong>[ 헌옷 수거 신청 ]</strong>
				             <p>※접수가 완료되면 업체가 확인 후 연락드리겠습니다.</p>
				         </div>
				        
				         <div class="allapply">
			         	 	<form class="form" id="form" action="apply" method="POST" onsubmit="return Valids();">
			         	 		<div class="cont">
						              <input type="text" id="aname" name="aname" placeholder="이름">
						              <div class="adre">
						                  <input type="text" id="aaddress" name="aaddress" placeholder="주소(동 까지만 입력)">
						                  <input type="button" id="aad_bt" name="aad_bt" readonly onclick="findAddr()" value="주소검색">
						              </div>
							              <input type="text" id="aphone" name="aphone" placeholder="휴대폰 번호(- 제외하고 입력 )">
							              <input type="text" id="apickup" name="apickup" placeholder="수거 희망 날짜[시간]">
						              <div class="wei">
						                  <input type="text" id="weight" name="weight" placeholder="옷 무게">
						                  <p>kg</p>
						              </div>
						          </div>	
						          <hr class="hr2">		         	 	
			         	 	<div class="btn">			         	 	  
				              <button type="button" id="modal_close_btn">Close</button>
				              <button type="submit" form="form" id="applycloth">수거신청</button>
				           </div>
				           	  <input type="hidden" id="bno" name="bno" value="">
			         	 	</form>
				         </div>
		    		</li>
		    	</ul>
		    </div>
		    
		    <div class="modal_layer"></div>
		</div>	


<script>
$(document).ready(function(){
	let category = "free";
	let totalData; //총 데이터 수
	let dataPerPage=2; //한 페이지에 나타낼 글 수
	let pageCount=10; //페이징에 나타낼 페이지 수
	let globalCurrentPage=1; //현재 페이지
	let pageHtml="";
	
	console.log(category);
	var line = "";
	 $.ajax({
		type: 'post',
		url: 'likelistaj',
		dataType: 'json',
		data: JSON.stringify({		
			"category" : category
		}),
		contentType: "application/json",
		success: function(data){
			$('#list').empty();
			totalData= data.length;
			console.log(data);
			
			//목록 표시 호출
			displayData(1,dataPerPage);
			//페이징 표시 호출
			paging(totalData,dataPerPage, pageCount, 1);
			
			
			
			//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영 
			function displayData(currentPage, dataPerPage){
				let chartHtml="";
				
				//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 된다
				currentPage=Number(currentPage);
				dataPerPage=Number(dataPerPage);
				console.log(currentPage);
				console.log(dataPerPage);
				//var i = (currentPage-1)*dataPerPage
				//console.log("i1:"+i);
				data.forEach(function(data,i){
					console.log("i2:"+i);
					console.log(data);
					if(i>=((currentPage-1)*dataPerPage+dataPerPage)){
						return false;
					}
					if(i>=(currentPage-1)*dataPerPage){
						if(category=="free"){
							chartHtml +='<div id="big">';
							if(data.sfileids==null){
								chartHtml +='<div id="pic">';
								chartHtml +='<img src="/image/logo3.png" alt="로고" style="width:100%; height:100%;">';
								chartHtml +='</div>';
							}else{
								chartHtml +='<div id="pic">';
								chartHtml +='<img src="/upload/'+data.sfileids+'" alt="무료나눔 옷" style="width:100%; height:100%;">';
								chartHtml +='</div>';
							}
							chartHtml +='<div id="content">';
							chartHtml +='<div id="title"><a href="/sharingView/'+data.sno+'">'+data.stitle+'</a></div>';
							chartHtml +='<div>'+data.regDate+'</div>'
							chartHtml +='</div>'
							chartHtml +='<div>'
							chartHtml +='<div id="deletebu">'
							chartHtml +='<button id="sdelete'+data.sno+'" class="sdelete" data-value="'+data.sno+'">취소</button>'
							chartHtml +='</div>'	
							chartHtml +='</div>'	
							chartHtml +='</div>'
						}
					}
					i++
				})
				chartHtml +='<ul id="pagingul"></ul>'
				$("#list").html(chartHtml);
				$("#pagingul").html(pageHtml);
			}
			function paging(totalData, dataPerPage, pageCount, currentPage){
				console.log("currentPage:" +currentPage);
				
				let totalPage= Math.ceil(totalData/dataPerPage);//총페이지수
				console.log("totalPage:" +totalPage);
				if(totalPage<pageCount){
					pageCount = totalPage;
				}
				console.log("pageCount:"+pageCount);
				let pageGroup = Math.ceil(currentPage/pageCount);//페이지 그룹
				let last = pageGroup*pageCount;//화면에 보여질 마지막 페이지 번호
				console.log("last:"+last);
				
				if(last>totalPage){
					last = totalPage;
				}
				let first = last - (pageCount-1);//화면에 보여질 첫번째 페이지 번호
				let next = last + 1;
				let prev = first -1;
				pageHtml ="";
				if(prev>0){
					pageHtml += "<li><a href='#' id='prev'>이전</a></li>";
				}
				for(var i = first; i<=last; i++){
					if(currentPage == i){
						pageHtml +="<li class='on'><a href='#' id='"+i+"'>"+i+"</a></li>";
					}else{
						pageHtml +="<li><a href='#' id='"+i+"'>"+i+"</a></li>";
					}	
				}
				if(last<totalPage){
					pageHtml +="<li><a href='#' id='next'>다음</a></li>";
				}
				console.log(pageHtml);
				$("#pagingul").html(pageHtml);
				
				
				//페이징 번호 클릭 이벤트
				$(document).on("click","#pagingul li a",function(){
					let $id = $(this).attr("id");
					selectedPage=$(this).text();
					console.log("선택페이지:"+selectedPage);
					
					if($id=="next"){
						selectedPage = next;
					}if($id=="prev"){
						selectedPage = prev;
					}
					//전역변수에 선택한 페이지 번호를 담는다
					globalCurrentPage = selectedPage;
					//페이징 표시 재호출
					paging(totalData, dataPerPage, pageCount, selectedPage);
					//글 목록 표시 재호출
					displayData(selectedPage, dataPerPage);
				})
			}
			/*
			$(document).on("click",".delete",function(e){
				let category = "";
				var targetElement = e.target;
				let deleteno = targetElement.getAttribute('data-value');
				let deleteclass = targetElement.getAttribute('class');
				if(deleteclass=="sdelete"){
					category = "free"
				}else if(deleteclass=="idelete"){
					category = "indi"
				}else if(deleteclass=="bdelete"){
					category = "busi"
				}
				console.log("삭제:"+deleteno);
				$.ajax({
					type: 'post',
					url: 'deletelike',
					dataType: 'json',
					data: JSON.stringify({	
						"category" : category,
						"deleteno" : deleteno
					}),
					contentType: "application/json",
					success: function(result){
						console.log(result);
						if(result=="true"){
							alert("좋아요 취소되었습니다");
							//페이징 표시 재호출
							paging(totalData, dataPerPage, pageCount, globalCurrentPage);
							//글 목록 표시 재호출
							displayData(globalCurrentPage, dataPerPage);
						}else{
							alert("에러입니다");
						}
					},
					error:function(){alert("에러입니다");}
				})
			})
			*/
		},
		error:function(){alert("에러입니다.");}
	})
})

function catelist(){
	let category = $("#catelist option:selected").val();
	let totalData; //총 데이터 수
	let dataPerPage=2; //한 페이지에 나타낼 글 수
	let pageCount=10; //페이징에 나타낼 페이지 수
	let globalCurrentPage=1; //현재 페이지
	let pageHtml="";
	
	console.log(category);
	var line = "";
	 $.ajax({
		type: 'post',
		url: 'likelistaj',
		dataType: 'json',
		data: JSON.stringify({		
			"category" : category
		}),
		contentType: "application/json",
			success: function(data){
			$('#list').empty();
			totalData= data.length;
			console.log(data);
			
			//목록 표시 호출
			displayData(1,dataPerPage);
			//페이징 표시 호출
			paging(totalData,dataPerPage, pageCount, 1);
			
			
			
			//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영 
			function displayData(currentPage, dataPerPage){
				let chartHtml="";
				
				//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 된다
				currentPage=Number(currentPage);
				dataPerPage=Number(dataPerPage);
				console.log(currentPage);
				console.log(dataPerPage);
				//var i = (currentPage-1)*dataPerPage
				//console.log("i1:"+i);
				data.forEach(function(data,i){
					console.log("i2:"+i);
					console.log(data);
					if(i>=((currentPage-1)*dataPerPage+dataPerPage)){
						return false;
					}
					if(i>=(currentPage-1)*dataPerPage){
						if(category=="free"){
							chartHtml +='<div id="big">';
							if(data.sfileids==null){
								chartHtml +='<div id="pic">';
								chartHtml +='<img src="/image/logo3.png" alt="로고" style="width:100%; height:100%;">';
								chartHtml +='</div>';
							}else{
								chartHtml +='<div id="pic">';
								chartHtml +='<img src="/upload/'+data.sfileids+'" alt="무료나눔 옷" style="width:100%; height:100%;">';
								chartHtml +='</div>';
							}
							chartHtml +='<div id="content">';
							chartHtml +='<div id="title"><a href="/sharingView/'+data.sno+'">'+data.stitle+'</a></div>';
							chartHtml +='<div>'+data.regDate+'</div>'
							chartHtml +='</div>'
							chartHtml +='<div>'
							chartHtml +='<div id="deletebu">'
							chartHtml +='<button id="sdelete'+data.sno+'" class="sdelete" data-value="'+data.sno+'">취소</button>'
							chartHtml +='</div>'	
							chartHtml +='</div>'	
							chartHtml +='</div>'
						}else if(category=="indi"){
							chartHtml +='<div id="big">';
							if(data.ifileids==null){
								chartHtml +='<div id="pic">';
								chartHtml +='<img src="/image/logo3.png" alt="로고" style="width:100%; height:100%;">';
								chartHtml +='</div>';
							}else{
								chartHtml +='<div id="pic">';
								chartHtml +='<img src="/upload/'+data.ifileids+'" alt="무료나눔 옷" style="width:100%; height:100%;">';
								chartHtml +='</div>';
							}
							chartHtml +='<div id="content">';
							chartHtml +='<div id="title"><a href="/sellView/'+data.ino+'">'+data.ititle+'</a></div>';
							chartHtml +='<div>'+data.regDate+'</div>'
							chartHtml +='</div>'
							chartHtml +='<div>'
							chartHtml +='<div id="deletebu">'
							chartHtml +='<button id="idelete'+data.ino+'" class="idelete" data-value="'+data.ino+'">취소</button>'
							chartHtml +='</div>'	
							chartHtml +='</div>'	
							chartHtml +='</div>'
						
							
						}else if(category=="busi"){
							chartHtml +='<div id="big">';
							chartHtml +='<div id="pic">';
							chartHtml +='<img src="/image/logo1.png" alt="로고" style="width:100%; height:100%;">';
							chartHtml +='</div>';
							chartHtml +='<div id="content">';
							chartHtml +='<div id="title"><a href="/mypage/bmypage/'+data.bno+'">'+data.bname+'</a></div>';
							chartHtml +='<div>'+data.baddress+' '+data.bdetailadd+'</div>'
							chartHtml +='</div>'
							chartHtml +='<div>'
							chartHtml +='<div id="deletebu">'
							chartHtml +='<button id="bdelete'+data.bno+'" class="bdelete" data-value="'+data.bno+'">취소</button>';
							chartHtml +='</div>'	
							chartHtml +='<div style="margin-top:10%;">'
							chartHtml +='<button class="buttonapply'+data.bno+'" id="applymodal" data-value="'+data.bno+'">신청서 작성</button>'; //신청서 작성 form [modal]
							chartHtml +='</div>'
							chartHtml +='</div>'	
									
							chartHtml +='</div>'
							
						}
					}
					i++
				})
				chartHtml +='<ul id="pagingul"></ul>'
				$("#list").html(chartHtml);
				$("#pagingul").html(pageHtml);
			}
			function paging(totalData, dataPerPage, pageCount, currentPage){
				console.log("currentPage:" +currentPage);
				
				let totalPage= Math.ceil(totalData/dataPerPage);//총페이지수
				console.log("totalPage:" +totalPage);
				if(totalPage<pageCount){
					pageCount = totalPage;
				}
				console.log("pageCount:"+pageCount);
				let pageGroup = Math.ceil(currentPage/pageCount);//페이지 그룹
				let last = pageGroup*pageCount;//화면에 보여질 마지막 페이지 번호
				console.log("last:"+last);
				
				if(last>totalPage){
					last = totalPage;
				}
				let first = last - (pageCount-1);//화면에 보여질 첫번째 페이지 번호
				let next = last + 1;
				let prev = first -1;
				pageHtml ="";
				if(prev>0){
					pageHtml += "<li><a href='#' id='prev'>이전</a></li>";
				}
				for(var i = first; i<=last; i++){
					if(currentPage == i){
						pageHtml +="<li class='on'><a href='#' id='"+i+"'>"+i+"</a></li>";
					}else{
						pageHtml +="<li><a href='#' id='"+i+"'>"+i+"</a></li>";
					}	
				}
				if(last<totalPage){
					pageHtml +="<li><a href='#' id='next'>다음</a></li>";
				}
				console.log(pageHtml);
				$("#pagingul").html(pageHtml);
				
				
				//페이징 번호 클릭 이벤트
				$(document).on("click","#pagingul li a",function(){
					let $id = $(this).attr("id");
					selectedPage=$(this).text();
					console.log("선택페이지:"+selectedPage);
					
					if($id=="next"){
						selectedPage = next;
					}if($id=="prev"){
						selectedPage = prev;
					}
					//전역변수에 선택한 페이지 번호를 담는다
					globalCurrentPage = selectedPage;
					//페이징 표시 재호출
					paging(totalData, dataPerPage, pageCount, selectedPage);
					//글 목록 표시 재호출
					displayData(selectedPage, dataPerPage);
				})
			}
		},
		error:function(){alert("에러입니다.");}
	})
}
$(document).on("click",".delete",function(e){
	let category = "";
	console.log("globalCurrentPage:"+globalCurrentPage);
	var targetElement = e.target;
	let deleteno = targetElement.getAttribute('data-value');
	let deleteclass = targetElement.getAttribute('class');
	if(deleteclass=="sdelete"){
		category = "free"
	}else if(deleteclass=="idelete"){
		category = "indi"
	}else if(deleteclass=="bdelete"){
		category = "busi"
	}
	console.log("삭제:"+deleteno);
	$.ajax({
		type: 'post',
		url: 'deletelike',
		dataType: 'json',
		data: JSON.stringify({	
			"category" : category,
			"deleteno" : deleteno
		}),
		contentType: "application/json",
		success: function(result){
			console.log(result);
			if(result=="true"){
				alert("좋아요 취소되었습니다");
				//페이징 표시 재호출
				paging(totalData, dataPerPage, pageCount, globalCurrentPage);
				//글 목록 표시 재호출
				displayData(globalCurrentPage, dataPerPage);
			}else{
				alert("에러입니다");
			}
		},
		error:function(){alert("에러입니다");}
	})
})
</script>


</body>
</html>