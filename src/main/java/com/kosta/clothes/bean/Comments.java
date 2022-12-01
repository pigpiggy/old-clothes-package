package com.kosta.clothes.bean;

public class Comments {
	  private Integer cno;
	  private String cname;
	  private String ccontent; 
	  private String regdate;
	  private String csect;
	  private Integer sno;
	  private Integer fno;
	  private Integer ino;
	  private Integer bno;
	  private Integer userno;
	  
	public Integer getCno() {
		return cno;
	}
	public void setCno(Integer cno) {
		this.cno = cno;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	public String getCsect() {
		return csect;
	}
	public void setCsect(String csect) {
		this.csect = csect;
	}
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	public Integer getFno() {
		return fno;
	}
	public void setFno(Integer fno) {
		this.fno = fno;
	}
	public Integer getIno() {
		return ino;
	}
	public void setIno(Integer ino) {
		this.ino = ino;
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
	
	
	public Comments(Integer cno, String cname, String ccontent, String regdate, String csect, Integer sno, Integer fno,
			Integer ino, Integer bno, Integer userno) {
		super();
		this.cno = cno;
		this.cname = cname;
		this.ccontent = ccontent;
		this.regdate = regdate;
		this.csect = csect;
		this.sno = sno;
		this.fno = fno;
		this.ino = ino;
		this.bno = bno;
		this.userno = userno;
	}
	public Comments() {
		super();
	}
	@Override
	public String toString() {
		return "Comments [cno=" + cno + ", cname=" + cname + ", ccontent=" + ccontent + ", regdate=" + regdate
				+ ", csect=" + csect + ", sno=" + sno + ", fno=" + fno + ", ino=" + ino + ", bno=" + bno + ", userno="
				+ userno + "]";
	}
	
	  
	  

	  
}
