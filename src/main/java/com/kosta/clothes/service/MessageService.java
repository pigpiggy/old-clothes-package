package com.kosta.clothes.service;

import com.kosta.clothes.bean.MessageVO;

public interface MessageService {
	String submitMessage(MessageVO message) throws Exception;
}
