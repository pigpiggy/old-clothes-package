package com.kosta.clothes.bean;

import java.sql.Timestamp;

import lombok.Data;

public @Data class ChatRoom {

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
	private String senderId;
	
	public ChatRoom() {
		// TODO Auto-generated constructor stub
	}
	
	public ChatRoom(String content, String senderName, String sendTime, String senderId) {
		this.content = content;
		this.senderName = senderName;
		this.sendTime = sendTime;
		this.senderId = senderId;
	}

	public ChatRoom(Integer chatno, Integer ino, Integer sellerno, Integer buyerno, String fileName,
			Timestamp createdDate, String sellerName, String buyerName, int chatReadBuy, int chatReadSell) {
		super();
		this.chatno = chatno;
		this.ino = ino;
		this.sellerno = sellerno;
		this.buyerno = buyerno;
		this.fileName = fileName;
		this.createdDate = createdDate;
		this.sellerName = sellerName;
		this.buyerName = buyerName;
		this.chatReadBuy = chatReadBuy;
		this.chatReadSell = chatReadSell;
	}
	
	
}
