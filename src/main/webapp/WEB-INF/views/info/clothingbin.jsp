<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>지도</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
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
	width:90%;
	height:80%;
	padding:5px;	
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
</style>
<!-- 
<script>

<%--검색 버튼 클릭 시 selectbox 데이터 넘기기--%>
$(function(){
	$('#searchBtn').click(function(){
		let sido = $("#sido option:selected").text();
		let sigugun = $('#sigugun option:selected').text();
		let dong = $('#dong option:selected').text();
		console.log(sido+"!");
		console.log(sigugun+"!");
		console.log(dong+"!");
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
				$('#binlist').empty();
				setMarkers(null);
				var bli = "";
				data.forEach(function(item){
					bli += "<br>";
					bli += "<li>"+item+"</li>";
					geocoder.addressSearch(item, function(result, status){
						if (status === kakao.maps.services.Status.OK) {
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					        // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
						}
						markers.push(marker);
					})
				})
				bli += "<br>";
				$('#binlist').append(bli);
				console.log(markers);
				
			},
			error: function(){alert("조건 전송 오류");}
		});
	})
})
</script>
-->

</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>
	
	<div class="contents">
		<select id="sido"><option value="">선택</option></select>
		<select id="sigugun"><option value="">선택</option></select>
		<select id="dong"><option value="">선택</option></select>
		
		
		<div>
			<%-- 텍스트: <span id="dongName"></span><br/>--%>
			<input type="text" id="dongName" name="dongName" size="25"> <%--도로명 주소로 표시됨[선택된 값말고] --%>
			<input type="button" id="searchBtn" value="검색">
			
		</div>		
	</div>
	
	<%-- 지도를 표시할 div 입니다 --%>
	<div id="binpage">
		<div id="map"></div>
		<div id="listtitle">
			<h1 id="binlisttitle">헌옷수거함 목록</h1>
			<div id="binlist">
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
		var geocoder = new kakao.maps.services.Geocoder();//주소-좌표 변환 객체 생성
		var markers = new Array();
		
		
		<%--검색 버튼 클릭시 --%>
		$('#searchBtn').click(function(){
			<!--
			var geocoder = new kakao.maps.services.Geocoder();//주소-좌표 변환 객체 생성
			-->
			geocoder.addressSearch($('#dongName').val(),function(result,status){
				//정상적으로 검색이 되었을 경우
				if(status === kakao.maps.services.Status.OK){
					var coords = new kakao.maps.LatLng(result[0].y,result[0].x); //좌표추출
					
					
					
					
					//추출한 좌표를 통해 도로명 주소 추출
					var contentadd = document.getElementById('dongName').value;
					var lat = result[0].y;
					var lng = result[0].x;
					console.log(geocoder+"geo");
					console.log(contentadd);
					console.log("lat: " + lat);
					console.log("lng: " + lng);
					getAddr(lat,lng);
					function getAddr(lat,lng){
						//주소=>좌표 전환 객체 선언
						//var geocoder = new kakao.maps.services.Geocoder();
						geocoder = new kakao.maps.services.Geocoder();
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
					//인포윈도우로 장소에 대한 설명을 표시합니다.
					var infowindow = new kakao.maps.InfoWindow({
						content: contentadd //검색된 주소 표시
					});
					infowindow.open(map,marker);
					//지도의 중심을 결과값으로 받은 위치로 이동시킵니다.
					map.setCenter(coords);
				}
				
			});
		});
		<%--검색 버튼 클릭 시 selectbox 데이터 넘기기--%>
		$(function(){
			$('#searchBtn').click(function(){
				let sido = $("#sido option:selected").text();
				let sigugun = $('#sigugun option:selected').text();
				let dong = $('#dong option:selected').text();
				console.log(sido+"!");
				console.log(sigugun+"!");
				console.log(dong+"!");
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
						$('#binlist').empty();
						setMarkers(null);
						var bli = "";
						data.forEach(function(item){
							bli += "<br>";
							bli += "<li>"+item+"</li>";
							geocoder.addressSearch(item, function(result, status){
								if (status === kakao.maps.services.Status.OK) {
							        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
							        // 결과값으로 받은 위치를 마커로 표시합니다
							        var marker = new kakao.maps.Marker({
							            map: map,
							            position: coords
							        });
								}
								markers.push(marker);
							})
						})
						bli += "<br>";
						$('#binlist').append(bli);
						console.log(markers);
						
					},
					error: function(){alert("조건 전송 오류");}
				});
			})
		})
		//배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }            
		}
		
	</script>
	
	
	
<%--js 불러와서 사용하기. --%>	
	<script src="<c:url value='/resources/js/info/sigundong.js'/>"></script>
	<script src="<c:url value='/resources/js/info/map.js'/>"></script>
</body>
</html>