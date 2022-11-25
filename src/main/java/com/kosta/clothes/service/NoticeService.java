package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Notice;
import com.kosta.clothes.bean.PageInfo;

public interface NoticeService {

	List<Notice> getNoticeList(int page, PageInfo pageInfo) throws Exception; // 글 전체 개수(as페이징)

	Notice getNotice(Integer notice_num) throws Exception;// 글 정보 가져오기 num 으로
	 
	void Noticehit(Integer nreadcount) throws Exception; //조회수 증가
	
	List<Notice> getNoticeList(String kwd, int page, PageInfo pageInfo) throws Exception; //검색기능
}
