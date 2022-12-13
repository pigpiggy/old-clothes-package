<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>지도</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
<link href="<c:url value="/resources/css/selectoption.css"/>" rel='stylesheet'/>
<link href="<c:url value="/resources/css/map.css"/>" rel='stylesheet'/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c505216c8faffd1bf7690ddd222d68e&libraries=services"></script>
 <%--
 port = 8088 => 6c505216c8faffd1bf7690ddd222d68e
 port = 8090 => 2c14568201306da6e8ef52d47a10b1dc
 port = 9090 => 3c4f67ffd89ba5324a466e5a4f4bd0f5 
 --%>
<style>
div.contents {
  text-align: left;
  padding-left: 50px;
  padding-top: 180px;
}

#map {
	left: -40px;
	top: 0px;
	width:50%;
	height:500px;
	margin:40px;
}	
.alladdresslist {	
	margin-left:1150px;	
	width:400px; height:300px;
}
label {
	font-size:1rem;
}
input[type=radio] {
    border: 0px;
    width: 50px;
    height: 1em;
}

.offlinenames {
	background-color:gray;
	top:px;
}
#a {
	display:flex;
	width:100%;
}
#b {
	display:flex;	
	position:relative;
	overflow-y:scroll;
	flex-direction:column;
	height:400px;
	width:500px;
	padding:5px;	
	border:1px solid black;	
}
#c{
	display:flex;
	align-items:center;
	flex-direction:column;
	justify-content:center;
}
#indexlist{
	border:1px solid black;
}
</style>

</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	
	
	<div class="contents">
		<div class="form-radio" style="text-align:left; margin-left:180px; margin-top:-100px;">
	        <input type="radio" name="donation_level" value="online" id="online" checked="checked" />
	        <label for="person" style="width:120px;">온라인</label>
			&nbsp; &nbsp;
	        <input type="radio" name="donation_level" value="offline" id="offline" />
	        <label for="business">오프라인</label>
		</div>
		<br>		
		<br>
	<%--오프라인 위치 안내 --%>
			<div id="offlineview">
				<div class="select" style="top:30px;">
					<select id="sido"><option value="">선택</option></select>
				</div>
				<div class="select" style="margin-left:170px; top:-5px;">
					<select id="sigugun"><option value="">선택</option></select>
				</div>
				<!-- <div class="select" style="margin-left:340px; top:-39px;">
					<select id="dong"><option value="">선택</option></select>
				</div>  -->
				<%-- 지도를 표시할 div 입니다 --%>
			
					
				<div>
					<%-- 텍스트: <span id="dongName"></span><br/>--%>
					<input type="hidden" id="dongName" name="dongName" size="25"> <%--도로명 주소로 표시됨[선택된 값말고] --%>
					<!-- <input type="button" id="searchBtn" value="검색"> --> 
		
				</div>
				<div id="a">
					<div id="map"></div>
					<div id="c">
					<h1 id="donationlist">[기부업체 리스트 목록]</h1>
				
						<div id="b">		
							<c:forEach var="donation" items="${donation}">
								<input type="hidden" class="allname" name="allname" id="allname" value="${donation.dname}">
								<input type="hidden" class="alladdress" name="totaladdress" id="totaladdress" value="${donation.daddress}">
								<input type="hidden" class="allphone" name="totalphone" id="totalphone" value="${donation.dphone}">
								<input type="hidden" class="lngx" name="lngx" id="lngx" value="${donation.lngx }">		
								<input type="hidden" class="laty" name="laty" id="laty" value="${donation.laty }">
								<div id="indexlist">
									<div class="listdnames"id="listdnames"><h2> &nbsp; &nbsp; ${donation.dname }</h2></div>
									<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${donation.daddress }<br/></div>
									<br>
								</div>	
							</c:forEach>
						</div>
					</div>
				</div>						
			</div>			
		</div>	
		<%--온라인 사이트 안내 --%>
		<div id="onlineview">
			<h1 id=donationsite>기부사이트 안내</h1>
			<a href="https://www.beautifulstore.org/donation" target="_blank"><button style="cursor:pointer;" class="storebtn">신청서 작성</button></a>
			<c:forEach var="online" items="${donation }">	
				<c:if test="${online.dname eq '굿윌스토어 굿윌본부' || online.dname eq '아름다운 가게 서울본부' || online.dname eq '숲스토리 의정부본점'}">			
					<hr width="1000px;">									
					<div class="leftimg"><img class="dimg" src="/image/${online.dfile }" alt="굿윌 본부점"></div>
					<div class="rightcontent"><br>
						<h3 class="names">[업체명 : ${online.dname }]</h3>
						<h4>주소 : ${online.daddress }  </h4>
						<h4>전화 번호 : ${online.dphone }</h4>						
					</div>											
				</c:if>				
			</c:forEach>
			<a href="https://www.soopstory.net/main/html.php?htmid=proc/go_donate.html" target="_blank"><button style="cursor:pointer;" class="storybtn">신청서 작성</button></a>
			<a href="https://www.goodwillstore.org/donation/application.php" target="_blank"><button style="cursor:pointer;" class="goodbtn">신청서 작성</button></a>
		</div>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(35.3732436, 129.147811), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		//이미지 마커 
		var imageSrc = "image/icons8-marker-100.png",
		imageSize = new kakao.maps.Size(40,44),
		imageOption = {offset: new kakao.maps.Point(20,44)};
		var markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption);
		//마커 회수용 배열 변수
		var markers = [];
		var info = [];
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var geocoder = new kakao.maps.services.Geocoder();//주소-좌표 변환 객체 생성					
		var listdnamee= $('.listdnames'); //리스트 목록을 가져온다.
		//주소 리스트를 받을 배열
		var addressArray = [];
		var wishList = $('.alladdress'); //주소를 리스트에 담아온다.
		for(var i=0; i< wishList.length; i++){ //길에 맞게 groupAddress에 담는다 순서대로
			addressArray.push(
				{'groupAddress' : $("input[name=totaladdress]").eq(i).val(), //주소
				'lngx' : $("input[name=lngx]").eq(i).val(), //위도
				'laty' : $("input[name=laty]").eq(i).val(), //경도
				'name' : $("input[name=allname]").eq(i).val(),//이름
				'phone' : $("input[name=totalphone]").eq(i).val()//전화 번호
				}
				);			
		}		
		//DB에서 데이터 받은 만큼 for문 진행
		for(var i = 0; i < addressArray.length; i++){
			
			console.log("길이:"+ addressArray.length);
			//각 값들을 주소.위도,경도에 각각 담아준다.
			var alladdress = addressArray[i].groupAddress; 
			var alllngx = addressArray[i].lngx;
			var alllaty = addressArray[i].laty;
			var allname = addressArray[i].name;
			var allphone = addressArray[i].phone;
			var listdnames = document.querySelectorAll("#listdnames")[i].innerText; 
			
			console.log("리스트목록 값 : " + listdnames);
			console.log(alladdress);
			console.log(alllngx);
			console.log(alllaty);
			console.log(allphone);
			
			getmultiAddr(alllaty,alllngx); //좌표를 함수에 전달
			function getmultiAddr(alllaty,allngx){
				var coord1 = new kakao.maps.LatLng(alllaty, alllngx); //좌표를 담아준다.
				console.log("총 죄표" + coord1);
				console.log("위치: " + coord1.getLat() +" "+ coord1.getLng());
				 var inputcontent = '<div class="wrap">' +
			     '<div class="info">' +
			       '<div class="title">' + 
			       	     allname +			       	     
			       	     '</div><br>' +
			       	'<div class="body">' + 			       	 	
			       		'<div class="desc">'+
			       		 	'<div class="ellipsis">' +'주소 :'+ alladdress +'</div><br>' +			       		 	
			       		 	'<div class="phone ellipsis">'+'전화 번호 :' + allphone  +'</div>' +
			       		 '<div style="padding:5px;"><br><a href="https://map.kakao.com/link/to/'+alladdress+','+alllaty+','+alllngx+'"style="color:blue" target="_blank">길찾기</a></div>'+
			       		 '</div>' +
			       	'</div>' +
			       	'</div>' +
			      '</div>';
				var contentt = '<div style="width:100%; padding:5px;">'+inputcontent+'</div>'; 
				//지도에 좌표에 맞는 위치에 마커를 찍어준다.
				var marker1 = new kakao.maps.Marker({ 
					map : map,
					image: markerImage,
					clickable: true,
					position : coord1
				});
				 //정보를 담아서 보여준다.    
				var infowindow = new kakao.maps.InfoWindow({
				   	content : contentt,
				   	removeable : false
				});
				
					
					//마커 마우스 올릴 시 이동
				kakao.maps.event.addListener(marker1, 'mouseover', function() {
			        map.panTo(marker1.getPosition());
			        infowindow.open(map,marker1);
			    });				
					//마커 마우스 내릴 시 이동
				kakao.maps.event.addListener(marker1, 'mouseout', function() {
					//infowindow.close();		             		             
			    });				
					
					
	            //mouseenter 와 mouseover는 비슷한 유형의 이벤트.마우스 올릴 때 
	            document.querySelectorAll("#listdnames")[i].addEventListener('click', (event) =>{
	            	this.map.panTo(marker1.getPosition());	 
	            	infowindow.open(map,marker1);
	            });
	            
	            //mouseenter 와 mouseover는 비슷한 유형의 이벤트. 마우스 나갈 때 
	            document.querySelectorAll("#listdnames")[i].addEventListener('mouseout', (event) =>{
	            		
	            	infowindow.close();
	            });
			}
		}
		
		<%--검색 --%>
		$(document).on("change","#sigugun",function(){
		/* $('#sigugun').click(function(){ */
			let sido = $("#sido option:selected").text(); //selectbox에서 sido 선택값
			let sigugun = $('#sigugun option:selected').text(); //selectbox에서 sigugun 선택값
			/* let dong = $('#dong option:selected').text(); //selectbox에서 dong 선택값 */
			if(sido=="선택"||sigugun=="선택"){
				alert("지역을 전부 설정해주세요"); //하나라도 미선택 시 alert창
				return false;
			}
			console.log("기부안내!!!");
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
					console.log("기부안내!!!");							
					console.log("total address : " +  address);					
					//추출한 좌료를 통해 도로명 주소 추출
					var contentadd = document.getElementById('dongName').value;
					var contentfinal = '<div style="width:100%; padding:5px;">'+contentadd+'</div>';
					var lat = result[0].y;
					var lng = result[0].x;
					var daddress = $('input[name=totaladdress]').val();
					console.log("address"+ daddress);
					console.log(contentadd);
					console.log("lat: " + lat);	
					console.log("lng: " + lng);
					getAddr(lat,lng);
					console.log("기부안내!!!");
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
				
			});
		});	
		//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i]?.setMap(map);
		    }            
		}	
		function setInfo(map) {
		    for (var i = 0; i < info.length; i++) {
		        info[i]?.setMap(map);
		    }            
		}
	</script>
	
	
	
<%--js 불러와서 사용하기. --%>	
	<script src="<c:url value='/resources/js/info/sigun.js'/>"></script>
	<script src="<c:url value='/resources/js/info/hangjungdong.js'/>"></script>
	<script src="<c:url value='/resources/js/info/map.js'/>"></script>
	<script src="<c:url value='/resources/js/info/radiochangeview.js'/>"></script>
</body>
</html>