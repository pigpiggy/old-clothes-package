package com.kosta.clothes.bean;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Sharing {
	private Long sid;
	private String sname;
	private String stitle;
	private String scontent;
	private String image;
	private String sstatus;
	private int grade;
	private int ai;
	private String addressCity;
	private String addressTown;
	private Date regDate;
	private MultipartFile simagefile;
	
	public Long getSid() {
		return sid;
	}
	public void setSid(Long sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSstatus() {
		return sstatus;
	}
	public void setSstatus(String sstatus) {
		this.sstatus = sstatus;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getAi() {
		return ai;
	}
	public void setAi(int ai) {
		this.ai = ai;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public MultipartFile getSimagefile() {
		return simagefile;
	}
	public void setSimagefile(MultipartFile simagefile) {
		this.simagefile = simagefile;
	}

	
	
}
