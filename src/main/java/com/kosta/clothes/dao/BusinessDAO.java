package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Business;

@Mapper
@Repository
public interface BusinessDAO {
	List<Business> selectBusiness(Map<String, String> map) throws Exception; //판매업체 정보 가져오기
}
