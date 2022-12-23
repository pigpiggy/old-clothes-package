package com.kosta.clothes.bean;

import java.sql.Date;

public class Sell {
	private Integer ino;
	private String iname;
	private String ititle;
	private String icontent;
	private String istatus;
	private String ifileids;
	private String iaddress;
	private String idealType;
	private Date regDate;
	private Long likes;
	private Long selectedno;
	private Long applycount;
	private Integer userno;
	private Long price;
	private Long sellCompletedCount;
	private Long buyCompletedCount;
	private String nickname;
	public Integer getIno() {
		return ino;
	}
	public void setIno(Integer ino) {
		this.ino = ino;
	}
	
	public String getIname() {
		return iname;
	}
	public void setIname(String iname) {
		this.iname = iname;
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
	public String getIaddress() {
		return iaddress;
	}
	public void setIaddress(String iaddress) {
		this.iaddress = iaddress;
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
	public Long getSellCompletedCount() {
		return sellCompletedCount;
	}
	public void setSellCompletedCount(Long sellCompletedCount) {
		this.sellCompletedCount = sellCompletedCount;
	}
	public Long getBuyCompletedCount() {
		return buyCompletedCount;
	}
	public void setBuyCompletedCount(Long buyCompletedCount) {
		this.buyCompletedCount = buyCompletedCount;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Sell(Integer ino, String iname, String ititle, String icontent, String istatus, String ifileids,
			String iaddress, String idealType, Date regDate, Long likes, Long selectedno, Long applycount,
			Integer userno, Long price, Long sellCompletedCount, Long buyCompletedCount) {
		super();
		this.ino = ino;
		this.iname = iname;
		this.ititle = ititle;
		this.icontent = icontent;
		this.istatus = istatus;
		this.ifileids = ifileids;
		this.iaddress = iaddress;
		this.idealType = idealType;
		this.regDate = regDate;
		this.likes = likes;
		this.selectedno = selectedno;
		this.applycount = applycount;
		this.userno = userno;
		this.price = price;
		this.sellCompletedCount = sellCompletedCount;
		this.buyCompletedCount = buyCompletedCount;
	}
	@Override
	public String toString() {
		return "Sell [ino=" + ino + ", iname=" + iname + ", ititle=" + ititle + ", icontent=" + icontent + ", istatus="
				+ istatus + ", ifileids=" + ifileids + ", iaddress=" + iaddress + ", idealType=" + idealType
				+ ", regDate=" + regDate + ", likes=" + likes + ", selectedno=" + selectedno + ", applycount="
				+ applycount + ", userno=" + userno + ", price=" + price + ", sellCompletedCount=" + sellCompletedCount
				+ ", buyCompletedCount=" + buyCompletedCount + "]";
	}

	
}
