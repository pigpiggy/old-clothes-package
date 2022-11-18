<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매업체</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
<link href="<c:url value="/resources/css/selectoption.css"/>" rel='stylesheet'/>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6c505216c8faffd1bf7690ddd222d68e&libraries=services"></script>
<style>
#map {
	left: 4%;	
	width:40%;
	height:500px;
	margin:40px;
}	

#selectbox {
	padding-left: 10%;
	padding-top:5%;
}

#allbusiness{
	display:flex;
}


#blist {
	justify-content:center;	
	left:4%;
	top:39px;
	position: relative;
    display: inline-block;
    vertical-align: top;
    width: 45%;
    height: 500px;
    overflow-y: scroll;
    background: #fff;
    z-index: 2;
}
#finalbusin{
	background-color:#f7f7f7;
}

#heart_img {
	width:25px;
}
</style>
<script>

</script>
</head>
<body>	
		<div>
			<c:import url='/WEB-INF/views/includes/header.jsp' />
		</div>
	<div id="finalbusin">
	<%--시,구,동  --%>
		<div id="selectbox">
			<div class="select" style="top:30px;">
				<select id="sido"><option value="">선택</option></select>
			</div>
			<div class="select" style="margin-left:170px; top:-5px;">
				<select id="sigugun"><option value="">선택</option></select>
			</div>	
			
			<div>
				<%-- 텍스트: <span id="dongName"></span><br/>--%>
				<input type="text" id="dongName" name="dongName" size="25"> <%--도로명 주소로 표시됨[선택된 값말고] --%>
				<input type="button" id="searchBtn" value="검색">
			</div>
		</div>		
		<input type="hidden" class="list" id="list" name="list" value="${list }">
		<div id="allbusiness">
			<div id="map"></div>		
			<div id="blist"></div>				
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
	var bdata = [];//판매업체 정보 저장할 배열
	var listlist = [];
	var list2 = $('.list');
	for(var i=0;i<list2.length;i++){
		listlist.push({
			'bcheck' : $("input[name=list]").eq(i).val() //
		});
	}
	var businlist = "${list}";		
	var	auth = "${authUser}";
	var authsect = "${authUser.sect}";
	console.log("auth  " + "${authUser.sect}");	
	console.log("aaaaaaa" + auth);
	console.log("aaaa : " + businlist);
	<%--검색 버튼 클릭시 --%>
	$('#searchBtn').click(function(){
		let sido = $("#sido option:selected").text(); //selectbox에서 sido 선택값
		let sigugun = $('#sigugun option:selected').text(); //selectbox에서 sigugun 선택값
		//도 -> 경상남도 => 경남
		if(sido.length ==4){
			sido = sido.charAt(0) + sido.charAt(2);
		}
		//경기도 / 제주특별자치도 / 부산광역시 / 서울특별시 => 경기,제주,부산,서울
		if(sido.length ==3 || sido.length==7 || sido.length==5){
			sido = sido.substr(0,2);
		}
		
		if(sido=="선택"||sigugun=="선택"){
			alert("지역을 전부 설정해주세요"); //하나라도 미선택 시 alert창
			return false;
		}
		var checkresult=0;
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
			console.log(data.length);
			console.log("값이 들어오나 " + bdata);
			$('#blist').empty(); //리스트 나타나는 곳에 기존 데이터 있을 수 있으니 비우기
			setMarkers2(null); //기존에 있는 마커 있으면 초기화
			setInfo2(null); //기존에 있는 인포윈도우 초기화
			var bli = "";
			bli += "<div id='itl'>"
			bli += "<br>";		
			bli += "<ul id='a'>"
			
				for(var i in data){				
							
				console.log("찍히나 " +data[i].baddress);
				var bbno = data[i].bno;
				console.log(bbno+"ㅇㅇㅇ");
				bli += '<li class="listdnames">' ;
				bli += '<p>' + data[i].bname + '</p>';
				console.log("너냐" + auth);
				if(auth==""){ //둘 다 로그인 안했을 때 
					bli += '<img src="/image/heart.png" id="heart_img" alt="찜신청전">';
					console.log("안뜬다");
				}else if(authsect == 'business'){
					bli += '';
				}else if(authsect == 'users'){					
					<c:forEach items="${list}" var="listA">
						console.log("data : " + data[i].bno);
						console.log("list : " +"${listA.bno}");
						if("${listA.bno}" == data[i].bno){
							checkresult =1;
							if("${listA.likescheck}" == 1){
								bli += '<img src="/image/redheart.png" id="heart_img" alt="찜신청 후">';
							}
						}	
					</c:forEach>					
					var heartcheck = document.querySelectorAll("#redheart").innerHTML;
					console.log("들어오긴들어오나" + heartcheck);
					if(checkresult==0){
						console.log("들어오긴들어오나");
						bli += '<img src="/image/heart.png" id="heart_img" alt="찜신청전">'; 
					}
				}
				
				bli += '<p>' + data[i].baddress + ' ' + data[i].bdetailadd + '</p>';
				bli += '</li>' ;

				var businaddress = data[i].baddress;
				var businname = data[i].bname;
				var businphone = data[i].bphone;
				businbno = data[i].bno;
				var geocoder = new kakao.maps.services.Geocoder();
				//리스트에 있는 위치들은 별도 마커로 표기
				var imageSrc = "image/icons8-marker-100.png",
					imageSize = new kakao.maps.Size(40,44),
					imageOption = {offset: new kakao.maps.Point(20,44)};
				var markerImage = new kakao.maps.MarkerImage(imageSrc,imageSize,imageOption);
				
				
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
				        				'<div>'+ businaddress + data[i].bdetailadd +'</div>' +
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
		            document.querySelectorAll("#a")[i].addEventListener('mouseenter', (event) =>{
		            	this.map.panTo(marker2.getPosition());	 
		            	infowindow2.open(map,marker2);
		            });
		            
		            //mouseenter 와 mouseover는 비슷한 유형의 이벤트. 마우스 나갈 때 
		            document.querySelectorAll("#a")[i].addEventListener('mouseout', (event) =>{
		            	infowindow2.close();
		            });
					}
				})
			}
			bli += "</ul>"
			bli += "</div>"
			
			$('#blist').append(bli); //binlist 위치에 받아온 리스트 출력
			console.log(markers2);
			if(authsect=='users'){
			$(function () {
				$("#heart_img").on("click", function(e) {
					var logincheck = "${logincheck}"; //false
					let bno = businbno;					
					console.log(bno + "gnmng");					
					if(logincheck == "false") {
						alert("로그인 후 이용해주세요.")
						location.href="/login";
					} else {
						console.log(bno);
					}
					if(authsect == 'users'){
						console.log("유저");
						userno = "${authUser.userno}";
					}else{
						console.log("들어오겠지?");	
						
					}
						$.ajax({
							type: "post",
							url: "/businessinfo/likes",
							data: {bno:bno, userno:userno},
							success: function(data) {
								console.log(data);
								if(data == 1) {
									$("#heart_img").attr("src", "/image/redheart.png");
								} else {
				                    $("#heart_img").attr("src", "/image/heart.png");
								}
							}, error: function() {
				                console.log('바보야!')
							}
						})
					});
				});	
			}
		},	
		error: function(){alert("조건 전송 오류");}
		}); 

		
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
	</script>
	
	<%--js 불러오기 --%>
	<script src="<c:url value='/resources/js/info/sigun.js'/>"></script>
	<script src="<c:url value='/resources/js/info/hangjungdong.js'/>"></script>
</body>
</html>