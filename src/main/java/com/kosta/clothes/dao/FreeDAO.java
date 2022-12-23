package com.kosta.clothes.dao;


import java.util.List;

import com.kosta.clothes.bean.Free;

public interface FreeDAO {
	void insertFree(Free free) throws Exception;//게시판 글 등록
	
	Integer selectFreeCount() throws Exception;//등록된 글의 총 개수(as페이징)

	List<Free> selectFreeList(Integer row) throws Exception;//전체 글 목록 조회(as페이징)
	
	Free hitFree(Integer freadcount)throws Exception; //조회수증가
	
	void updateFree(Free free) throws Exception; // 글 수정
	
	void deleteFree(Integer freeNum) throws Exception; // 글 삭제
	void deleteCmt(Integer freeNum) throws Exception; // 글 삭제
	
	Free selectFree(Integer free_num) throws Exception; // num으로 값 가져오기
	
	Integer selectMaxFreeNum() throws Exception; // 최근 번호 가져오기

	List<Free> selectFreeSearchedList(String kwd)throws Exception; //검색기능
	
	Integer searchedFreeCount(String kwd) throws Exception;//검색된 글의 총 개수(as페이징)
	
	List<Free> searchedFreeList(String kwd, Integer row) throws Exception;//검색된 글 목록 조회(as페이징)
}
