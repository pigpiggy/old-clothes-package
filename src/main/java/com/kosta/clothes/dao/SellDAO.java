package com.kosta.clothes.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Sell;

@Mapper
@Repository
public interface SellDAO {
	Integer getNextIndividualNo() throws Exception;
	void insertSell(Sell sell) throws Exception;
}
