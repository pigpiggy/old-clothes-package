<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url='/WEB-INF/views/mypage/mypage.jsp' />
	<div class="my_Tab">
			<ul class="tabs">
				<li class="on"><a href ="#a">신청 목록</a></li>
				<div class="modal">
            <ul>
                <li class="item">
                    <div class="title">
                        <strong>[ 헌옷 수거 신청 ]</strong>
                    </div>
                    <div class="allapply">
                        <form class="form" id="form" action="apply" method="POST" onsubmit="return Valids();">
                    <div class="cont">
                        <input type="text" id="aname" name="aname" placeholder="이름">
                        <div class="adre">
                            <input type="text" id="aadress" name="aadress" placeholder="주소(동 까지만 입력)">
                        </div>
                        <input type="text" id="aphone" name="aphone" placeholder="휴대폰 번호(- 제외하고 입력)">
                        <input type="text" id="apickup" name="apickup" placeholder="수거 희망 날짜">
                        <div class="wei">
                            <input type="text" id="weight" name="weight" placeholder="옷 무게">
                            <p>kg</p>
                        </div>
                    </div>
                    <div class="btn">
                        <button type="button" id="modal_close_btn">수거거절</button>
                        <button type="submit" form="form" id="applycloth">수거대기</button>
                     </div>
                     <input type="hidden" id="bno" name="bno" value="">
                     </form>
                     </div>
                </li>
            </ul>
        </div>
				<li><a href ="#b">거래 후기</a></li>
			</ul>
			<div class="tab_con on">신청 목록 띄워주세요!</div>
			<div class="tab_con">
				<div>
					<c:import url='/WEB-INF/views/mypage/review.jsp' />
				</div>
			</div>
		</div>
<script src="<c:url value='/resources/js/mypage/mypage.js'/>"></script>
</body>
</html>