package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Apply;
import com.kosta.clothes.bean.Wapply;

@Mapper
@Repository
public interface ApplyDAO {
	void insertSwapply(Wapply wapply) throws Exception;
	Wapply getSapply(Map map) throws Exception;
	void insertIwapply(Wapply wapply) throws Exception;
	Wapply getIapply(Map map) throws Exception;
	void insertapply(Apply apply) throws Exception; //업체에 신청한 form 등록

	Integer applycount(Integer bno)throws Exception;//신청목록 개수
	Integer astatuscount(Integer bno)throws Exception;//수거상태 카운트
	Integer bstatuscount(Integer bno)throws Exception;
	Integer cstatuscount(Integer bno)throws Exception;
	
	List<Apply> getBapply(Integer bno) throws Exception; //사용자 -> 사업자 신청목록
	List<Apply> getUapply(Integer userno) throws Exception; //사용자가 신청한 목록
	
	void updateApply(@Param("ano") Integer ano, @Param("userno") Integer userno, @Param("astatus") String astatus) throws Exception;//수거 승인
	void deleteApply(@Param("ano") Integer ano, @Param("userno") Integer userno, @Param("astatus") String astatus) throws Exception;//수거 거절
	void deletewApply(@Param("ano") Integer ano, @Param("userno") Integer userno) throws Exception;//신청 취소
	
	//apply 페이징 사용자
	List<Apply> getApplyList(Map map) throws Exception; 
	Integer applyListCount(Integer userno) throws Exception;
	//apply 페이징 사업자
	List<Apply> bgetApplyList(Map map) throws Exception;
	Integer bapplyListCount(Integer userno) throws Exception;
}
