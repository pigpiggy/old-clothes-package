<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>지도</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
<link href="<c:url value="/resources/css/selectoption.css"/>" rel='stylesheet'/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<script type="application/javascript" src="<c:url value='/resources/js/info/hangjungdong.js'/>"></script>

<style>
div.contents {
  text-align: left;
  padding-left: 4%;
  padding-top: 10%;
}

#map {
	left: 4%;
	top: 5%;
	width:45%;
	height:55%;
}
#binpage {
	display:flex;
	width:100%;
	height:100%;
}
#binlist {
	display:flex;	
	position:relative;
	overflow-y:scroll;
	flex-direction:column;
	width:99%;
	height:99%;
	border:1px solid black;	
}
#listtitle{
	display:flex;
	align-items:center;
	flex-direction:column;
	justify-content:center;
	width:45%;
	height:56%;
	margin-left:7%;
	margin-top:2%;

}
#border{
	display:flex;	
	position:relative;
	flex-direction:column;
	width:91%;
	height:81%;
	padding:5px;	
	border:1px solid black;	
}
.search-box {
	padding-top:2%;
  	width: 250px;
  	position: relative;
  	display: flex;
	bottom: 0;
	left: 0;
	right: 0;
}
#dongName{
  width: 100%;
  font-family: 'Montserrat', sans-serif;
  font-size: 16px;
  padding: 9px 45px 9px 9px;
  background-color: #fff;
  color: #6c6c6c;
  border-radius: 6px;
  border:1px solid #b8c6db;
  transition: all .4s;
}

#searchBtn{
  background-color: transparent;
  font-size: 18px;
  padding: 6px 9px;
  margin-left:-45px;
  border:none;
  color: #6c6c6c;
  transition: all .4s;
  z-index: 1;	
}

#searchBtn:hover{
  transform: scale(1.2);
  cursor: pointer;
  color: black;
}

#searchBtn:focus{
  outline:none;
  color:black;
}
#searchBtn:focus{
  outline:none;
  color:black;
}
.select{
	margin-right:1%;
}

</style>

</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	
	<div class="contents">
		<div id="selectbox" style="display:flex;">
		<div class="select">
		<select id="sido"><option value="">선택</option></select>
		</div>
		<div class="select">
		<select id="sigugun"><option value="">선택</option></select>
		</div>
		<div class="select">
		<select id="dong"><option value="">선택</option></select>
		</div>
		</div>
		
		
		<div class="search-box">
			<%-- 텍스트: <span id="dongName"></span><br/>--%>
			<input type="text" id="dongName" name="dongName" size="25"> <%--도로명 주소로 표시됨[선택된 값말고] --%>
			<button type="button" id="searchBtn" value="검색"><i class="fas fa-search"></i></button>
			
		</div>		
	</div>
	
	<%-- 지도를 표시할 div 입니다 --%>
	<div id="binpage">
		<div id="map"></div>
		<div id="listtitle">
			<h1 id="binlisttitle">[헌옷수거함 목록]</h1>
			<div id = "border">
			<div id="binlist">
			</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c505216c8faffd1bf7690ddd222d68e&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		var markers = [];//마커 저장할 배열
		var markers2 = [];//마커 저장할 배열
		var info = [];//인포윈도우 저장할 배열
		var info2 = [];//인포윈도우 저장할 배열
		
		
		
		
		<%--검색 버튼 클릭시 --%>
		$('#searchBtn').click(function(){
			
			var geocoder = new kakao.maps.services.Geocoder();//주소-좌표 변환 객체 생성
			geocoder.addressSearch($('#dongName').val(),function(result,status){
				//정상적으로 검색이 되었을 경우
				if(status === kakao.maps.services.Status.OK){
					var coords = new kakao.maps.LatLng(result[0].y,result[0].x); //좌표추출
					
					//검색 마커 있으면 마커 지우기
					if(markers!=null){
						setMarkers(null);
						markers=[];
					};
					//인포윈도우 마커 있으면 인포윈도우 지우기
					if(info!=null){
						setInfo(null);
						info=[];
					};
					
					//추출한 좌표를 통해 도로명 주소 추출
					var contentadd = "<div style= 'width:100%; padding:5px;'>"+document.getElementById('dongName').value+"</div>";
					var lat = result[0].y;
					var lng = result[0].x;
					console.log(geocoder+"geo");
					console.log(contentadd);
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
								$('#dongName').val(result[0].road_address.address_name);
							}
						}
						geocoder.coord2Address(coord.getLng(),coord.getLat(),callback);
					}
					
					//결과값으로ㅗ 받은 위치를 마커로 표시
					var marker = new kakao.maps.Marker({
						map: map,
						position: coords
					});
					marker.setMap(map);//지도에 표시
					markers.push(marker);//마커 정보 배열에 넣기
					//인포윈도우로 장소에 대한 설명을 표시합니다.
					var infowindow = new kakao.maps.InfoWindow({
						content: contentadd //검색된 주소 표시
					});
					info.push(infowindow);//인포 윈도우 배열에 인포 윈도우 넣기
					infowindow.open(map,marker);//인포윈도우 오픈
					//지도의 중심을 결과값으로 받은 위치로 이동시킵니다.
					map.setCenter(coords);
				}
				
			});
		});
		<%--검색 버튼 클릭 시 selectbox 데이터 넘기기--%>
		$(function(){
			$('#searchBtn').click(function(){
				let sido = $("#sido option:selected").text(); //selectbox에서 sido 선택값
				let sigugun = $('#sigugun option:selected').text(); //selectbox에서 sigugun 선택값
				let dong = $('#dong option:selected').text(); //selectbox에서 dong 선택값
				if(sido=="선택"||sigugun=="선택"||dong=="선택"){
					alert("지역을 전부 설정해주세요"); //하나라도 미선택 시 alert창
					return false;
				}
				console.log(sido+"!");
				console.log(sigugun+"!");
				console.log(dong+"!");
				//ajax로 selectbox 선택한 값 넘겨서 리스트 받아오기
				$.ajax({
					type: 'post',
					url: 'csvToBean',
					dataType: 'json',
					data: JSON.stringify({
						"sido" : sido,
						"sigugun" : sigugun,
						"dong" : dong	
					}),
					contentType: "application/json",
					success: function(data){
						$('#binlist').empty(); //리스트 나타나는 곳에 기존 데이터 있을 수 있으니 비우기
						setMarkers2(null); //기존에 있는 마커 있으면 초기화
						setInfo2(null); //기존에 있는 인포윈도우 초기화
						var bli = "";
						bli += "<ul id='itl'>"
						bli += "<br>";
						data.forEach(function(item){
							bli += "<li style='margin-bottom:4%; padding-left:3%;'  ><a href='javascript:void(0);' data-value='"+item+"' onclick='listCheck(this)'>["+item+"]</a></li>";
							var geocoder = new kakao.maps.services.Geocoder();
							//리스트에 있는 위치들은 별도 마커로 표기
							var imageSrc = "image/icons8-marker-100.png",
								imageSize = new kakao.maps.Size(40,44),
								imageOption = {offset: new kakao.maps.Point(20,44)};
							var markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption);
							
							
							geocoder.addressSearch(item, function(result, status){
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
							        var iwContent = '<div style="width:100%; padding:5px;">'+item+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
							            iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
							     // 인포윈도우를 생성합니다
							        var infowindow2 = new kakao.maps.InfoWindow({
							            content : iwContent,
							            removable : iwRemoveable
							        });
							        info2.push(infowindow2);
							        //인포윈도우 열리는 function
							        function displayInfowindow2(marker2, item) {
									    infowindow2.open(map, marker2);
									}
							      //마우스 오버 시 인포윈도우 오픈 + 위치 이동
							      kakao.maps.event.addListener(marker2, 'mouseover', function() {
							    	map.panTo(marker2.getPosition());
					              	displayInfowindow2(marker2, item);
					              });
								  //마우스 아웃 시 인포윈도우 클로즈
					              kakao.maps.event.addListener(marker2, 'mouseout', function() {
					              	infowindow2.close();
					              });
								}
							})
						})
						bli += "</ul>"
						$('#binlist').append(bli); //binlist 위치에 받아온 리스트 출력
						console.log(markers2);
						
					},
					error: function(){alert("조건 전송 오류");}
				});
			})
		})
		
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
		//a태그에 클릭 시 해당 리스트의 마커 위치로 이동시키는 function
		function listCheck(e){
			data = $(e).attr('data-value');
			var geocoder = new kakao.maps.services.Geocoder();
			geocoder.addressSearch(data, function(result, status){
				if (status === kakao.maps.services.Status.OK) {
			        // 결과값으로 받은 위치를 마커로 표시합니다
				var coords3 = new kakao.maps.LatLng(result[0].y, result[0].x);
				map.setCenter(coords3);
				}
			})	
		}
		
	</script>
	
<%--js 불러와서 사용하기. --%>	
	<script src="<c:url value='/resources/js/info/sigundong.js'/>"></script>
	<script src="<c:url value='/resources/js/info/map.js'/>"></script>
</body>
</html>