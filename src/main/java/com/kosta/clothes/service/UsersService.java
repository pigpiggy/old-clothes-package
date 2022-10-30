package com.kosta.clothes.service;

public interface UsersService {
		public void certifiedPhoneNumber(String phoneNumber, String cerNum) throws Exception; //본인인증 
		public boolean checkId(String checknick) throws Exception; //닉네임 중복 확인
		public boolean checkEmail(String checkemail) throws Exception; //이메일 중복 확인
}
