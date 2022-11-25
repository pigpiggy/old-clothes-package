package com.kosta.clothes.bean;

import java.sql.Date;

public class MessageVO {
	private Integer mno;
	private String mtitle;
	private String mcontent;
	private Date regDate;
	private Integer sendUserno;
	private Integer recvUserno;
	private Integer sendBno;
	private Integer recvBno;
	private Long readChk;
	private String nickname;
	public Integer getMno() {
		return mno;
	}
	public void setMno(Integer mno) {
		this.mno = mno;
	}
	public String getMtitle() {
		return mtitle;
	}
	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}
	public String getMcontent() {
		return mcontent;
	}
	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Integer getSendUserno() {
		return sendUserno;
	}
	public void setSendUserno(Integer sendUserno) {
		this.sendUserno = sendUserno;
	}
	public Integer getRecvUserno() {
		return recvUserno;
	}
	public void setRecvUserno(Integer recvUserno) {
		this.recvUserno = recvUserno;
	}
	public Integer getSendBno() {
		return sendBno;
	}
	public void setSendBno(Integer sendBno) {
		this.sendBno = sendBno;
	}
	public Integer getRecvBno() {
		return recvBno;
	}
	public void setRecvBno(Integer recvBno) {
		this.recvBno = recvBno;
	}
	public Long getReadChk() {
		return readChk;
	}
	public void setReadChk(Long readChk) {
		this.readChk = readChk;
	}
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public MessageVO() {
		super();
	}
	public MessageVO(Integer mno, String mtitle, String mcontent, Date regDate, Integer sendUserno, Integer recvUserno,
			Long readChk) {
		super();
		this.mno = mno;
		this.mtitle = mtitle;
		this.mcontent = mcontent;
		this.regDate = regDate;
		this.sendUserno = sendUserno;
		this.recvUserno = recvUserno;
		this.readChk = readChk;
	}
	@Override
	public String toString() {
		return "MessageVO [mno=" + mno + ", mtitle=" + mtitle + ", mcontent=" + mcontent + ", regDate=" + regDate
				+ ", sendUserno=" + sendUserno + ", recvUserno=" + recvUserno + ", readChk=" + readChk + ", nickname="
				+ nickname + "]";
	}
	
	
	
	
}
