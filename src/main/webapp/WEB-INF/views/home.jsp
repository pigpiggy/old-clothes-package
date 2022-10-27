<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
   <title>Home</title>
<link href="${pageContext.servletContext.contextPath }/resources/static/css/common.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Montserrat:ital,wght@0,400;1,100&family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style>
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

h1.h1{
   top:44%;
   left:50%;
   transform: translateX(-50%);
   font-size:40;
   position: absolute;
   font-size: 32px;
   font-weight: normal;
}

h3.h3 {
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



</style>



</head>
<body>
   <form action= "/" method="post">
   
   <div class="slideshow-container">
   <div class="mySlides fade">
     <img src="image/second.jpg" style="width:100.5%;height:100%;opacity:0.5; ">
     <%--  <input type="button" class="img-button" onclick="location.href='test.jsp'"> --%>
     <div class="icons">
     	<a href="information" >
     		<img src="image/delete.png" class="icon">
     	</a>
     	<a href="sharingList" >
     		<img src="image/share.png" class="icon">
     	</a>
     	<a href="sharingList" >
     		<img src="image/sell.png" class="icon">
     	</a>
     	<a href="sharingList" >
     		<img src="image/community.png" class="icon">
     	</a>
     </div>
     <h3 class="h3">| 헌옷 처리가 고민이신가요|</h3>
	 <h1 class="h1">"하우헌옷에서 당신의 헌옷을 처리해 보세요"</h1>
   </div>
   
   <div class="mySlides fade">
     <img src="image/first.jpg" style="width:100.5%;height:100%;opacity:0.5; ">
     <%--  <input type="button" class="img-button" onclick="location.href='test.jsp'"> --%>
     <div class="icons">
     	<a href="information">
     		<img src="image/delete.png" class="icon">
     	</a>
     	<a href="sharingList">
     		<img src="image/share.png" class="icon">
     	</a>
     	<a href="sharingList">
     		<img src="image/sell.png" class="icon">
     	</a>
     	<a href="sharingList">
     		<img src="image/community.png" class="icon">
     	</a>
     </div>
     <h3 class="h3">| 헌옷 처리가 고민이신가요|</h3>
	 <h1 class="h1">"하우헌옷은 당신의 헌옷 처리를 도와드립니다."</h1>
   </div>
   
   <div class="mySlides fade">
     <img src="image/threee.png" style="width:100.5%;height:100%;opacity:0.5; ">
    <%--  <input type="button" class="img-button" onclick="location.href='test.jsp'"> --%>
     <div class="icons">
     	<a href="information">
     		<img src="image/delete.png" class="icon">
     	</a>
     	<a href="sharingList">
     		<img src="image/share.png" class="icon">
     	</a>
     	<a href="sharingList">
     		<img src="image/sell.png" class="icon">
     	</a>
     	<a href="sharingList">
     		<img src="image/community.png" class="icon">
     	</a>
     </div>
     <h3 class="h3">| 헌옷 처리가 고민이신가요|</h3>
	 <h1 class="h1">"당신의 주변에서 편리하게 헌옷을 처리해 보세요"</h1>
   </div>
   
   
   <br>
   
   <div id="dots">
     <span class="dot"></span> 
     <span class="dot"></span> 
     <span class="dot"></span> 
   </div>
   </div>
</form>



<script>
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
     setTimeout(showSlides, 3000); // Change image every 2 seconds
   }
</script>
<div>
	<c:import url='/WEB-INF/views/includes/footer.jsp'/>
</div>
</body>
</html>