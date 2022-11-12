package com.kosta.clothes.bean;

public class Individual {
	private Integer ino;
	private String iname;
	private String ititle;
	private String icontent;
	private String istatus;
	private String ifileids;
	private String addressCity;
	private String addressTown;
	private Long ai;
	private String idealtype;
	private String regdate;
	private Long likes;
	private Long selectedno;
	private Long applycount;
	private Long userno;
	private Long price;
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
	public Long getAi() {
		return ai;
	}
	public void setAi(Long ai) {
		this.ai = ai;
	}
	public String getIdealtype() {
		return idealtype;
	}
	public void setIdealtype(String idealtype) {
		this.idealtype = idealtype;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
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
	public Long getUserno() {
		return userno;
	}
	public void setUserno(Long userno) {
		this.userno = userno;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Individual(Integer ino, String iname, String ititle, String icontent, String istatus, String ifileids,
			String addressCity, String addressTown, Long ai, String idealtype, String regdate, Long likes,
			Long selectedno, Long applycount, Long userno, Long price) {
		super();
		this.ino = ino;
		this.iname = iname;
		this.ititle = ititle;
		this.icontent = icontent;
		this.istatus = istatus;
		this.ifileids = ifileids;
		this.addressCity = addressCity;
		this.addressTown = addressTown;
		this.ai = ai;
		this.idealtype = idealtype;
		this.regdate = regdate;
		this.likes = likes;
		this.selectedno = selectedno;
		this.applycount = applycount;
		this.userno = userno;
		this.price = price;
	}
	public Individual() {
		super();
	}
	
	
	
}
