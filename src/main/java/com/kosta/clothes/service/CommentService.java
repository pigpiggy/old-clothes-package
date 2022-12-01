package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Comments;

public interface CommentService {
	//자유게시판
	public void registUcomment(Comments comments) throws Exception; //댓글등록[개인]
	public void registBcomment(Comments comments) throws Exception; //댓글등록[사업자]
	List<Comments> selectComments(Integer fno) throws Exception; //전체 댓글 가져오기 
	void CmtDelete(Integer cno, Integer fno) throws Exception;// 댓글 삭제
	Comments getCmt(Integer fno,Integer cno) throws Exception; //하나의 값 가져오기
	void modifyCmt (Comments comments) throws Exception; //댓글 수정
	
	//무료나눔
	public void registCommentshar(Comments comments) throws Exception; //댓글등록
	List<Comments> selectCommentsno(Integer sno) throws Exception; //전체 댓글 가져오기
	void sharingCmtDelete(Integer cno, Integer sno) throws Exception;// 댓글 삭제
	Comments getsharingCmt(Integer sno,Integer cno) throws Exception; //하나의 값 가져오기
	void modifysharingCmt (Comments comments) throws Exception; //댓글 수정
	
	//개인판매
	public void registCommentsell(Comments comments) throws Exception; //댓글등록
	List<Comments> selectCommentino(Integer ino) throws Exception; //전체 댓글 가져오기
	void sellCmtDelete(Integer cno, Integer ino) throws Exception;// 댓글 삭제
	Comments getsellCmt(Integer ino,Integer cno) throws Exception; //하나의 값 가져오기
	void modifysellCmt (Comments comments) throws Exception; //댓글 수정
}
