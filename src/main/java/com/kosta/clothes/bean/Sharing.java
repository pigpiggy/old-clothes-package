package com.kosta.clothes.bean;

import java.sql.Date;

public class Sharing {
	private Integer sno;
	private String stitle;
	private String scontent;
	private String sstatus;
	private String sname;
	private String sfileids;
	private String sdealType;
	private String saddress;
	private Long likes;
	private Long selectedno;
	private Long applycount;
	private Integer userno;
	private Date regDate;
	private Long sellCompletedCount;
	private Long buyCompletedCount;
	private String nickname;
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	public String getStitle() {
		return stitle;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	public String getScontent() {
		return scontent;
	}
	public void setScontent(String scontent) {
		this.scontent = scontent;
	}
	public String getSstatus() {
		return sstatus;
	}
	public void setSstatus(String sstatus) {
		this.sstatus = sstatus;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSfileids() {
		return sfileids;
	}
	public void setSfileids(String sfileids) {
		this.sfileids = sfileids;
	}
	public String getSdealType() {
		return sdealType;
	}
	public void setSdealType(String sdealType) {
		this.sdealType = sdealType;
	}
	public String getSaddress() {
		return saddress;
	}
	public void setSaddress(String saddress) {
		this.saddress = saddress;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Sharing() {
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
	public Sharing(Integer sno, String stitle, String scontent, String sstatus, String sname, String sfileids,
			String sdealType, String saddress, Long likes, Long selectedno, Long applycount, Integer userno,
			Date regDate, Long sellCompletedCount, Long buyCompletedCount) {
		super();
		this.sno = sno;
		this.stitle = stitle;
		this.scontent = scontent;
		this.sstatus = sstatus;
		this.sname = sname;
		this.sfileids = sfileids;
		this.sdealType = sdealType;
		this.saddress = saddress;
		this.likes = likes;
		this.selectedno = selectedno;
		this.applycount = applycount;
		this.userno = userno;
		this.regDate = regDate;
		this.sellCompletedCount = sellCompletedCount;
		this.buyCompletedCount = buyCompletedCount;
	}
	@Override
	public String toString() {
		return "Sharing [sno=" + sno + ", stitle=" + stitle + ", scontent=" + scontent + ", sstatus=" + sstatus
				+ ", sname=" + sname + ", sfileids=" + sfileids + ", sdealType=" + sdealType + ", saddress=" + saddress
				+ ", likes=" + likes + ", selectedno=" + selectedno + ", applycount=" + applycount + ", userno="
				+ userno + ", regDate=" + regDate + ", sellCompletedCount=" + sellCompletedCount
				+ ", buyCompletedCount=" + buyCompletedCount + "]";
	}

		
}
