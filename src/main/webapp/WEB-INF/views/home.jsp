<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
   <title>Home</title>
<link href="${pageContext.servletContext.contextPath }/resources/static/css/common.css" rel="stylesheet" type="text/css">
   
<style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif; margin: 0;}
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
}

/* The dots/bullets/indicators */

.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color:transparent;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s transparent;
}

.active {
  background-color: lightpink;
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

h2.hh{
   top:40%;
   left:40%;
   position: absolute;
}
.icons {
	display: flex;
	left: 50%;
	top:55%;
	transform: translate(-50%, 0);
	width: 700px;
	height: auto;
	justify-content: space-between;
	position: absolute;
}

.icon {
	width:100px;
}

#dots {
	position: absolute;
	top: 90%;
	left: 50%;
	transform: translateX(-50%);
}

#footer>p {
	margin:0;
	padding: 16px 0;
	background-color: gray;
}
</style>



</head>
<body>
   <form action= "/" method="post">
   
   <div class="slideshow-container">
   <div class="mySlides fade">
     <img src="image/second.jpg" style="width:100.5%;height:100%;position:relative; display: block;">
     <input type="button" class="img-button" onclick="location='test'">
     <div class="icons">
     	<img src="image/delete.png" class="icon">
     	<img src="image/share.png" class="icon">
     	<img src="image/sell.png" class="icon">
     	<img src="image/community.png" class="icon">
     </div>
     <h2 class="hh">헌 옷으로 행복해질 수 있어요!</h2>
   </div>
   
   <div class="mySlides fade">
     <img src="image/first.jpg" style="width:100.5%;height:100%">
     <input type="button" class="img-button" onclick="location.href='test.jsp'">
     <div class="icons">
     	<img src="image/delete.png" class="icon">
     	<img src="image/share.png" class="icon">
     	<img src="image/sell.png" class="icon">
     	<img src="image/community.png" class="icon">
     </div>
     <h2 class="hh">헌 옷으로 행복해질 수 있어요!</h2>
   </div>
   
   <div class="mySlides fade">
     <img src="image/threee.png" style="width:100.5%;height:100%">
     <input type="button" class="img-button" onclick="location.href='test.jsp'">
     <div class="icons">
     	<img src="image/delete.png" class="icon">
     	<img src="image/share.png" class="icon">
     	<img src="image/sell.png" class="icon">
     	<img src="image/community.png" class="icon">
     </div>
     <h2 class="hh">헌 옷 수거함은 어디에 있나요~</h2>
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