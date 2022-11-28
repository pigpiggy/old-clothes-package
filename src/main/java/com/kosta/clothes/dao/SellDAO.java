package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

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
	List<Sell> infiniteScrollDown(Integer inoToStart) throws Exception;
	List<Sell> searchedInfiniteScrollDown(Map<String, Object> map) throws Exception;
	void updateIndividual(Sell sell) throws Exception;
	void updateIfileids(Sell sell) throws Exception;
	void deleteIndividual(Integer ino) throws Exception;
	void upIndividualLikes(Sell sell) throws Exception;
	void downIndividualLikes(Sell sell) throws Exception;
	void upApplycount(Sell sell) throws Exception;
	Integer sellcount(Integer userno) throws Exception;
}
