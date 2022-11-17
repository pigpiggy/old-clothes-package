package com.kosta.clothes.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kosta.clothes.bean.Sell;

public interface SellService {
	void registSell(Sell sell, MultipartFile[] files) throws Exception;
	List<Sell> getSellList(String kwd) throws Exception;
	List<Sell> getSellList() throws Exception;
}
