package com.kosta.clothes.bean;

import java.sql.Date;

public class FileVO {
	private Integer tno;
	private String directory_name;
	private String tname;
	private Long tsize;
	private Integer sno;
	private Integer ino;
	private String content_type;
	private Date upload_date;
	public Integer getTno() {
		return tno;
	}
	public void setTno(Integer tno) {
		this.tno = tno;
	}
	public String getDirectory_name() {
		return directory_name;
	}
	public void setDirectory_name(String directory_name) {
		this.directory_name = directory_name;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public Long getTsize() {
		return tsize;
	}
	public void setTsize(Long tsize) {
		this.tsize = tsize;
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
	public String getContent_type() {
		return content_type;
	}
	public void setContent_type(String content_type) {
		this.content_type = content_type;
	}
	public Date getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(Date upload_date) {
		this.upload_date = upload_date;
	}
	public FileVO() {
		super();
	}
	public FileVO(Integer tno, String directory_name, String tname, Long tsize, Integer sno, Integer ino,
			String content_type, Date upload_date) {
		super();
		this.tno = tno;
		this.directory_name = directory_name;
		this.tname = tname;
		this.tsize = tsize;
		this.sno = sno;
		this.ino = ino;
		this.content_type = content_type;
		this.upload_date = upload_date;
	}
	@Override
	public String toString() {
		return "FileVO [tno=" + tno + ", directory_name=" + directory_name + ", tname=" + tname + ", tsize=" + tsize
				+ ", sno=" + sno + ", ino=" + ino + ", content_type=" + content_type + ", upload_date=" + upload_date
				+ "]";
	}

}
