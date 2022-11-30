package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Sharing;

public interface MypageService {
	List<Sell> getSellList(Integer userno) throws Exception;
	List<Sharing> getSharingList(Integer userno) throws Exception;
	String getSellapplylist(Integer ino) throws Exception;
}
