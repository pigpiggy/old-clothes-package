package com.kosta.clothes.bean;

import java.sql.Date;

public class Free {
	private Integer fno;	//글 번호
	private String fname; //닉네임
	private String ftitle; //제목
	private String fcontent; //내용
	private Long freadcount; //조회수 
	private Date regdate; //날짜
	private Integer bno; //업체랑 연결 시킬 변수
	private Integer userno; //개인이랑 연결 시킬 변수
	
	public Integer getFno() {
		return fno;
	}
	public void setFno(Integer fno) {
		this.fno = fno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	public String getFcontent() {
		return fcontent;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public Long getFreadcount() {
		return freadcount;
	}
	public void setFreadcount(Long freadcount) {
		this.freadcount = freadcount;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
		
	}
	public Free(Integer fno, String fname, String ftitle, String fcontent, Long freadcount, Date regdate, Integer bno,
			Integer userno) {
		super();
		this.fno = fno;
		this.fname = fname;
		this.ftitle = ftitle;
		this.fcontent = fcontent;
		this.freadcount = freadcount;
		this.regdate = regdate;
		this.bno = bno;
		this.userno = userno;
	}
	public Free() {
		super();
	}
	@Override
	public String toString() {
		return "Free [fno=" + fno + ", fname=" + fname + ", ftitle=" + ftitle + ", fcontent=" + fcontent
				+ ", freadcount=" + freadcount + ", regdate=" + regdate + ", bno=" + bno + ", userno=" + userno + "]";
	}
}
	