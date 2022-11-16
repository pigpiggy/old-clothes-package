package com.kosta.clothes.service;

import org.springframework.web.multipart.MultipartFile;

import com.kosta.clothes.bean.Sell;

public interface SellService {
	void registSell(Sell sell, MultipartFile[] files) throws Exception;
}
