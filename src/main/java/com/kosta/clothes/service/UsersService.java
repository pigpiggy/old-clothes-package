package com.kosta.clothes.service;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.Users;

public interface UsersService {
<<<<<<< HEAD
		public void certifiedPhoneNumber(String phone, String cerNum) throws Exception; //본인인증 
		public boolean checkId(String checknick) throws Exception; //닉네임 중복 확인[개인]
		public boolean checkBname(String checkname) throws Exception; //닉네임 중복 확인[업체]
		public boolean checkuserid(String checkuserid) throws Exception; //아이디 중복 확인[개인]
		public boolean businessidCheck(String businessidcheck) throws Exception; //아이디 중복 확인[업체]
		public void insertUsers(Users users) throws Exception;//회원가입[개인]
		public void insertBusiness(Business business) throws Exception;//회원가입[업체]
=======
		public void certifiedPhoneNumber(String phoneNumber, String cerNum) throws Exception; //본인인증 
		public boolean checkId(String checknick) throws Exception; //닉네임 중복 확인
		public boolean checkEmail(String checkemail) throws Exception; //이메일 중복 확인
		public void insertUsers(Users users) throws Exception;//회원가입
		public Users login(String email,String password) throws Exception;//로그인
>>>>>>> e66b4b78ef2b59c90846da7fad90efd4ee664bf5
}
