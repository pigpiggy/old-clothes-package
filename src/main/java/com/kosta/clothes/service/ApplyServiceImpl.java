package com.kosta.clothes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Wapply;
import com.kosta.clothes.dao.ApplyDAO;

@Service
public class ApplyServiceImpl implements ApplyService{

	@Autowired
	ApplyDAO applyDAO;
	
	@Override
	public void registSwapply(Wapply wapply) throws Exception {
		applyDAO.insertSwapply(wapply);
	}



}
