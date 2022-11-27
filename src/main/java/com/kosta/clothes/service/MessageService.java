package com.kosta.clothes.service;

import java.util.List;
import java.util.Map;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.MessageVO;
import com.kosta.clothes.bean.PageInfo;

public interface MessageService {
	//쪽지 보내기
	String submitMessage(MessageVO message, String sect) throws Exception;
	//
	List<MessageVO> uRecvMessage(Map map) throws Exception;
	List<MessageVO> bRecvMessage(Map map) throws Exception;
	List<MessageVO> uSendMessage(Integer sendUserno, Integer spage, PageInfo pageInfo) throws Exception;
	List<MessageVO> bSendMessage(Integer sendUserno, Integer spage, PageInfo pageInfo) throws Exception;
	void deleteMessage(Integer mno) throws Exception;
	MessageVO uRecvViewMessage(Integer mno) throws Exception;
	MessageVO bRecvViewMessage(Integer mno) throws Exception;
	MessageVO uSendViewMessage(Integer mno) throws Exception;
	MessageVO bSendViewMessage(Integer mno) throws Exception;
	
	//업체
	Business mypageBusiness(Integer bno) throws Exception;  
	
}
