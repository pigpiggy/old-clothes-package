package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Sell;

public interface MypageService {
	List<Sell> getSellList(Integer userno) throws Exception;

	String uintroduce(String introduce,Integer userno) throws Exception;
	
	String bintroduce(String introduce, Integer bno) throws Exception;

}


