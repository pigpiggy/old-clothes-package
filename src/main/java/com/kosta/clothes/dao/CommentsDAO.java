package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Comments;

@Mapper
@Repository
public interface CommentsDAO {
//자유게시판
	void insertComments(Comments comments) throws Exception; //업체에 신청한 form 등록[개인]
	void insertBcomments(Comments comments) throws Exception; //업체에 신청한 form 등록[사업자]
	List<Comments> selectComments(Integer fno) throws Exception; //댓글 모든 값
	void CmtDelete(Map<String, Integer> map) throws Exception; //댓글 삭제
	Comments getCmt(Map<String, Integer> map) throws Exception; //리스트 값 하나만 가져오기
	void updateCmt(Comments comments) throws Exception; //댓글 수정	
	
	//무료나눔
	void insertCommentshar(Comments comments) throws Exception; //업체에 신청한 form 등록
	List<Comments> selectCommentsno(Integer sno) throws Exception; //댓글 모든 값
	void sharingCmtDelete(Map<String, Integer> map) throws Exception; //댓글 삭제
	Comments getsharingCmt(Map<String, Integer> map) throws Exception; //리스트 값 하나만 가져오기
	void updatesharingCmt(Comments comments) throws Exception; //댓글 수정
	void commentSDelete(Integer sno) throws Exception; //무료나눔에서 상품 삭제할 때 댓글도 삭제
	//개인판매
	void insertCommentsell(Comments comments) throws Exception; //업체에 신청한 form 등록
	List<Comments> selectCommentino(Integer ino) throws Exception; //댓글 모든 값
	void sellCmtDelete(Map<String, Integer> map) throws Exception; //댓글 삭제
	Comments getsellCmt(Map<String, Integer> map) throws Exception; //리스트 값 하나만 가져오기
	void updatesellCmt(Comments comments) throws Exception; //댓글 수정
	void commentIDelete(Integer ino) throws Exception; //개인판매에서 상품 삭제할 때 댓글도 삭제 
	
	//대댓글 작업
	Comments getCmtcno(Integer cno) throws Exception;//cno로 코멘트 정보 가져오기
	Integer selectReffree(Integer fno) throws Exception;//게시글의 max ref 정보 조회
	void ureplycommentfree(Comments comments) throws Exception;//대댓글 등록[개인]
	void breplycommentfree(Comments comments) throws Exception;//대댓글 등록[사업자]
	void replyupcommentfree(Comments cmt) throws Exception;//pos+1시키는 것
}
