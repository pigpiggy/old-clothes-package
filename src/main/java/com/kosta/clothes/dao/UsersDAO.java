package com.kosta.clothes.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.Users;

@Mapper
@Repository
public interface UsersDAO {
<<<<<<< HEAD
	void insertBusiness(Business business) throws Exception; //회원가입[업체]
	void insertUsers(Users users) throws Exception; //회원가입[개인]
	Users selectName(String checknick) throws Exception;//닉네임 중복확인[개인]
	Business selectBname(String checknname) throws Exception;//닉네임 중복확인[업체]
	Users selectuserid(String checkuserid) throws Exception;//아이디 중복확인[개인]
	Business selectbusinessid(String businessidCheck) throws Exception;//아이디 중복확인[업체]
=======
	void insertUsers(Users users) throws Exception; //회원가입
	Users selectName(String checknick) throws Exception;//닉네임 중복확인
	Users selectEmail(String checkemail) throws Exception;//이메일 중복확인
	Users selectAccount(Map<String, String> map) throws Exception;
>>>>>>> e66b4b78ef2b59c90846da7fad90efd4ee664bf5
}
