package com.kosta.clothes.bean;

import java.sql.Timestamp;

import lombok.Data;

public @Data class ChatList {

	private Integer chatno;
	private Integer ino;
	private Integer sellerno;
	private Integer buyerno;
	private String fileName;
	private Timestamp createdDate;
	private String sellerName;
	private String buyerName;
	private int chatReadBuy;
	private int chatReadSell;
	private String ititle;

	//not in DB
	private String content;
	private String sendTime;
	private String senderName;

	public ChatList() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
