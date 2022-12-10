package com.kosta.clothes.service;

import java.util.List;
import java.util.Map;

import com.kosta.clothes.bean.Apply;
import com.kosta.clothes.bean.PageInfo;
import com.kosta.clothes.bean.Wapply;

public interface ApplyService {
	String registSwapply(Wapply wapply) throws Exception;
	Wapply selectSwapply(Map map) throws Exception;
	String registIwapply(Wapply wapply) throws Exception;
	Wapply selectIwapply(Map map) throws Exception;
	//String submitSwapply(Wapply wapply) throws Exception;
	
	Integer applycount(Integer bno) throws Exception; //신청목록 개수
	Map astatuscount(Integer bno)throws Exception; //수거상태 카운트
	

	
	List<Apply> getBapply(Integer bno) throws Exception;//사용자->사업자 신청목록
	List<Apply> getUapply(Integer userno) throws Exception;//사용자가 신청한 목록

	
	//
	public void updateApply(Integer ano, Integer userno, String astatus) throws Exception; //수거/수거중/완료
	public void deleteApply(Integer ano, Integer userno, String astatus) throws Exception; //수거 거절
	
	public void deletewApply(Integer ano, Integer userno) throws Exception; //신청 취소
	
	List<Apply> getApplyList(Integer userno, int apage, PageInfo apageInfo) throws Exception; //개인 마이페이지 신청목록 페이징
	List<Apply> bgetApplyList(Integer bno, int bapage, PageInfo bapageInfo) throws Exception; //개인 마이페이지 신청목록 페이징
}
