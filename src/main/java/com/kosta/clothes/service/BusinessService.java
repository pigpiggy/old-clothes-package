package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Business;

public interface BusinessService {
	List<Business> allBusinessInfo(String sido, String sigungu) throws Exception; //판매업체 정보 가져오기
}
