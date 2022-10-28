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
				<div class="input-group mb-3">
					<input type="text" class="form-control">
					<div class="input-group-append"><button class="btn btn-secondary btn-lg"><i class="fas fa-search"></i></button></div>
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
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                <img src="image/cloth.jpg" alt="London trip">
            </div>
            <div class="card-body">
                <span class="date">4 days ago</span>
                <h2>London</h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Voluptate quaerat quasi repudiandae sed
                    debitis ad numquam aliquid quos rem delectus doloremque, eos quia. Harum, minus?</p>
            </div>
            <div class="card-footer">
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                <img src="image/cloth.jpg" alt="London trip">
            </div>
            <div class="card-body">
                <span class="date">4 days ago</span>
                <h2>London</h2>
                <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Voluptate quaerat quasi repudiandae sed
                    debitis ad numquam aliquid quos rem delectus doloremque, eos quia. Harum, minus?</p>
            </div>
            <div class="card-footer">
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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
                대전광역시 서구 탄방동
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



    </div>
		</div>
<script>
const makeSpinner = () => {
	  const spinner = document.createElement('div');
	  const spinnerImage = document.createElement('img');
	  spinner.classList.add('loading');
	  spinnerImage.setAttribute('src', 'image/spinner.gif');
	  spinnerImage.classList.add('spinner');
	  spinner.appendChild(spinnerImage);
	  return spinner;
	};

	const makeSkeleton = () => {
	  const skeleton = document.createElement('li');
	  const skeletonImage = document.createElement('div');
	  const skeletonText = document.createElement('p');
	  skeleton.classList.add('skeleton');
	  skeletonImage.classList.add('skeleton__image');
	  skeletonText.classList.add('skeleton__text');
	  skeletonText.textContent = ' ';
	  skeleton.appendChild(skeletonImage);
	  skeleton.appendChild(skeletonText);
	  return skeleton;
	};

	const list = document.querySelector('.card-list');
	const items = document.querySelectorAll('.card');
	const skeletonItems = Array.from({ length: items.length }, () =>
	  makeSkeleton()
	);
	const spinner = makeSpinner();
	const addSkeleton = () => {
		  skeletonItems.forEach((item) => list.appendChild(item));
		};

		const removeSkeleton = () => {
		  skeletonItems.forEach((item) => list.removeChild(item));
		};

		const loadingStart = () => {
		  addSkeleton();
		  list.appendChild(spinner);
		};

		const loadingFinish = () => {
		  removeSkeleton();
		  list.removeChild(spinner);
		};

		const addNewContent = () => {
		  items.forEach((item) => list.appendChild(item.cloneNode(true)));
		};
		
		const ioCallback = (entries, io) => {
			  entries.forEach((entry) => {
			    if (entry.isIntersecting) {
			      io.unobserve(entry.target);
			      loadingStart();
			      setTimeout(() => {
			        addNewContent();
			        loadingFinish();
			        observeLastItem(io, document.querySelectorAll('.card'));
			      }, 2000);
			    }
			  });
			};

			const observeLastItem = (io, items) => {
			  const lastItem = items[items.length - 1];
			  io.observe(lastItem);
			};

			const io = new IntersectionObserver(ioCallback, { threshold: 0.7 });
			observeLastItem(io, items);
</script>
</body>
</html>