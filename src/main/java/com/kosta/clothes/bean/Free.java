package com.kosta.clothes.bean;

import java.sql.Date;

public class Free {
	private int free_num;	//글 번호
	private String free_name; //닉네임
	private String free_title; //제목
	private String free_content; //내용
	private int free_readcount; //조회수 
	private Date free_date; //날짜
	
	public int getFree_num() {
		return free_num;
	}
	public void setFree_num(int free_num) {
		this.free_num = free_num;
	}
	public String getFree_name() {
		return free_name;
	}
	public void setFree_name(String free_name) {
		this.free_name = free_name;
	}
	public String getFree_title() {
		return free_title;
	}
	public void setFree_title(String free_title) {
		this.free_title = free_title;
	}
	public String getFree_content() {
		return free_content;
	}
	public void setFree_content(String free_content) {
		this.free_content = free_content;
	}
	public int getFree_readcount() {
		return free_readcount;
	}
	public void setFree_readcount(int free_readcount) {
		this.free_readcount = free_readcount;
	}
	public Date getFree_date() {
		return free_date;
	}
	public void setFree_date(Date free_date) {
		this.free_date = free_date;
	}
	
}
