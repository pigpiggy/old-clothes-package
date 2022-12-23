package com.kosta.clothes.dao;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Notice;


@Mapper
@Repository
public interface NoticeDAO {
	
	Integer selectNoticeCount() throws Exception;//등록된 글의 총 개수(as페이징)

	List<Notice> selectNoticeList(Integer row) throws Exception;//전체 글 목록 조회(as페이징)
	
	void hitNotice(Integer nno) throws Exception; //조회수증가
	
	Notice selectNotice(Integer nno) throws Exception; // num으로 값 가져오기
	
	Integer selectMaxNoticeNum() throws Exception; // 최근 번호 가져오기

	List<Notice> selectNoticeSearchedList(String kwd)throws Exception; //검색기능
	
	Integer searchedNoticeCount(String kwd) throws Exception;//검색된 글의 총 개수(as페이징)
	
	List<Notice> searchedNoticeList(String kwd, Integer row) throws Exception;//검색된 글 목록 조회(as페이징)
}
