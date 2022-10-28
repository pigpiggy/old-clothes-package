<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="<c:url value="/resources/css/common.css"/>" rel='stylesheet'/>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
    #checkemail {
        background-color: cornflowerblue;        
    }

    #checkname {
        background-color: cornflowerblue;   
    }

    #join {
        background-color: cornflowerblue;   
    }

  </style>
</head>
<body>
<div><c:import url='/WEB-INF/views/includes/header.jsp' /></div>
<div class="container">
  <form class="form-horizontal" action="/action_page.php">
    <div class="form-group">
      <h2 style="text-align: center;">회원 가입</h2>
      <label class="control-label col-sm-2" for="email">이메일 :</label>
      <div class="col-sm-10">
        <input type="email" class="form-control" id="email" placeholder="test@naver.com" name="email">
        <input type="button" name="checkemail" id="checkemail" value="이메일인증" >        
      </div>      
    </div>    

    <div class="form-group">
        <label class="control-label col-sm-2" for="nickname">닉네임 :</label>
        <div class="col-sm-10">          
          <input type="text" class="form-control" id="nickname" name="nickname" placeholder="홍길동">
          <input type="button" name="checkename" id="checkname" value="중복확인">
        </div>
    </div>    
    <div class="form-group">
        <label class="control-label col-sm-2" for="pwd">비밀번호 :</label>
        <div class="col-sm-10">          
          <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd">
        </div>
    </div>    

    <div class="form-group">
        <label class="control-label col-sm-2" for="pwdcheck">비밀번호 확인 :</label>
        <div class="col-sm-10">          
          <input type="password" class="form-control" id="pwdcheck" placeholder="Enter password" name="pwdcheck">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-2" for="smartPhone">연락처 :</label>
        <div class="col-sm-10">          
          <input type="text" class="form-control" id="smartPhone" name="smartPhone" placeholder="010-1234-1234">
        </div>
      </div>

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <div class="checkbox">
          <label><input type="checkbox" name="remember"> 약관 동의</label>
        </div>
      </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" id="join">회원 가입</button>
      </div>
    </div>
  </form>
</div>

</body>
</html>