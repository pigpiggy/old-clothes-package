package com.kosta.clothes.bean;

import java.sql.Date;

public class Sell {
	private Integer ino;
	private String ititle;
	private String icontent;
	private String istatus;
	private String ifileids;
	private String addressCity;
	private String addressTown;
	private String idealType;
	private Date regDate;
	private Long likes;
	private Long selectedno;
	private Long applycount;
	private Integer userno;
	private Long price;
	public Integer getIno() {
		return ino;
	}
	public void setIno(Integer ino) {
		this.ino = ino;
	}
	public String getItitle() {
		return ititle;
	}
	public void setItitle(String ititle) {
		this.ititle = ititle;
	}
	public String getIcontent() {
		return icontent;
	}
	public void setIcontent(String icontent) {
		this.icontent = icontent;
	}
	public String getIstatus() {
		return istatus;
	}
	public void setIstatus(String istatus) {
		this.istatus = istatus;
	}
	public String getIfileids() {
		return ifileids;
	}
	public void setIfileids(String ifileids) {
		this.ifileids = ifileids;
	}
	public String getAddressCity() {
		return addressCity;
	}
	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}
	public String getAddressTown() {
		return addressTown;
	}
	public void setAddressTown(String addressTown) {
		this.addressTown = addressTown;
	}
	public String getIdealType() {
		return idealType;
	}
	public void setIdealType(String idealType) {
		this.idealType = idealType;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Long getLikes() {
		return likes;
	}
	public void setLikes(Long likes) {
		this.likes = likes;
	}
	public Long getSelectedno() {
		return selectedno;
	}
	public void setSelectedno(Long selectedno) {
		this.selectedno = selectedno;
	}
	public Long getApplycount() {
		return applycount;
	}
	public void setApplycount(Long applycount) {
		this.applycount = applycount;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Sell() {
		super();
	}
	public Sell(Integer ino, String ititle, String icontent, String istatus, String ifileids, String addressCity,
			String addressTown, String idealType, Date regDate, Long likes, Long selectedno, Long applycount,
			Integer userno, Long price) {
		super();
		this.ino = ino;
		this.ititle = ititle;
		this.icontent = icontent;
		this.istatus = istatus;
		this.ifileids = ifileids;
		this.addressCity = addressCity;
		this.addressTown = addressTown;
		this.idealType = idealType;
		this.regDate = regDate;
		this.likes = likes;
		this.selectedno = selectedno;
		this.applycount = applycount;
		this.userno = userno;
		this.price = price;
	}
	@Override
	public String toString() {
		return "Sell [ino=" + ino + ", ititle=" + ititle + ", icontent=" + icontent + ", istatus=" + istatus
				+ ", ifileids=" + ifileids + ", addressCity=" + addressCity + ", addressTown=" + addressTown
				+ ", idealType=" + idealType + ", regDate=" + regDate + ", likes=" + likes + ", selectedno="
				+ selectedno + ", applycount=" + applycount + ", userno=" + userno + ", price=" + price + "]";
	}

	
}
