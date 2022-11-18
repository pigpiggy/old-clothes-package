package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Free;
import com.kosta.clothes.bean.PageInfo;

public interface FreeService {
	void registFree(Free free) throws Exception; // 게시판 등록

	List<Free> getFreeList(int page, PageInfo pageInfo) throws Exception; // 글 전체 개수(as페이징)

	Free getFree(Integer free_num) throws Exception;// 글 정보 가져오기 num 으로

	void modifyFree(Free free) throws Exception; // 글 수정

	void freeDelete(Integer freeNum) throws Exception;// 글 삭제
	 
	Free Freehit(Integer freadcount) throws Exception; //조회수 증가
	
	List<Free> getFreeList(String kwd, int page, PageInfo pageInfo) throws Exception; //검색기능
}
