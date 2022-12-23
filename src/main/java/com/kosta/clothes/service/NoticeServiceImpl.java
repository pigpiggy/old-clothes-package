package com.kosta.clothes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Notice;
import com.kosta.clothes.bean.PageInfo;
import com.kosta.clothes.dao.NoticeDAO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	NoticeDAO noticeDao;

	//글 전체 개수 및 목록(as페이징)
	@Override
	public List<Notice> getNoticeList(int page, PageInfo pageInfo) throws Exception {
		int listCount = noticeDao.selectNoticeCount(); //전체 데이터 개수 가져오기 (전체 게시글 수)
		int maxPage = (int)Math.ceil((double)listCount/10);  
		int startPage = page/10 * 10 + 1; 
		int endPage = startPage + 10 -1; 
		if(endPage > maxPage) { 
			endPage = maxPage;			
		}
		
		//pageInfo에 데이터 전달
		pageInfo.setPage(page); 
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		//검색한 페이지의 시작 페이지 값을 구한 변수 
		int row = (page - 1) * 10 + 1; //ex) (5페이지 -1) * 10 + 1 => 41
		return noticeDao.selectNoticeList(row);
	}
		
		//글 클릭하면 num으로 정보값들 가져오기
	@Override
	public Notice getNotice(Integer notice_num) throws Exception {
		return noticeDao.selectNotice(notice_num);
	}
	
	//조회수 증가
	@Override
	public void  Noticehit(Integer nreadcount) throws Exception {
		 noticeDao.hitNotice(nreadcount);
	}
	
	//검색했을때 페이징
	@Override
	public List<Notice> getNoticeList(String kwd, int page, PageInfo pageInfo) throws Exception {
		int listCount =  noticeDao.searchedNoticeCount(kwd); //전체 데이터 개수 가져오기 (전체 게시글 수)
		int maxPage = (int)Math.ceil((double)listCount/10);  
		int startPage = page/10 * 10 + 1; 
		int endPage = startPage + 10 -1; 
		if(endPage > maxPage) { 
			endPage = maxPage; 
		}
		
		//pageInfo에 데이터 전달
		pageInfo.setPage(page); 
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		//검색한 페이지의 시작 페이지 값을 구한 변수 
		Integer row = (page - 1) * 10 + 1; //ex) (5페이지 -1) * 10 + 1 => 41
		return noticeDao.searchedNoticeList(kwd, row);
	}
	}

