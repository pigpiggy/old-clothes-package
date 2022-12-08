package com.kosta.clothes.service;

import java.util.List;
import java.util.Map;

import com.kosta.clothes.bean.Apply;
import com.kosta.clothes.bean.Wapply;

public interface ApplyService {
	String registSwapply(Wapply wapply) throws Exception;
	Wapply selectSwapply(Map map) throws Exception;
	String registIwapply(Wapply wapply) throws Exception;
	Wapply selectIwapply(Map map) throws Exception;
	//String submitSwapply(Wapply wapply) throws Exception;
	
	Integer applycount(Integer bno) throws Exception; //신청목록 개수
	Map astatuscount(Integer bno)throws Exception; //수거상태 카운트
	
<<<<<<< HEAD

	
	List<Apply> getBapply(Integer bno) throws Exception;//사용자->사업자 신청목록
	List<Apply> getUapply(Integer userno) throws Exception;//사용자가 신청한 목록
=======
	List<Apply> getBapply(Integer bno) throws Exception;//사용자->사업자 신청목로
>>>>>>> ecccd0b54fed8e653088a1afd8454deab1c2a04b
}
