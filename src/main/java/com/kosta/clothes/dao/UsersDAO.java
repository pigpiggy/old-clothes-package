package com.kosta.clothes.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.Users;

@Mapper
@Repository
public interface UsersDAO {

	void insertBusiness(Business business) throws Exception; //회원가입[업체]
	void insertUsers(Users users) throws Exception; //회원가입[개인]
	Users selectName(String checknick) throws Exception;//닉네임 중복확인[개인]
	Business selectBname(String checknname) throws Exception;//닉네임 중복확인[업체]
	Users selectuserid(String checkuserid) throws Exception;//아이디 중복확인[개인]
	Business selectbusinessid(String businessidCheck) throws Exception;//아이디 중복확인[업체]

	Users selectAccount(Map<String, String> map) throws Exception;//로그인[개인]
	Business selectbAccount(Map<String, String> map) throws Exception;//로그인[업체]
	
	String findUserId(String phone) throws Exception;//아이디 조회[개인]
	String findBusinessId(String bphone) throws Exception;//아이디 조회[업체]
	
	String checkUserIdnPhone(Map<String, String> map) throws Exception;//아이디 전화번호 체크[개인]
	String checkBusinessIdnPhone(Map<String, String> map) throws Exception;//아이디 전화번호 체크[업체]
	
	void updatepassword(Map<String, String> map) throws Exception;//비밀번호 수정[개인]
	void updatebpassword(Map<String, String> map) throws Exception;//비밀번호 수정[업체]

}
