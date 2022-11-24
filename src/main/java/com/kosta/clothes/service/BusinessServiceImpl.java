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
	//시 구 검색
	@Override
	public List<Business> allBusinessInfo(String sido, String sigungu) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		map.put("sido", sido);
		map.put("sigungu", sigungu);
		return businessDao.selectBusiness(map);
	}
	
	//좋아요 관련 리스트
	@Override
	public List<Business> allBusinessInfo1(String sido, String sigungu, Integer userno) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		String userno1=Integer.toString(userno); 
		map.put("sido", sido);
		map.put("sigungu", sigungu);
		map.put("userno", userno1);
		return businessDao.selectBusiness1(map);
	}
	//카테고리 정렬 리스트
	@Override
	public List<Business> allBusinessInfo2(String sido, String sigungu, String category) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		map.put("sido", sido);
		map.put("sigungu", sigungu);		
		if(category=="review") {
			return businessDao.selectBusiness2(map);
		}else if(category =="high") {
			return businessDao.selectBusiness4(map);
		}
		return businessDao.selectBusiness5(map);
	}

	//카테고리 정렬 리스트
	@Override
	public List<Business> allBusinessInfo3(String sido, String sigungu, Integer userno, String category)
			throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		String userno1=Integer.toString(userno);
		map.put("sido", sido);
		map.put("sigungu", sigungu);
		map.put("userno", userno1);		
		return businessDao.selectBusiness3(map);
	}

}
