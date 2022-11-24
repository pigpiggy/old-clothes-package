package com.kosta.clothes.bean;

public class Apply {
	private Integer ano; //신청자 번호
	private String aname; //신청자 이름
	private String aphone;//신청자 전화 번호 
	private Long weight; //신청자 옷 무게
	private String aaddress; //신청자 주소
	private String adetailaddress; //상세주소
	private String apickup; //신청 희망날짜
	private Integer userno; //신청자 번호
	private Integer bno; //업체 번호
	public Integer getAno() {
		return ano;
	}
	public void setAno(Integer ano) {
		this.ano = ano;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAphone() {
		return aphone;
	}
	public void setAphone(String aphone) {
		this.aphone = aphone;
	}
	public Long getWeight() {
		return weight;
	}
	public void setWeight(Long weight) {
		this.weight = weight;
	}
	public String getAaddress() {
		return aaddress;
	}
	public void setAaddress(String aaddress) {
		this.aaddress = aaddress;
	}
	
	
	public String getAdetailaddress() {
		return adetailaddress;
	}
	public void setAdetailaddress(String adetailaddress) {
		this.adetailaddress = adetailaddress;
	}
	public String getApickup() {
		return apickup;
	}
	public void setApickup(String apickup) {
		this.apickup = apickup;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public Apply(Integer ano, String aname, String aphone, Long weight, String aaddress, String adetailaddress,
			String apickup, Integer userno, Integer bno) {
		super();
		this.ano = ano;
		this.aname = aname;
		this.aphone = aphone;
		this.weight = weight;
		this.aaddress = aaddress;
		this.adetailaddress = adetailaddress;
		this.apickup = apickup;
		this.userno = userno;
		this.bno = bno;
	}
	public Apply() {
		super();
	}
	@Override
	public String toString() {
		return "Apply [ano=" + ano + ", aname=" + aname + ", aphone=" + aphone + ", weight=" + weight + ", aaddress="
				+ aaddress + ", adetailaddress=" + adetailaddress + ", apickup=" + apickup + ", userno=" + userno
				+ ", bno=" + bno + "]";
	}
	
	
	
}
