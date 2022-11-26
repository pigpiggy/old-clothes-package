package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.MessageVO;

@Mapper
@Repository
public interface MessageDAO {
	void insertMessage(MessageVO message) throws Exception;
	void insertSBMessage(MessageVO message) throws Exception;
	List<MessageVO> uRecvMessage(Map map) throws Exception;
	List<MessageVO> bRecvMessage(Map map) throws Exception;
	List<MessageVO> uSendMessage(Map map) throws Exception;
	List<MessageVO> bSendMessage(Integer mno) throws Exception;
	void deleteMessage(Integer mno) throws Exception;
	MessageVO uRecvViewMessage(Integer mno) throws Exception;
	MessageVO bRecvViewMessage(Integer mno) throws Exception;
	MessageVO uSendViewMessage(Integer mno) throws Exception;
	MessageVO bSendViewMessage(Integer mno) throws Exception;
	Integer selectRmessageCount(Integer recvUserno) throws Exception;
	Integer selectSmessageCount(Integer sendUserno) throws Exception;
	
	//업체
	Business mypageBusiness(Integer bno)throws Exception;

}
