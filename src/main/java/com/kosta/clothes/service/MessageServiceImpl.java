package com.kosta.clothes.service;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.MessageVO;
import com.kosta.clothes.bean.PageInfo;
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
	public List<MessageVO> uSendMessage(Integer sendUserno, Integer page, PageInfo pageInfo) throws Exception {
		int listCount = messageDAO.selectMessageCount(); //전체 데이터 개수 가져오기 (전체 게시글 수)
		int maxPage = (int)Math.ceil((double)listCount/10);  
		int startPage = page/10 * 10 + 1; 
		int endPage = startPage + 10 -1; 
		if(endPage > maxPage) { 
			endPage = maxPage; 
		}
		
		//pageInfo에 데이터 전달
		pageInfo.setPage(page); 
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		//검색한 페이지의 시작 페이지 값을 구한 변수 
		int row = (page - 1) * 10 + 1; //ex) (5페이지 -1) * 10 + 1 => 41
		return messageDAO.uSendMessage(sendUserno);
	}

	@Override
	public List<MessageVO> bSendMessage(Integer sendUserno, Integer page, PageInfo pageInfo) throws Exception {
		return messageDAO.bSendMessage(sendUserno);
	}

	@Override
	public void deleteMessage(Integer mno) throws Exception {
		messageDAO.deleteMessage(mno);
	}

	@Override
	public MessageVO uRecvViewMessage(Integer mno) throws Exception {
		return messageDAO.uRecvViewMessage(mno);
	}

	@Override
	public MessageVO bRecvViewMessage(Integer mno) throws Exception {
		return messageDAO.bRecvViewMessage(mno);
	}

	@Override
	public MessageVO uSendViewMessage(Integer mno) throws Exception {
		return messageDAO.uSendViewMessage(mno);
	}

	@Override
	public MessageVO bSendViewMessage(Integer mno) throws Exception {
		return messageDAO.bSendViewMessage(mno);
	}




}
