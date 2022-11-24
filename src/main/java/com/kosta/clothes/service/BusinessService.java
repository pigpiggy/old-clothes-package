package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Business;

public interface BusinessService {
	List<Business> allBusinessInfo(String sido, String sigungu) throws Exception; //판매업체 정보 가져오기
	List<Business> allBusinessInfo1(String sido, String sigungu ,Integer userno) throws Exception; //판매업체 정보 가져오기
	List<Business> allBusinessInfo2(String sido, String sigungu,String category) throws Exception; //판매업체 정보 가져오기
	List<Business> allBusinessInfo3(String sido, String sigungu ,Integer userno,String category) throws Exception; //판매업체 정보 가져오기
}
