package com.kosta.clothes.service;

import java.util.List;
import java.util.Map;

import com.kosta.clothes.bean.MessageVO;

public interface MessageService {
	String submitMessage(MessageVO message) throws Exception;
	List<MessageVO> uRecvMessage(Map map) throws Exception;
	List<MessageVO> bRecvMessage(Map map) throws Exception;
	List<MessageVO> uSendMessage(Integer sendUserno) throws Exception;
	List<MessageVO> bSendMessage(Integer sendUserno) throws Exception;
	void deleteMessage(Integer mno) throws Exception;

}
