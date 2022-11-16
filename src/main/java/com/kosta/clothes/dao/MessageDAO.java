package com.kosta.clothes.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.MessageVO;

@Mapper
@Repository
public interface MessageDAO {
	void insertSmessage(MessageVO message) throws Exception;
}
