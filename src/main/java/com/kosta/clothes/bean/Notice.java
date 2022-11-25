package com.kosta.clothes.bean;

import java.sql.Date;

public class Notice {
	private Integer nno;	//글 번호
	private String ntitle; //제목
	private String ncontent; //내용
	private Integer nreadcount; //조회수 
	private Date regdate;//날짜
	
	public Integer getNno() {
		return nno;
	}
	public void setNno(Integer nno) {
		this.nno = nno;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public Integer getNreadcount() {
		return nreadcount;
	}
	public void setNreadcount(Integer nreadcount) {
		this.nreadcount = nreadcount;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Notice(Integer nno, String ntitle, String ncontent, Integer nreadcount, Date regdate) {
		super();
		this.nno = nno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nreadcount = nreadcount;
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "Notice [nno=" + nno + ", ntitle=" + ntitle + ", ncontent=" + ncontent + ", nreadcount=" + nreadcount
				+ ", regdate=" + regdate + "]";
	} 
}
	