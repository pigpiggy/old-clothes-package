package com.kosta.clothes.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Users;

@Mapper
@Repository
public interface UsersDAO {
	void insertUsers(Users users) throws Exception; //회원가입
	Users selectName(String checknick) throws Exception;//닉네임 중복확인
	Users selectEmail(String checkemail) throws Exception;//이메일 중복확인
}
