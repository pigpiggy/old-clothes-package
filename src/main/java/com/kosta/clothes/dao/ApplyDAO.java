package com.kosta.clothes.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Apply;
import com.kosta.clothes.bean.Wapply;

@Mapper
@Repository
public interface ApplyDAO {
	void insertSwapply(Wapply wapply) throws Exception;
	void insertIwapply(Wapply wapply) throws Exception;
	void insertapply(Apply apply) throws Exception; //업체에 신청한 form 등록
}
