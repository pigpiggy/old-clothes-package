package com.kosta.clothes.service;

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

}
