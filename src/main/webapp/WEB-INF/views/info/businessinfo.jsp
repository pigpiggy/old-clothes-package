<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매업체</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
<link href="<c:url value="/resources/css/businessinfos.css"/>" rel='stylesheet'/>
<link href="<c:url value="/resources/css/selectoption.css"/>" rel='stylesheet'/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c505216c8faffd1bf7690ddd222d68e&libraries=services"></script>
<link href="<c:url value="/resources/css/datepicker.min.css"/>" rel='stylesheet' type="text/css" media="all"/>
<style>
label{
	flex:1;
	text-align: left;
}
.form>div {
	display:flex;
	margin-bottom: 20px;
	padding-bottm:7px;
	align-items:center;	
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
.form{
	witdh:300px;
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
#alladdress{
	display:block;
}
.allbutton>button{
   display:inline-block;
   width:100px;
   height:25px;
   margin-left:calc(50% - 100px - 10px);
}
h2{
	position: absolute;
    left: 40%;    
}
</style>
<script>
//유효성 검사



</script>
</head>
<body>	
		<div>
			<c:import url='/WEB-INF/views/includes/header.jsp' />
		</div>
	<div id="finalbusin">
		<h2>[ 사업자 판매 안내 ]</h2>
	<%--시,구,동  --%>
		<div id="selectbox">
			<div class="select" style="top:30px;">
				<select id="sido"><option value="">선택</option></select>
			</div>
			<div class="select" style="margin-left:170px; top:-5px;">
				<select id="sigugun"><option value="">선택</option></select>
			</div>	
			
			<div class="search-box">
				<%-- 텍스트: <span id="dongName"></span><br/>--%>
				<input type="text" id="dongName" name="dongName" size="25" placeholder="Search something.."> <%--도로명 주소로 표시됨[선택된 값말고] --%>
				<button type="button" id="searchBtn" value="검색"><i class="fas fa-search"></i></button>
			</div>
			<div id="cate" class="select">
			<select id="catelist" onchange="catelist()">
				<option value="">선택하세요</option>
				<option value="review">후기 많은순</option>
				<option value="high">높은 평점순</option>
				<option value="low">낮은 평점순</option>
			</select>
			</div>
		</div>		
		<input type="hidden" class="list" id="list" name="list" value="${list }">			
		<div id="allbusiness">
			<div id="map"></div>				
			<div id="blist"></div>				
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
							              <input type="text" id="aphone" name="aphone" placeholder="(- 제외 (01012341234 )">
							              <input type="text" id="apickup" name="apickup" placeholder="수거 희망 날짜[시간]">
						              <div class="wei">
						                  <input type="text" id="weight" name="weight" placeholder="옷 무게">
						                  <p>kg</p>
						              	</div>						              	
						              <input type="hidden" id="astatus" name="astatus" value="신청중">
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
    
		
		
	</div>
	<script>	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(35.3732436, 129.147811), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };		
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var geocoder = new kakao.maps.services.Geocoder();//주소-좌표 변환 객체 생성
	//마커 회수용 배열 변수
	var businbno=0;
	var userno=0;
	var markers = [];//마커 저장할 배열
	var markers2 = [];//마커 저장할 배열
	var info = [];//인포윈도우 저장할 배열
	var info2 = [];//인포윈도우 저장할 배열
	//var bdata = [];//판매업체 정보 저장할 배열
	/* var listlist = [];
	var list2 = $('.list');
	for(var i=0;i<list2.length;i++){
		listlist.push({
			'bcheck' : $("input[name=list]").eq(i).val() //			
		});
	} */
	var businlist = "${list}";	
	var	auth = "${authUser}";
	var authsect = "${authUser.sect}";
	//시도 변수 선언
	let sido;
	let sigugun;
		
	<%--검색 버튼 클릭시 --%>
	$('#searchBtn').click(function(){
		sido = $("#sido option:selected").text(); //selectbox에서 sido 선택값
		sigugun = $('#sigugun option:selected').text(); //selectbox에서 sigugun 선택값
		//도 -> 경상남도 => 경남
		if(sido.length ==4){	sido = sido.charAt(0) + sido.charAt(2);	} 
		//경기도 / 제주특별자치도 / 부산광역시 / 서울특별시 => 경기,제주,부산,서울
		if(sido.length ==3 || sido.length==7 || sido.length==5){ 	sido = sido.substr(0,2);	}
		//하나라도 미선택 시 alert창
		if(sido=="선택"||sigugun=="선택"){ 	alert("지역을 전부 설정해주세요"); 		return false;	}				
		//ajax로 selectbox 선택한 값 넘겨서 리스트 받아오기
		 $.ajax({
			type: 'post',
			url: 'businesslist',
			dataType: 'json',
			data: JSON.stringify({
				"sido" : sido,
				"sigugun" : sigugun				
			}),
		contentType: "application/json",		
		<%--들어온 값을 지도 마커에 표시!--%>
		success: function(data){			
			$('#blist').empty(); //리스트 나타나는 곳에 기존 데이터 있을 수 있으니 비우기
			setMarkers2(null); //기존에 있는 마커 있으면 초기화
			setInfo2(null); //기존에 있는 인포윈도우 초기화
			var bli = "";
			bli += "<div id='itl'>"
			bli += "<br>";		
			bli += "<ul id='a'>"
			
				//for(var i in data){				
				data.forEach(function(data,i){	
				//리스트 목록 보여주기					
				console.log("찍히나 " +data.baddress);				
				var bbno = data.bno;				
				bli += '<li class="listdnames" id="listmove">' ;
				bli += '<a href="/mypage/'+data.bno+'"><p id="bnames">' + "상호명 : "+ data.bname + '</p></a>';
				console.log("너냐" + bbno);
				if(auth==""){ //둘 다 로그인 안했을 때 
					bli += '<img src="/image/heart.png" id="heart_img" alt="'+data.bno+'">';
					console.log("안뜬다");
				}else if(authsect == 'business'){
					bli += '';
				}else if(authsect == 'users'){	
					if(data.likescheck == 1){								
						bli += '<img src="/image/redheart.png" id="heart_img" alt="'+data.bno+'">';
					}else if(data.likescheck == null){
						bli += '<img src="/image/heart.png" id="heart_img" alt="'+data.bno+'">';
					}else{
						bli += '<img src="/image/heart.png" id="heart_img" alt="'+data.bno+'">';
					}
				}
				console.log(data.bstar +"별점");
				bli += '<div id="totalstar">';
				bli += '<div id="star"><img src="/image/binstar.png"><img src="/image/binstar.png"><img src="/image/binstar.png"><img src="/image/binstar.png"><img src="/image/binstar.png"></div>' // 별점
				bli += '<div id="starEnd" style="width:'+(data.bstar/5)*100+'%;"><img src="/image/star.png"><img src="/image/star.png"><img src="/image/star.png"><img src="/image/star.png"><img src="/image/star.png"></div>' // 별점
				bli += '</div>';
				bli += '<p id="btotaladdress">' +" 주소 : "  + data.baddress + ' ' + data.bdetailadd + '</p>';
				if(data.bphone != null){
					bli += '<p id="btotalphone">' + "전화 번호 : " + data.bphone + '</p>';
				}else{
					bli += '<p id="btotalphone">' + "전화 번호 : 없음"+'</p>';
				}
				
				bli += '<div class="kakaoids" id="kakao-talk-channel-chat-button'+data.bno+'"></div>'; //카카오 버튼
			
				if(authsect == 'users'){
					bli += '<button class="buttonapply'+data.bno+'" id="applymodal" data-value="'+data.bno+'">신청서 작성</button>'; //신청서 작성 form [modal]	
				}								
				bli += '</li>' ;
				
				var businaddress = data.baddress;
				var businname = data.bname;
				var businphone = data.bphone;
				var businbno = data.bno;
				var geocoder = new kakao.maps.services.Geocoder();
				//리스트에 있는 위치들은 별도 마커로 표기
				var imageSrc = "image/icons8-marker-100.png",
					imageSize = new kakao.maps.Size(40,44),
					imageOption = {offset: new kakao.maps.Point(20,44)};
				var markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption);
				
				//주소를 좌표로 전환
				geocoder.addressSearch(businaddress, function(result, status){
					if (status === kakao.maps.services.Status.OK) {
				        var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker2 = new kakao.maps.Marker({
				            map: map,
				            position: coords2,
				            image: markerImage,
				            clickable: true
				        });
				        marker2.setMap(map);
				        markers2.push(marker2); 
				        
				     // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
				        var iwContent = '<div style="width:100%; padding:5px;">' +
				        				'<div>'+ businname + '</div>' + 
				        				'<div>'+ businaddress + data.bdetailadd +'</div>' +
				        				'<div>'+ businphone + '</div>' +
				        				'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				            iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
				     // 인포윈도우를 생성합니다
				        var infowindow2 = new kakao.maps.InfoWindow({
				            content : iwContent,
				            removable : iwRemoveable
				        });
				        info2.push(infowindow2);
				        //인포윈도우 열리는 function
				        function displayInfowindow2(marker2) {
						    infowindow2.open(map, marker2);
						}
				      //마우스 오버 시 인포윈도우 오픈 + 위치 이동
				        kakao.maps.event.addListener(marker2, 'mouseover', function() {
				    		map.panTo(marker2.getPosition());
		              	displayInfowindow2(marker2);
		              	});
					  	//마우스 아웃 시 인포윈도우 클로즈
		              	kakao.maps.event.addListener(marker2, 'mouseout', function() {
		              		infowindow2.close();
		              	});
		            	//mouseenter 와 mouseover는 비슷한 유형의 이벤트.마우스 올릴 때 
		            	document.querySelectorAll("#listmove")[i].addEventListener('mouseenter', (event) =>{
		            		this.map.panTo(marker2.getPosition());	 
		            		infowindow2.open(map,marker2);
		           		});
		            
			            //mouseenter 와 mouseover는 비슷한 유형의 이벤트. 마우스 나갈 때 
			            document.querySelectorAll("#listmove")[i].addEventListener('mouseout', (event) =>{
			            	infowindow2.close();
			            });	
			            $(document).ready(function(){
							
							if (!Kakao.isInitialized()) {
								// 사용할 앱의 JavaScript 키를 설정해 주세요.
								Kakao.init('6c505216c8faffd1bf7690ddd222d68e');
							};	 
						    
						    // 채널 1:1 채팅 버튼을 생성합니다.
						    if(data.bkakaoid != null){
						    Kakao.Channel.createChatButton({
						      container: '#kakao-talk-channel-chat-button'+data.bno+'',
						      channelPublicId: data.bkakaoid,
						      title: 'consult',
						      size: 'small',
						      color: 'yellow',
						      shape: 'pc',
						      supportMultipleDensities: true,
						    });
						    }
						});
			            //모달 켜기
			            $(".buttonapply"+data.bno+"").click(function(){
			            	 document.getElementById("modal").style.display="block";
			            	 var bno = $(".buttonapply"+data.bno+"").data('value');
			            	 document.getElementById("bno").value=bno;
			            	 
			            });
			           
			            
			            	
					}//status 상태
				})//geocoder 
			}); //data.forEach							
			bli += "</ul>"
			bli += "</div>"			
			$('#blist').append(bli); //binlist 위치에 받아온 리스트 출력			
			},	
		error: function(){alert("조건 전송 오류");}
		}); //ajax 

		
		geocoder.addressSearch($('#dongName').val(),function(result,status){
			//정상적으로 검색이 되었을 경우
			if(status === kakao.maps.services.Status.OK){
				if(markers != null){
					setMarkers(null);
					markers=[];
				};
				if(info != null){
					setInfo(null);
					info=[];
				};
				var coords = new kakao.maps.LatLng(result[0].y,result[0].x); //좌표추출
				var address = $('input[name=totaladdress]').val();
				//var address1 = document.getElementById('totaladdress').value;
									
				console.log("total address : " +  address);
				//console.log("total address : " +  address1);
				//추출한 좌료를 통해 도로명 주소 추출
				var contentadd = document.getElementById('dongName').value;
				var contentfinal = '<div style="width:100%; padding:5px;">'+contentadd+'</div>';
				var lat = result[0].y;
				var lng = result[0].x;
				var daddress = $('input[name=totaladdress]').val();								
				console.log("lat: " + lat);	
				console.log("lng: " + lng);
				getAddr(lat,lng);
				function getAddr(lat,lng){
					//주소=>좌표 전환 객체 선언
					var geocoder = new kakao.maps.services.Geocoder();
					var coord = new kakao.maps.LatLng(lat, lng); //x,y값 받아온 걸아 담아서 coord에  담는다.
					var callback = function(result,status){ //결과를  callback에 담는다.
						if(status === kakao.maps.services.Status.OK){ //성공했다면
							//추출한 도로명 주소를 해당 input의 value값으로 적용
							$('#dongName').val();
						}
					}
					geocoder.coord2Address(coord.getLng(),coord.getLat(),callback);
					console.log(result);
					console.log(coord.getLat());
				}
				//결과값으로ㅗ 받은 위치를 마커로 표시
				var marker = new kakao.maps.Marker({
					map: map,
					position: coords
				});
				//인포윈도우로 장소에 대한 설명을 표시합니다.
				var infowindow = new kakao.maps.InfoWindow({
					content: contentfinal //검색된 주소 표시
				});
				
				//마커와 정보 검색을 연속으로 하였을 시 전에 했던 검색 결과는 지워지고 새로 검색된 값을 표시.
				markers.push(marker);
				info.push(infowindow);
				
				infowindow.open(map,marker);
				//지도의 중심을 결과값으로 받은 위치로 이동시킵니다.
				map.setCenter(coords);							
			}
			
		});//geocoder 2
	}); //검색버튼
	
	
	 
	//좋아요 간련 함수
	$(function () {		
		$(document).ready(function(){								
		$(document).on("click","img[id='heart_img']",function(e) {
			var logincheck = "${logincheck}"; //false
			var targetElement = e.target;	
			//let bno = businbno;
			let bno = targetElement.getAttribute('alt');			
			console.log(bno + "gnmng");					
			if(logincheck == "false") {
				alert("로그인 후 이용해주세요.");
				location.href="/login";
			}
			$.ajax({
					type: "post",
					url: "/businessinfo/likes",
					data: {bno:bno},
					success: function(data) {
						console.log("좋아요 수 : " + data);
						if(data == 1) {
							targetElement.setAttribute("src", "/image/redheart.png");							
						} else {
							targetElement.setAttribute("src", "/image/heart.png");							
						}
					}, error: function() {
		                console.log('바보야!');
					}
				})
			});			
		});
	});
	//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
	        markers[i]?.setMap(map);
	    }            
	}
	function setMarkers2(map) {
	    for (var i = 0; i < markers2.length; i++) {
	        markers2[i]?.setMap(map);
	    }            
	}
	//인포윈도우 표시하거나 삭제하는 함수
	function setInfo(map) {
	    for (var i = 0; i < info.length; i++) {
	        info[i]?.setMap(map);
	    }            
	}
	function setInfo2(map) {
	    for (var i = 0; i < info2.length; i++) {
	        info2[i]?.setMap(map);
	    }            
	}		
	
	//카테고리별 리스트 출력
	function catelist(){
		let category = $("#catelist option:selected").val(); //selectbox에서 sido 선택값
		console.log("마지막: " + category);
		 $.ajax({
				type: 'post',
				url: 'categoryb',
				dataType: 'json',
				data: JSON.stringify({
					"sido" : sido,
					"sigugun" : sigugun,			
					"category" : category
				}),
			contentType: "application/json",		
			<%--들어온 값을 지도 마커에 표시!--%>
			success: function(data){			
				$('#blist').empty(); //리스트 나타나는 곳에 기존 데이터 있을 수 있으니 비우기
				setMarkers2(null); //기존에 있는 마커 있으면 초기화
				setInfo2(null); //기존에 있는 인포윈도우 초기화
				var bli = "";
				bli += "<div id='itl'>"
				bli += "<br>";		
				bli += "<ul id='a'>"
				
					//for(var i in data){				
					data.forEach(function(data,i){	
					//리스트 목록 보여주기					
					console.log("찍히나 " +data.baddress);				
					var bbno = data.bno;				
					bli += '<li class="listdnames" id="listmove">' ;
					bli += '<p id="bnames">' + "상호명 : "+ data.bname + '</p>';
					console.log("너냐" + bbno);
					if(auth==""){ //둘 다 로그인 안했을 때 
						bli += '<img src="/image/heart.png" id="heart_img" alt="'+data.bno+'">';
						console.log("안뜬다");
					}else if(authsect == 'business'){
						bli += '';
					}else if(authsect == 'users'){					
						<c:forEach items="${list}" var="listA">							
							console.log("list : " +"${listA.bno}");
							if("${listA.bno}" == data.bno){							
								if(data.likescheck == 1){								
									bli += '<img src="/image/redheart.png" id="heart_img" alt="'+data.bno+'">';
								}else{
									bli += '<img src="/image/heart.png" id="heart_img" alt="'+data.bno+'">';
								}
							}
						</c:forEach>										
						/* if(checkresult==){						
							bli += '<img src="/image/heart.png" id="heart_img" alt="'+data.bno+'">'; 
						} */
					}
					console.log(data.bstar +"별점");
					bli += '<div id="totalstar">';
					bli += '<div id="star"><img src="/image/binstar.png"><img src="/image/binstar.png"><img src="/image/binstar.png"><img src="/image/binstar.png"><img src="/image/binstar.png"></div>' // 별점
					bli += '<div id="starEnd" style="width:'+(data.bstar/5)*100+'%;"><img src="/image/star.png"><img src="/image/star.png"><img src="/image/star.png"><img src="/image/star.png"><img src="/image/star.png"></div>' // 별점
					bli += '</div>';
					bli += '<p id="btotaladdress">' +" 주소 : "  + data.baddress + ' ' + data.bdetailadd + '</p>';
					if(data.bphone != null){
						bli += '<p id="btotalphone">' + "전화 번호 : " + data.bphone + '</p>';
					}else{
						bli += '<p id="btotalphone">' + "전화 번호 : 없음"+'</p>';
					}
					console.log(data.bkakaoid + "kakaoid");
					bli += '<div class="kakaoids" id="kakao-talk-channel-chat-button'+data.bno+'"></div>'; //카카오 버튼					
					if(authsect == 'users'){
						bli += '<button class="buttonapply'+data.bno+'" id="applymodal" data-value="'+data.bno+'">신청서 작성</button>'; //신청서 작성 form [modal]	
					}
					bli += '</li>' ;
					
					
					var businaddress = data.baddress;
					var businname = data.bname;
					var businphone = data.bphone;
					var businbno = data.bno;
					var geocoder = new kakao.maps.services.Geocoder();
					//리스트에 있는 위치들은 별도 마커로 표기
					var imageSrc = "image/icons8-marker-100.png",
						imageSize = new kakao.maps.Size(40,44),
						imageOption = {offset: new kakao.maps.Point(20,44)};
					var markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption);
					
					//주소를 좌표로 전환
					geocoder.addressSearch(businaddress, function(result, status){
						if (status === kakao.maps.services.Status.OK) {
					        var coords2 = new kakao.maps.LatLng(result[0].y, result[0].x);
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker2 = new kakao.maps.Marker({
					            map: map,
					            position: coords2,
					            image: markerImage,
					            clickable: true
					        });
					        marker2.setMap(map);
					        markers2.push(marker2); 
					        
					     // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
					        var iwContent = '<div style="width:100%; padding:5px;">' +
					        				'<div>'+ businname + '</div>' + 
					        				'<div>'+ businaddress + data.bdetailadd +'</div>' +
					        				'<div>'+ businphone + '</div>' +
					        				'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					            iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
					     // 인포윈도우를 생성합니다
					        var infowindow2 = new kakao.maps.InfoWindow({
					            content : iwContent,
					            removable : iwRemoveable
					        });
					        info2.push(infowindow2);
					        //인포윈도우 열리는 function
					        function displayInfowindow2(marker2) {
							    infowindow2.open(map, marker2);
							}
					      //마우스 오버 시 인포윈도우 오픈 + 위치 이동
					        kakao.maps.event.addListener(marker2, 'mouseover', function() {
					    		map.panTo(marker2.getPosition());
			              	displayInfowindow2(marker2);
			              	});
						  	//마우스 아웃 시 인포윈도우 클로즈
			              	kakao.maps.event.addListener(marker2, 'mouseout', function() {
			              		infowindow2.close();
			              	});
			            	//mouseenter 와 mouseover는 비슷한 유형의 이벤트.마우스 올릴 때 
			            	document.querySelectorAll("#listmove")[i].addEventListener('mouseenter', (event) =>{
			            		this.map.panTo(marker2.getPosition());	 
			            		infowindow2.open(map,marker2);
			           		});
			            
				            //mouseenter 와 mouseover는 비슷한 유형의 이벤트. 마우스 나갈 때 
				            document.querySelectorAll("#listmove")[i].addEventListener('mouseout', (event) =>{
				            	infowindow2.close();
				            });	
				            $(document).ready(function(){
								
								if (!Kakao.isInitialized()) {
									// 사용할 앱의 JavaScript 키를 설정해 주세요.
									Kakao.init('6c505216c8faffd1bf7690ddd222d68e');
								};	 
							    
							    // 채널 1:1 채팅 버튼을 생성합니다.
							   if(data.bkakaoid != null){
							    Kakao.Channel.createChatButton({
							      container: '#kakao-talk-channel-chat-button'+data.bno+'',
							      channelPublicId: data.bkakaoid,
							      title: 'consult',
							      size: 'small',
							      color: 'yellow',
							      shape: 'pc',
							      supportMultipleDensities: true,
							    });
							   }
							});
				            //모달 켜기
				            $(".buttonapply"+data.bno+"").click(function(){
				            	 document.getElementById("modal").style.display="block";
				            	 var bno = $(".buttonapply"+data.bno+"").data('value');
				            	 document.getElementById("bno").value=bno;
				            	 
				            });
						}//status 상태
					})//geocoder 
				}); //data.forEach							
				bli += "</ul>"
				bli += "</div>"			
				$('#blist').append(bli); //binlist 위치에 받아온 리스트 출력
				console.log(markers2);			
			},	
			error: function(){alert("구,동 검색 먼저해주세요.");}
			});
		}
		 //모달 닫기
		 $("#modal_close_btn").click(function(){
			 document.getElementById("modal").style.display="none";
	     });
		 //날짜 
		  $(function(){
		 $("#apickup").datepicker({
			    language: 'ko',
			    timepicker: true,
			    timeFormat: "hh:ii AA"
			});	
		  });
		  
		//주소 찾기
		  function findAddr(){
		  	new daum.Postcode({
		          oncomplete: function(data) {
		              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		              // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		              var roadAddr = data.roadAddress; // 도로명 주소 변수
		              
		              // 우편번호와 주소 정보를 해당 필드에 넣는다.
		             
		              if(roadAddr !== ''){
		                  document.getElementById("aaddress").value = roadAddr;
		                  
		              } 
		          }
		      }).open();
		  }
		//msg 체크
		var msg ="${msg}";
		if(msg != ""){
			alert(msg);
		}
		
	

	</script>
	
	<%--js 불러오기 --%>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.0.1/kakao.min.js"
      integrity="sha384-eKjgHJ9+vwU/FCSUG3nV1RKFolUXLsc6nLQ2R1tD0t4YFPCvRmkcF8saIfOZNWf/" crossorigin="anonymous"></script>    
	<script src="<c:url value='/resources/js/info/datepicker.js'/>"></script>
	<script src="<c:url value='/resources/js/info/datepicker.ko.js'/>"></script>
	<script src="<c:url value='/resources/js/info/sigun.js'/>"></script>
	<script src="<c:url value='/resources/js/info/businessinfo.js'/>"></script>
	<script src="<c:url value='/resources/js/info/hangjungdong.js'/>"></script>
	<script src="<c:url value='/resources/js/info/validations.js'/>"></script>
</body>
</html>