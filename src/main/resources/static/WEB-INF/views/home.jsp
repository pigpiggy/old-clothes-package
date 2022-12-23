<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html id="home">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Home</title>
	<!-- Bootstrap CSS -->
  		<link rel="stylesheet" href="<c:url value="/resources/sidebar/css/bootstrap.min.css"/>"/>
    <!-- Style -->
    <link rel="stylesheet" href="<c:url value="/resources/sidebar/css/style.css"/>"/>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Montserrat:ital,wght@0,400;1,100&family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="styl	esheet">
	<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>
			
		   
<style>
/*GLOBALS*/
*{margin:0; padding:0; list-style:none;}
a{text-decoration:none; color:#666;}
a:hover{color:#1bc1a3;}
body, hmtl{background: #ecf0f1; font-family: 'Anton', sans-serif;}


#wrapper{
  width:600px;
  margin:50px auto;
  height:400px;
  position:relative;
  color:#fff;
  text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;  
}

#slider-wrap{
  width:600px;
  height:400px;
  position:relative;
  overflow:hidden;
}

#slider-wrap ul#slider{
  width:100%;
  height:100%;
  
  position:absolute;
  top:0;
  left:0;   
}

#slider-wrap ul#slider li{
  float:left;
  position:relative;
  width:600px;
  height:400px; 
}

#slider-wrap ul#slider li > div{
  position:absolute;
  top:20px;
  left:35px;  
}

#slider-wrap ul#slider li > div h3{
  font-size:36px;
  text-transform:uppercase; 
}

#slider-wrap ul#slider li > div span{
  font-family: Neucha, Arial, sans serif;
  font-size:21px;
}

#slider-wrap ul#slider li img{
  display:block;
  width:100%;
  height: 100%;
}


/*btns*/
.btns{
  position:absolute;
  width:50px;
  height:60px;
  top:50%;
  margin-top:-25px;
  line-height:57px;
  text-align:center;
  cursor:pointer; 
  background:rgba(0,0,0,0.1);
  z-index:100;
  
  
  -webkit-user-select: none;  
  -moz-user-select: none; 
  -khtml-user-select: none; 
  -ms-user-select: none;
  
  -webkit-transition: all 0.1s ease;
  -moz-transition: all 0.1s ease;
  -o-transition: all 0.1s ease;
  -ms-transition: all 0.1s ease;
  transition: all 0.1s ease;
}

.btns:hover{
  background:rgba(0,0,0,0.3); 
}

#next{right:-50px; border-radius:7px 0px 0px 7px;}
#previous{left:-50px; border-radius:0px 7px 7px 7px;}
#counter{
  top: 30px; 
  right:35px; 
  width:auto;
  position:absolute;
}

#slider-wrap.active #next{right:0px;}
#slider-wrap.active #previous{left:0px;}


/*bar*/
#pagination-wrap{
  min-width:20px;
  margin-top:350px;
  margin-left: auto; 
  margin-right: auto;
  height:15px;
  position:relative;
  text-align:center;
}

#pagination-wrap ul {
  width:100%;
}

#pagination-wrap ul li{
  margin: 0 4px;
  display: inline-block;
  width:5px;
  height:5px;
  border-radius:50%;
  background:#fff;
  opacity:0.5;
  position:relative;
  top:0;
  
  
}

#pagination-wrap ul li.active{
  width:12px;
  height:12px;
  top:3px;
  opacity:1;
  box-shadow:rgba(0,0,0,0.1) 1px 1px 0px; 
}




/*Header*/
h1, h2{text-shadow:none; text-align:center;}
h1{ color: #666; text-transform:uppercase;  font-size:36px;}
h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 




/*ANIMATION*/
#slider-wrap ul, #pagination-wrap ul li{
  -webkit-transition: all 0.4s cubic-bezier(1,.01,.32,1);
  -moz-transition: all 0.4s cubic-bezier(1,.01,.32,1);
  -o-transition: all 0.4s cubic-bezier(1,.01,.32,1);
  -ms-transition: all 0.4s cubic-bezier(1,.01,.32,1);
  transition: all 0.4s cubic-bezier(1,.01,.32,1); 
}

* {box-sizing: border-box;}
@font-face {
    font-family: 'LeferiPoint-BlackA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-BlackA.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
body {font-family: 'LeferiPoint-BlackA'; margin: 0; color: #404040}
background-color:white;}
.mySlides {display: none;}
img {vertical-align: middle;}
form {
	position: relative;
	margin: 0;
}

/* Slideshow container */
.slideshow-container {
 
  background-size: cover;  
  position: absoulute;
  margin: auto;
  object-fit: cover;
  font-size:0; 
}

/* The dots/bullets/indicators */

.dot {
  height: 11px;
  width: 11px;
  margin: 70px 9px;
  background-color:#e0e0e0;
  border-radius: 50%;
  display: inline-block;
  opacity: 0.7;
  transition: background-color 0.6s rgb(176, 164, 140);
}

.active {
  background-color: #7f7f7f;
}

/* Fading animation */
.fade { /*화면 이동을 위한 css*/
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

input.img-button{
   background: url("../../resources/image/button.jpg") no-repeat;
   border: none;
   width:150;
   height:40;
   top:50%;
   left:45%;
   position: absolute;
}

h1.maintitle{
   top:-90%;
   left:50%;
   transform: translateX(-50%);
   font-size:40;
   position: absolute;
   font-size: 32px;
   font-weight: normal;
   color:red;
}

h3.subtitle {
	color:gray;
	top:39%;
	left:50%;
	transform: translateX(-50%);
	font-size:25;
	position: absolute;
}

.icons {
	display: flex;
	left: 50%;
	top:55%;
	transform: translate(-50%, 0);
	width: 700px;
	height: 98px;
	justify-content: space-between;
	position: absolute;
}

.icon {
	width: 100px;
}

#dots {
	position: absolute;
	top: 90%;
	left: 50%;
	transform: translateX(-50%);
}

 .main-view{
      margin:  none;
      margin-bottom: 0px;
      margin-top: 0px;
      text-align: center;
}
.main-view{
	position: relative;
    width: 409%;
    height: 101%;
    left: -155%;
    margin: 0px;
    opacity: 0.5;
    overflow: hidden;
    }
    .main-view ul{width:calc(100% * 3);display:flex;animation:slide 17s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
    .main-view li{width:calc(100% / 3);height:300px;}
    
    @keyframes slide {
      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
      50% {margin-left:-200%;}
      60% {margin-left:-200%;}
      100% {margin-left:0;}
    }


</style>



</head>

 

<body>
<aside class="sidebar">
      <div class="toggle">
        <a href="#" class="burger js-menu-toggle" data-toggle="collapse" data-target="#main-navbar" style="background-color: transparent;">
              <span></span>
            </a>
      </div>
      <div class="side-inner">
         
      
        <div class="nav-menu">
          <ul>
            <li class="dropright"><a href="#">하우 헌옷</a>
              <ul class="dropdown-menu" style= "left:50%; min-width:5rem; border:0px;">
                <li><a class="dropdown-item" href="#">하우 헌옷 소개</a></li>
                <li><a class="dropdown-item" href="#">공지사항</a></li>
              </ul>
            </li>
            <li class="dropright"><a href="#">헌옷 버리기/기부</a>
              <ul class="dropdown-menu" style= "left:50%; min-width:5rem; border:0px;">
                <li><a class="dropdown-item" href="clothingbin">내 주변 헌옷수거함</a></li>
                <li><a class="dropdown-item" href="#">기부처 안내</a></li>
              </ul>
            </li>
            <li><a href="#"><span class="menu-text">무료 나눔</span></a></li>
            <li class="dropright"><a href="#">헌옷 사고 팔기</a>
              <ul class="dropdown-menu" style= "left:50%; min-width:5rem; border:0px;">
                <li><a class="dropdown-item" href="businessinfo">업체 판매</a></li>
                <li><a class="dropdown-item" href="#">개인 판매</a></li>
              </ul>
            </li>
            <li class="dropright"><a href="#">커뮤니티</a>
              <ul class="dropdown-menu" style= "left:50%; min-width:5rem; border:0px;">
                <li><a class="dropdown-item" href="#">자유게시판</a></li>
                <li><a class="dropdown-item" href="#">고객센터</a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
      
    </aside>
   
  
   <form action= "/" method="post">
   		
 	<div class = "container">
       <div class="main-view">
          <ul>
            <li><img src="image/first.jpg " width="100%;" height="500%;" /></li>
            <li><img src="image/second.jpg"width="100%" /></li>
            <li><img src="image/threee.png"width="100%"/></li>
          </ul>
        </div>
        
    </div>
    <div class="icons">
        	<a href="information" >
     			<img src="image/delete.png" class="icon">
     		</a>
     		<a href="businessinfo" >
	     		<img src="image/share.png" class="icon">
	     	</a>
	     	<a href="sharingList" >
	     		<img src="image/sell.png" class="icon">
	     	</a>
	     	<a href="sharingList" >
	     		<img src="image/community.png" class="icon">
	     	</a>
	 		<h1 class="maintitle">"하우헌옷에서 당신의 헌옷을 처리해 보세요"</h1>
        </div>
   </form>




	<script src="<c:url value="/resources/sidebar/js/jquery-3.3.1.min.js"/>"></script>
	<script src="<c:url value="/resources/sidebar/js/popper.min.js"/>"></script>
	<script src="<c:url value="/resources/sidebar/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/sidebar/js/main.js"/>"></script>
<script>
	//current position
	var pos = 0;
	//number of slides
	var totalSlides = $('#slider-wrap ul li').length;
	//get the slide width
	var sliderWidth = $('#slider-wrap').width();
	
	
	$(document).ready(function(){
	  
	  
	  /*****************
	   BUILD THE SLIDER
	  *****************/
	  //set width to be 'x' times the number of slides
	  $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
	  
	    //next slide  
	  $('#next').click(function(){
	    slideRight();
	  });
	  
	  //previous slide
	  $('#previous').click(function(){
	    slideLeft();
	  });
	  
	  
	  
	  /*************************
	   //*> OPTIONAL SETTINGS
	  ************************/
	  //automatic slider
	  var autoSlider = setInterval(slideRight, 3000);
	  
	  //for each slide 
	  $.each($('#slider-wrap ul li'), function() { 
	
	     //create a pagination
	     var li = document.createElement('li');
	     $('#pagination-wrap ul').append(li);    
	  });
	  
	  //counter
	  countSlides();
	  
	  //pagination
	  pagination();
	  
	  //hide/show controls/btns when hover
	  //pause automatic slide when hover
	  $('#slider-wrap').hover(
	    function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
	    function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
	  );
	  
	  
	
	});//DOCUMENT READY
	  
	
	
	/***********
	 SLIDE LEFT
	************/
	function slideLeft(){
	  pos--;
	  if(pos==-1){ pos = totalSlides-1; }
	  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));  
	  
	  //*> optional
	  countSlides();
	  pagination();
	}
	
	
	/************
	 SLIDE RIGHT
	*************/
	function slideRight(){
	  pos++;
	  if(pos==totalSlides){ pos = 0; }
	  $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
	  
	  //*> optional 
	  countSlides();
	  pagination();
	}
	
	
	
	  
	/************************
	 //*> OPTIONAL SETTINGS
	************************/
	function countSlides(){
	  $('#counter').html(pos+1 + ' / ' + totalSlides);
	}
	
	function pagination(){
	  $('#pagination-wrap ul li').removeClass('active');
	  $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
	}
	    
	    
	    
   var slideIndex = 0;
   showSlides();
   
   function showSlides() {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";  
     }
     slideIndex++;
     if (slideIndex > slides.length) {slideIndex = 1}    
     for (i = 0; i < dots.length; i++) {
       dots[i].className = dots[i].className.replace(" active", "");
     }
     slides[slideIndex-1].style.display = "block";  
     dots[slideIndex-1].className += " active";
     setTimeout(showSlides, 1500); // Change image every 2 seconds
   }
</script>

</body>
</html>