package com.kosta.clothes.bean;

import java.sql.Date;

public class Users {
	private Long id; // 번호(가입 회원 수)
	private String email; //이메일(아이디)
	private String name; //닉네임
	private String password; //비밀 번호
	private String sect; //구분(개인/업체)
	private Long bno; //업체 번호
	private Date joinDate; //날짜
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSect() {
		return sect;
	}
	public void setSect(String sect) {
		this.sect = sect;
	}
	
	public Long getBno() {
		return bno;
	}
	public void setBno(Long bno) {
		this.bno = bno;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Users(Long id, String email, String name, String password, String sect, Long bno, Date joinDate) {
		super();
		this.id = id;
		this.email = email;
		this.name = name;
		this.password = password;
		this.sect = sect;
		this.bno = bno;
		this.joinDate = joinDate;
	}
	public Users() {
		super();
	}
	
	
}
