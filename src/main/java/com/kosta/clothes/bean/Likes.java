package com.kosta.clothes.bean;

public class Likes {
	private Integer likesno;
	private Integer userno; //authUser
	private Integer sno;
	private Integer ino;
	private Integer bno;
	private Long likescheck; //좋아요 중복방지
	public Integer getLikesno() {
		return likesno;
	}
	public void setLikesno(Integer likesno) {
		this.likesno = likesno;
	}
	public Integer getUserno() {
		return userno;
	}
	public void setUserno(Integer userno) {
		this.userno = userno;
	}
	public Integer getSno() {
		return sno;
	}
	public void setSno(Integer sno) {
		this.sno = sno;
	}
	public Integer getIno() {
		return ino;
	}
	public void setIno(Integer ino) {
		this.ino = ino;
	}
	public Integer getBno() {
		return bno;
	}
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	public Long getLikescheck() {
		return likescheck;
	}
	public void setLikescheck(Long likescheck) {
		this.likescheck = likescheck;
	}
	public Likes() {
		super();
	}
	public Likes(Integer likesno, Integer userno, Integer sno, Integer ino, Integer bno, Long likescheck) {
		super();
		this.likesno = likesno;
		this.userno = userno;
		this.sno = sno;
		this.ino = ino;
		this.bno = bno;
		this.likescheck = likescheck;
	}
	@Override
	public String toString() {
		return "Likes [bno=" + bno + ", likescheck=" + likescheck + "]";
	}
	
	
	
	
}
