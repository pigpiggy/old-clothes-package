package com.kosta.clothes.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kosta.clothes.bean.FileVO;
import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Users;

public interface SellService {
	void registSell(Sell sell, MultipartFile[] files) throws Exception;
	Sell viewSell(Integer ino) throws Exception;
	Users getInickname(Integer ino) throws Exception;
	List<Sell> getSellList(String kwd) throws Exception;
	List<Sell> getSellList() throws Exception;
	List<Sell> infiniteScrollDown(Integer inoToStart) throws Exception;
	List<Sell> infiniteScrollDown(Integer inoToStart, String kwd) throws Exception;
	void modifySell(Sell sell) throws Exception;
	void modifyIfileids(Sell sell, FileVO fileVo, MultipartFile[] files) throws Exception;
	void deleteSell(Integer ino) throws Exception;
	void upSellLikes(Sell sell) throws Exception;
	void downSellLikes(Sell sell) throws Exception;
	void upApplycount(Sell sell) throws Exception;
	
	Integer sellcount(Integer userno) throws Exception; //판매상품개수
}