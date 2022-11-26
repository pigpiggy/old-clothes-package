package com.kosta.clothes.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Wapply;
import com.kosta.clothes.dao.ApplyDAO;

@Service
public class ApplyServiceImpl implements ApplyService{

	@Autowired
	ApplyDAO applyDAO;
	
	@Override
	public String registSwapply(Wapply wapply) throws Exception {
		applyDAO.insertSwapply(wapply);
		return "true";
	}

	@Override
	public void registIwapply(Wapply wapply) throws Exception {
		applyDAO.insertIwapply(wapply);
	}

	@Override
	public Wapply selectSwapply(Map map) throws Exception {
		return applyDAO.getSapply(map);
	}



}
