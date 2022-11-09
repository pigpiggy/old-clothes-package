package com.kosta.clothes.bean;

public class Donation {
	private Long bno; //기부업체 등록 번호순서
	private String dname; //기부업체 이름
	private String daddress; //기부업체 주소
	private String dphone; //기부업체 전화번호
	private double lngx; //좌표 위도
	private double laty; //좌표 경도
	public Long getBno() {
		return bno;
	}
	public void setBno(Long bno) {
		this.bno = bno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDaddress() {
		return daddress;
	}
	public void setDaddress(String daddress) {
		this.daddress = daddress;
	}
	public String getDphone() {
		return dphone;
	}
	public void setDphone(String dphone) {
		this.dphone = dphone;
	}
	public double getLngx() {
		return lngx;
	}
	public void setLngx(double lngx) {
		this.lngx = lngx;
	}
	public double getLaty() {
		return laty;
	}
	public void setLaty(double laty) {
		this.laty = laty;
	}
	public Donation(Long bno, String dname, String daddress, String dphone, double lngx, double laty) {
		super();
		this.bno = bno;
		this.dname = dname;
		this.daddress = daddress;
		this.dphone = dphone;
		this.lngx = lngx;
		this.laty = laty;
	}
	@Override
	public String toString() {
		return "Donation [bno=" + bno + ", dname=" + dname + ", daddress=" + daddress + ", dphone=" + dphone + ", lngx="
				+ lngx + ", laty=" + laty + "]";
	}


	
	
}
