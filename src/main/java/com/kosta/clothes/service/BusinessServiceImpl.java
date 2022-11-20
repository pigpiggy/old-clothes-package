package com.kosta.clothes.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.dao.BusinessDAO;

@Service
public class BusinessServiceImpl implements BusinessService {

	@Autowired
	BusinessDAO businessDao;
	@Override
	public List<Business> allBusinessInfo(String sido, String sigungu) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		map.put("sido", sido);
		map.put("sigungu", sigungu);
		return businessDao.selectBusiness(map);
	}

}
