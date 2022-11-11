package com.kosta.clothes.bean;

public class Trash {
	private String sido;
	private String sigungu;
	private String myeondong;
	private String oldcloaddress;
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getMyeondong() {
		return myeondong;
	}
	public void setMyeondong(String myeondong) {
		this.myeondong = myeondong;
	}
	public String getOldcloaddress() {
		return oldcloaddress;
	}
	public void setOldcloaddress(String oldcloaddress) {
		this.oldcloaddress = oldcloaddress;
	}
	public Trash() {
		super();
	}
	public Trash(String sido, String sigungu, String myeondong, String oldcloaddress) {
		super();
		this.sido = sido;
		this.sigungu = sigungu;
		this.myeondong = myeondong;
		this.oldcloaddress = oldcloaddress;
	}
	@Override
	public String toString() {
		return "Trash [sido=" + sido + ", sigungu=" + sigungu + ", myeondong=" + myeondong + ", oldcloaddress="
				+ oldcloaddress + "]";
	}

	
}
