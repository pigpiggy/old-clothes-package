package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Sharing;

public interface MypageService {
	List<Sell> getSellList(Integer userno) throws Exception;
<<<<<<< HEAD
	List<Sharing> getSharingList(Integer userno) throws Exception;
	String getSellapplylist(Integer ino) throws Exception;
=======

	String uintroduce(String introduce,Integer userno) throws Exception;
	
	String bintroduce(String introduce, Integer bno) throws Exception;

>>>>>>> 457d938a5b9c8260df2f9cc102557d11b0ad34c1
}


