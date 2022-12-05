package com.kosta.clothes.service;

import java.util.Map;

import com.kosta.clothes.bean.Wapply;

public interface ApplyService {
	String registSwapply(Wapply wapply) throws Exception;
	Wapply selectSwapply(Map map) throws Exception;
	String registIwapply(Wapply wapply) throws Exception;
	Wapply selectIwapply(Map map) throws Exception;
	//String submitSwapply(Wapply wapply) throws Exception;
}
