package com.kosta.clothes.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Users;

@Mapper
@Repository
public interface UsersDAO {
	Users selectName(String checknick) throws Exception;
	Users selectEmail(String checkemail) throws Exception;
}
