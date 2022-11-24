package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Business;

@Mapper
@Repository
public interface BusinessDAO {
	List<Business> selectBusiness(Map<String, String> map) throws Exception; //판매업체 정보 가져오기 로그인 안 했을 때
	List<Business> selectBusiness1(Map<String, String> map) throws Exception; //판매업체 정보 가져오기 로그인 했을 때
	List<Business> selectBusiness2(Map<String, String> map) throws Exception; //카테고리 정렬 로그인 안 했을 때 (review)
	List<Business> selectBusiness4(Map<String, String> map) throws Exception; //카테고리 정렬 로그인 안 했을 때 (high)
	List<Business> selectBusiness5(Map<String, String> map) throws Exception; //카테고리 정렬 로그인 안 했을 때 (low)
	List<Business> selectBusiness3(Map<String, String> map) throws Exception; //카테고리 정렬 로그인 했을 때 (review)
	List<Business> selectBusiness6(Map<String, String> map) throws Exception; //카테고리 정렬 로그인 했을 때 (high)
	List<Business> selectBusiness7(Map<String, String> map) throws Exception; //카테고리 정렬 로그인 했을 때 (low)
}
