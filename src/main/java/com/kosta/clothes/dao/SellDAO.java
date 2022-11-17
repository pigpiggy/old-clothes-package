package com.kosta.clothes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Users;

@Mapper
@Repository
public interface SellDAO {
	Integer getNextIndividualNo() throws Exception;
	void insertIndividual(Sell sell) throws Exception;
	Sell selectIndividual(Integer ino) throws Exception;
	Users getInickname(Integer ino) throws Exception;
	List<Sell> getSellSearchedList(String kwd) throws Exception;
	List<Sell> getSellList() throws Exception;
}
