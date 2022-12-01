package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.bean.Users;

import com.kosta.clothes.bean.Wapply;



public interface MypageService {
	List<Sell> getSellList(Integer userno) throws Exception;
	List<Sharing> getSharingList(Integer userno) throws Exception;

	List<Users> getSellapplylist(Integer ino) throws Exception;
	List<Users> getSharingapplylist(Integer sno) throws Exception;



	String uintroduce(String introduce,Integer userno) throws Exception;
	String bintroduce(String introduce, Integer bno) throws Exception;

	//
	Users getMypage(Integer userno) throws Exception;
}


