package com.kosta.clothes.service;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.MessageVO;
import com.kosta.clothes.dao.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	MessageDAO messageDAO;
	
	@Autowired
	ServletContext servletContext;
	
	@Override
	public String submitMessage(MessageVO message) throws Exception {
		messageDAO.insertMessage(message);
		System.out.println("messageservice:" + message);
		return "true";
	}

	@Override
	public List<MessageVO> uRecvMessage(Map map) throws Exception {
		return messageDAO.uRecvMessage(map);
	}

	@Override
	public List<MessageVO> bRecvMessage(Map map) throws Exception {
		return messageDAO.bRecvMessage(map);
	}

	@Override
	public List<MessageVO> uSendMessage(Integer sendUserno) throws Exception {
		return messageDAO.uSendMessage(sendUserno);
	}

	@Override
	public List<MessageVO> bSendMessage(Integer sendUserno) throws Exception {
		return messageDAO.bSendMessage(sendUserno);
	}

	@Override
	public void deleteMessage(Integer mno) throws Exception {
		messageDAO.deleteMessage(mno);
	}

}
