package com.kosta.clothes.bean;

import java.sql.Timestamp;

import lombok.Data;

public class ChatRoom {

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

	public Integer getChatno() {
		return chatno;
	}

	public void setChatno(Integer chatno) {
		this.chatno = chatno;
	}

	public Integer getIno() {
		return ino;
	}

	public void setIno(Integer ino) {
		this.ino = ino;
	}

	public Integer getSellerno() {
		return sellerno;
	}

	public void setSellerno(Integer sellerno) {
		this.sellerno = sellerno;
	}

	public Integer getBuyerno() {
		return buyerno;
	}

	public void setBuyerno(Integer buyerno) {
		this.buyerno = buyerno;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public String getBuyerName() {
		return buyerName;
	}

	public void setBuyerName(String buyerName) {
		this.buyerName = buyerName;
	}

	public int getChatReadBuy() {
		return chatReadBuy;
	}

	public void setChatReadBuy(int chatReadBuy) {
		this.chatReadBuy = chatReadBuy;
	}

	public int getChatReadSell() {
		return chatReadSell;
	}

	public void setChatReadSell(int chatReadSell) {
		this.chatReadSell = chatReadSell;
	}

	public String getItitle() {
		return ititle;
	}

	public void setItitle(String ititle) {
		this.ititle = ititle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSendTime() {
		return sendTime;
	}

	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getSenderId() {
		return senderId;
	}

	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	
	
}
