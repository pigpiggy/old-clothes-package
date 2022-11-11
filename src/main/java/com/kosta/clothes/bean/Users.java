package com.kosta.clothes.bean;

import java.sql.Date;

//개인 사용자 가입(VO)
public class Users {
	private Integer userno; //번호(가입 회원 수)
	private String userid; //(아이디)
	private String nickname; //닉네임
	private String password; //비밀 번호
	private String phone;//전화 번호
	private Date joinDate; //날짜
	private String sect;


	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getSect() {
		return sect;
	}
	public void setSect(String sect) {
		this.sect = sect;
	}


	public Users(Integer userno, String userid, String nickname, String password, String phone, Date joinDate,
			String sect) {
		super();
		this.userno = userno;
		this.userid = userid;
		this.nickname = nickname;
		this.password = password;
		this.phone = phone;
		this.joinDate = joinDate;
		this.sect = sect;
	}
	public Users() {
		super();
	}
	@Override
	public String toString() {
		return "Users [userno=" + userno + ", userid=" + userid + ", nickname=" + nickname + ", password=" + password
				+ ", phone=" + phone + ", joinDate=" + joinDate + ", sect=" + sect + "]";
	}
	

}
