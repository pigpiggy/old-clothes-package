package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Free;
import com.kosta.clothes.bean.PageInfo;



public interface FreeService {
	void registFree(Free free) throws Exception; // 게시판 등록

	List<Free> getFreeList(int page, PageInfo pageInfo) throws Exception; // 글 전체 개수

	Free getFree(Integer free_num) throws Exception;// 글 정보 가져오기 num 으로

	void modifyFree(Free free) throws Exception; // 글 수정

	void freeDelete(Integer freeNum, String password) throws Exception;// 글 삭제
}
