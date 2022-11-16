package com.kosta.clothes.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Wapply;

@Mapper
@Repository
public interface ApplyDAO {
	void insertSwapply(Wapply wapply) throws Exception;
}
