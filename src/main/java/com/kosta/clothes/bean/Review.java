package com.kosta.clothes.bean;

import java.sql.Date;

public class Review {
	private Integer rno;
	private String rcontent;
	private Integer userno;
	private Integer sno;
	private Integer bno;
	private Integer ino;
	private Long rstar;
	private Date regdate;
	private String stitle;
	private String sdealtype;
	private String ititle;
	private String idealtype;
	private String nickname;
	public Integer getRno() {
		return rno;
	}
	public void setRno(Integer rno) {
		this.rno = rno;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public Integer getIno() {
		return ino;
	}
	public void setIno(Integer ino) {
		this.ino = ino;
	}
	public Long getRstar() {
		return rstar;
	}
	public void setRstar(Long rstar) {
		this.rstar = rstar;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public String getItitle() {
		return ititle;
	}
	public void setItitle(String ititle) {
		this.ititle = ititle;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getSdealtype() {
		return sdealtype;
	}
	public void setSdealtype(String sdealtype) {
		this.sdealtype = sdealtype;
	}
	public String getIdealtype() {
		return idealtype;
	}
	public void setIdealtype(String idealtype) {
		this.idealtype = idealtype;
	}
	public Review() {
		super();
	}
	public Review(Integer rno, String rcontent, Integer userno, Integer sno, Integer bno, Integer ino, Long rstar,
			Date regdate, String stitle, String sdealtype, String ititle, String idealtype, String nickname) {
		super();
		this.rno = rno;
		this.rcontent = rcontent;
		this.userno = userno;
		this.sno = sno;
		this.bno = bno;
		this.ino = ino;
		this.rstar = rstar;
		this.regdate = regdate;
		this.stitle = stitle;
		this.sdealtype = sdealtype;
		this.ititle = ititle;
		this.idealtype = idealtype;
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "Review [rno=" + rno + ", rcontent=" + rcontent + ", userno=" + userno + ", sno=" + sno + ", bno=" + bno
				+ ", ino=" + ino + ", rstar=" + rstar + ", regdate=" + regdate + ", stitle=" + stitle + ", sdealtype="
				+ sdealtype + ", ititle=" + ititle + ", idealtype=" + idealtype + ", nickname=" + nickname + "]";
	}

}
