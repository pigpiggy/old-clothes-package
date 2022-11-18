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
	private Date regDate;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Review() {
		super();
	}
	public Review(Integer rno, String rcontent, Integer userno, Integer sno, Integer bno, Integer ino, Long rstar,
			Date regDate) {
		super();
		this.rno = rno;
		this.rcontent = rcontent;
		this.userno = userno;
		this.sno = sno;
		this.bno = bno;
		this.ino = ino;
		this.rstar = rstar;
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "Review [rno=" + rno + ", rcontent=" + rcontent + ", userno=" + userno + ", sno=" + sno + ", bno=" + bno
				+ ", ino=" + ino + ", rstar=" + rstar + ", regDate=" + regDate + "]";
	}
	
	
}
