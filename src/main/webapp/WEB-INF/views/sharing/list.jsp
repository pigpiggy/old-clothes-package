<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/css/sharing.css"/>"
	rel='stylesheet' />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

</head>
<body>
	<div>
		<c:import url='/WEB-INF/views/includes/header.jsp' />
	</div>


	<div id="listcontent">

		<h1>무료 나눔</h1>
		<div id="addressAndSearch">
			<div>
				<select>
					<option>서울특별시</option>
				</select> <select>
					<option>강남구</option>
				</select> <select>
					<option>압구정동</option>
				</select>
			</div>
			<form>
				<div class="d-flex justify-content-center h-100">
					<div class="search">
						<input type="text" class="search-input" placeholder="search..."
							name=""> <a href="#" class="search-icon"> <i
							class="fa fa-search"></i>
						</a>
					</div>
				</div>
			</form>
		</div>

		<div id="buttonAndOption">
			<a href="sharingInsert">
				<button type="button">상품등록</button>
			</a> <select>
				<option>거리순</option>
				<option>후기많은 순</option>
				<option>높은 평점 순</option>
				<option>낮은 평점 순</option>
				<option>조회순</option>
			</select>
		</div>



		<div class="card-list">

        <div class="card">
            <div class="card-image">
                <img src="image/cloth.jpg" alt="London trip">
            </div>
            <div class="card-body">
                <span class="date">4 days ago</span>
                <h2>London</h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Voluptate quaerat quasi repudiandae sed
                    debitis ad numquam aliquid quos rem delectus doloremque, eos quia. Harum, minus?</p>
            </div>
            <div class="card-footer">
                
            </div>
        </div>

        <div class="card">
            <div class="card-image">
                <img src="image/cloth1.jpg" alt="New York trip">
            </div>
            <div class="card-body">
                <span class="date">1 week ago</span>
                <h2>New York</h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Voluptate quaerat quasi repudiandae sed
                    debitis ad numquam aliquid quos rem delectus doloremque, eos quia. Harum, minus?</p>
            </div>
            <div class="card-footer">
                
            </div>
        </div>

        <div class="card">
            <div class="card-image">
                <img src="image/cloth1.jpg" alt="Marrakech trip">
            </div>
            <div class="card-body">
                <span class="date">2 weeks ago</span>
                <h2>Marrakech</h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Voluptate quaerat quasi repudiandae sed
                    debitis ad numquam aliquid quos rem delectus doloremque, eos quia. Harum, minus?</p>
            </div>
            <div class="card-footer">
                
            </div>
        </div>
        
        <div class="card">
            <div class="card-image">
                <img src="image/cloth.jpg" alt="London trip">
            </div>
            <div class="card-body">
                <span class="date">4 days ago</span>
                <h2>London</h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Voluptate quaerat quasi repudiandae sed
                    debitis ad numquam aliquid quos rem delectus doloremque, eos quia. Harum, minus?</p>
            </div>
            <div class="card-footer">
                
            </div>
        </div>
        
        <div class="card">
            <div class="card-image">
                <img src="image/cloth1.jpg" alt="London trip">
            </div>
            <div class="card-body">
                <span class="date">4 days ago</span>
                <h2>London</h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Voluptate quaerat quasi repudiandae sed
                    debitis ad numquam aliquid quos rem delectus doloremque, eos quia. Harum, minus?</p>
            </div>
            <div class="card-footer">
                
            </div>
        </div>



    </div>
		</div>
</body>
</html>