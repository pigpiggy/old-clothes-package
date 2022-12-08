<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value="/resources/css/bmypage.css"/>" rel='stylesheet' />

</head>
<body>
	<c:import url='/WEB-INF/views/mypage/mypage.jsp' />
	<div class="my_Tab">
			<ul class="tabs">
<<<<<<< HEAD

				<li class="on"><a href ="#a">신청 목록</a></li>				
				<li><a href ="#b">거래 후기</a></li>
			</ul>
			<div class="tab_con on"> 
			<div class="applyList">
        <ul>
            <li class="item">
            <strong>[ 헌옷 수거 신청 ]</strong>
                <div class="title">
                </div>                  
                
                <div class="allapply">
                    <div class="cont">
                        <div class="aname"><p>김갑동</p></div>
                        <div class="aphone"><p>01033334444</p></div>                        
                         <div class="aadress"><p>서울특별시 금청구 가산동</p></div>
                         <div class="apickup"><p>2022-12-07 11:00pm</p></div>                                          
                        <div class="wei">
                            <div class="weight"><p>25</p></div>                        
                        <p>kg</p>
                        </div>
                     </div>
                    <div class="btn">
                        <button type="button" id="apply_close_btn">수거거절</button>
                        <button type="submit" form="form" id="applying">수거대기</button>
                    </div>                   
                 </div>
            </li>
        </ul>
    </div>
    </div>

=======
				<li class="on"><a href ="#a">신청 목록</a></li>				
				<li><a href ="#b">거래 후기</a></li>
			</ul>			
>>>>>>> fc2f86aef0289dc8b2666abcda59e2cfb6dfd23c
			<div class="tab_con on">
				<div>
					<c:import url='/WEB-INF/views/mypage/bapplylist.jsp' />
				</div>
			</div>
			<div class="tab_con">
				<div>
					<c:import url='/WEB-INF/views/mypage/review.jsp' />
				</div>
			</div>
		</div>
<script src="<c:url value='/resources/js/mypage/mypage.js'/>"></script>
</body>
</html>