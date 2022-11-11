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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js" type="application/javascript"></script>
<script type="application/javascript" src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c505216c8faffd1bf7690ddd222d68e&libraries=services"></script>
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
	font-size:3rem;
}
input[type=radio] {
    border: 0px;
    width: 50px;
    height: 2em;
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
		
			<div id="offlineview">
				<div class="select" style="top:30px;">
					<select id="sido"><option value="">선택</option></select>
				</div>
				<div class="select" style="margin-left:170px; top:-5px;">
					<select id="sigugun"><option value="">선택</option></select>
				</div>
				<div class="select" style="margin-left:340px; top:-39px;">
					<select id="dong"><option value="">선택</option></select>
				</div>
				<%-- 지도를 표시할 div 입니다 --%>
			
					
				<div>
					<%-- 텍스트: <span id="dongName"></span><br/>--%>
					<input type="text" id="dongName" name="dongName" size="25"> <%--도로명 주소로 표시됨[선택된 값말고] --%>
					<input type="button" id="searchBtn" value="검색">
		
				</div>
			<div id="a">
				<div id="map"></div>
				<div id="c">
				<h1 id="donationlist">[기부업체 리스트 목록]</h1>
			
					<div id="b">		
						<c:forEach var="donation" items="${donation}">
							<input type="hidden" class="allname" name="allname" id="allname" value="${donation.dname}">
							<input type="hidden" class="alladdress" name="totaladdress" id="totaladdress" value="${donation.daddress}">
							<input type="hidden" class="lngx" name="lngx" id="lngx" value="${donation.lngx }">		
							<input type="hidden" class="laty" name="laty" id="laty" value="${donation.laty }">
							<div id="indexlist">
								<h2>&nbsp; &nbsp;[${donation.dname }]</h2>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${donation.daddress }<br/>
								<br>
							</div>	
						
						
					</c:forEach>
					</div>
				</div>
			</div>
						
			</div>
			
			
		</div>	
		<div id="onlineview">
			온라인 페이지 입니다.
		</div>
		
	
	
	
	
	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(35.3732436, 129.147811), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		var geocoder = new kakao.maps.services.Geocoder();//주소-좌표 변환 객체 생성				
	
		//주소 리스트를 받을 배열
		var addressArray = [];
		var wishList = $('.alladdress'); //주소를 리스트에 담아온다.
		for(var i=0; i< wishList.length; i++){ //길에 맞게 groupAddress에 담는다 순서대로
			addressArray.push(
				{'groupAddress' : $("input[name=totaladdress]").eq(i).val(), //주소
				'lngx' : $("input[name=lngx]").eq(i).val(), //위도
				'laty' : $("input[name=laty]").eq(i).val(), //경도
				'name' : $("input[name=allname]").eq(i).val()//이름
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
			
			console.log(alladdress);
			console.log(alllngx);
			console.log(alllaty);
			
			getmultiAddr(alllaty,alllngx); //좌표를 함수에 전달
			function getmultiAddr(alllaty,allngx){
				var coord1 = new kakao.maps.LatLng(alllaty, alllngx); //좌표를 담아준다.
				console.log("총 죄표" + coord1);
				console.log("위치: " + coord1.getLat() +" "+ coord1.getLng());
				var marker1 = new kakao.maps.Marker({ //지도에 좌표에 맞는 위치에 마커를 찍어준다.
					map : map,
					position : coord1
				});
				var infowindow1 = new kakao.maps.InfoWindow({ //마커가 찍힌 곳의 주소를 보여주기위한 것 
					content:allname
				});
				//지도에 띄워주고 보여준다.
				infowindow1.open(map,marker1);
				map.setCenter(coord1);
			}
		}
			
		<%--검색 버튼 클릭시 --%>
		$('#searchBtn').click(function(){
			geocoder.addressSearch($('#dongName').val(),function(result,status){
				//정상적으로 검색이 되었을 경우
				if(status === kakao.maps.services.Status.OK){
					var coords = new kakao.maps.LatLng(result[0].y,result[0].x); //좌표추출
					var address = $('input[name=totaladdress]').val();
					var address1 = document.getElementById('totaladdress').value;
										
					console.log("total address : " +  address);
					console.log("total address : " +  address1);
					//추출한 좌료를 통해 도로명 주소 추출
					var contentadd = document.getElementById('dongName').value;
					var lat = result[0].y;
					var lng = result[0].x;
					var daddress = $('input[name=totaladdress]').val();
					console.log("address"+ daddress);
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
						content: contentadd //검색된 주소 표시
					});
					infowindow.open(map,marker);
					//지도의 중심을 결과값으로 받은 위치로 이동시킵니다.
					map.setCenter(coords);
				}
				
			});
		});
	</script>
	
	
	
<%--js 불러와서 사용하기. --%>	
	<script src="<c:url value='/resources/js/info/sigundong.js'/>"></script>
	<script src="<c:url value='/resources/js/info/map.js'/>"></script>
	<script src="<c:url value='/resources/js/info/radiochangeview.js'/>"></script>
</body>
</html>