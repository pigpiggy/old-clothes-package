package com.kosta.clothes.bean;

import java.sql.Date;

public class FileVO {
	private Integer tid;
	private String directory_name;
	private String tname;
	private Long tsize;
	private String content_type;
	private Date upload_date;
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
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
	public FileVO(Integer tid, String directory_name, String tname, Long tsize, String content_type, Date upload_date) {
		super();
		this.tid = tid;
		this.directory_name = directory_name;
		this.tname = tname;
		this.tsize = tsize;
		this.content_type = content_type;
		this.upload_date = upload_date;
	}
	
	@Override
	public String toString() {
		return "FileVO [tid=" + tid + ", directory_name=" + directory_name + ", tname=" + tname + ", tsize=" + tsize
				+ ", content_type=" + content_type + ", upload_date=" + upload_date + "]";
	}
	
}
