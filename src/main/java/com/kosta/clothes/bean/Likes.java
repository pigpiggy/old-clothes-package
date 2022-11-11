package com.kosta.clothes.bean;

public class Likes {
	private Integer likesno;
	private Long userno; //authUser
	private Long sno;
	private Long ino;
	private Long bno;
	private Long likescheck; //좋아요 중복방지
	public Integer getLikesno() {
		return likesno;
	}
	public void setLikesno(Integer likesno) {
		this.likesno = likesno;
	}
	public Long getUserno() {
		return userno;
	}
	public void setUserno(Long userno) {
		this.userno = userno;
	}
	public Long getSno() {
		return sno;
	}
	public void setSno(Long sno) {
		this.sno = sno;
	}
	public Long getIno() {
		return ino;
	}
	public void setIno(Long ino) {
		this.ino = ino;
	}
	public Long getBno() {
		return bno;
	}
	public void setBno(Long bno) {
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
	public Likes(Integer likesno, Long userno, Long sno, Long ino, Long bno, Long likescheck) {
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
		return "Likes [likesno=" + likesno + ", userno=" + userno + ", sno=" + sno + ", ino=" + ino + ", bno=" + bno
				+ ", likescheck=" + likescheck + "]";
	}
	
	
}
