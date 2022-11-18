package com.kosta.clothes.bean;

public class Wapply {
	private Integer wno;
	private Integer wuserno;
	private Integer sno;
	private Integer ino;
	public Integer getWno() {
		return wno;
	}
	public void setWno(Integer wno) {
		this.wno = wno;
	}
	public Integer getWuserno() {
		return wuserno;
	}
	public void setWuserno(Integer wuserno) {
		this.wuserno = wuserno;
	}
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	public Integer getIno() {
		return ino;
	}
	public void setIno(Integer ino) {
		this.ino = ino;
	}
	public Wapply() {
		super();
	}
	public Wapply(Integer wno, Integer wuserno, Integer sno, Integer ino) {
		super();
		this.wno = wno;
		this.wuserno = wuserno;
		this.sno = sno;
		this.ino = ino;
	}
	@Override
	public String toString() {
		return "Wapply [wno=" + wno + ", wuserno=" + wuserno + ", sno=" + sno + ", ino=" + ino + "]";
	}
	
	
}
