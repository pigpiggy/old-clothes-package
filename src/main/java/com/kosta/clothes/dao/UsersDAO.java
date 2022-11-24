package com.kosta.clothes.dao;

import java.util.List;
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
	
	List<String> findUserId(String phone) throws Exception;//아이디 조회[개인]
	List<String> findBusinessId(String bphone) throws Exception;//아이디 조회[업체]
	
	String checkUserIdnPhone(Map<String, String> map) throws Exception;//아이디 전화번호 체크[개인]
	String checkBusinessIdnPhone(Map<String, String> map) throws Exception;//아이디 전화번호 체크[업체]
	
	void updatepassword(Map<String, String> map) throws Exception;//비밀번호 수정[개인]
	void updatebpassword(Map<String, String> map) throws Exception;//비밀번호 수정[업체]
	
	Integer countUserIdbyPN(String phone) throws Exception;//번호와 일치하는 아이디 수 조회[개인]
	Integer countBusinessIdbyPN(String bphone) throws Exception;//번호와 일치하는 아이디 수 조회[업체]

	String checkupass(String id) throws Exception; //개인비밀번호 확인용
	void updateuser(Users user) throws Exception; //개인 회원 정보 수정
	
	//회원탈퇴
	void deleteuser(Integer userno) throws Exception; //개인 회원 탈퇴 (user)
	void deletesharing(Integer userno) throws Exception; //개인 회원 탈퇴 (sharing)
	void deletelikes(Integer userno) throws Exception; //개인 회원 탈퇴 (likes)
	void deletefree(Integer userno) throws Exception; //개인 회원 탈퇴 (free)
	void deleteindivi(Integer userno) throws Exception; //개인 회원 탈퇴 (individual)
	void deleteapply(Integer userno) throws Exception; //개인 회원 탈퇴 (apply)
	void deletecommet(Integer userno) throws Exception; //개인 회원 탈퇴 (comment)
	
	String checkbpass(String id) throws Exception; //업체비밀번호 확인용
	void updatebusiness(Business business) throws Exception; //업체 회원 정보 수정
}
