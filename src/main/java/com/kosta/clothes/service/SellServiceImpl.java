package com.kosta.clothes.service;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.dao.SellDAO;

@Service
public class SellServiceImpl implements SellService{
	@Autowired
	SellDAO sellDAO;
	
	@Autowired
	ServletContext servletContext;

	@Override
	public void registSell(Sell sell, MultipartFile[] files) throws Exception {
		
	}
	
}
