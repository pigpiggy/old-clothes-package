package com.kosta.clothes.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Comments;
import com.kosta.clothes.dao.CommentsDAO;
@Service
public class CommentServiceImpl implements CommentService {

	
	@Autowired
	CommentsDAO commentsDao;
	
	//자유게시판
	//댓글 등록
	@Override
	public void registUcomment(Comments comments) throws Exception {
		commentsDao.insertComments(comments);
	}
	
	@Override
	public void registBcomment(Comments comments) throws Exception {
		commentsDao.insertBcomments(comments);
		
	}

	//댓글 리스트 가져오기
	@Override
	public List<Comments> selectComments(Integer fno) throws Exception {
		
		return commentsDao.selectComments(fno);
	}
	//댓글 삭제
	@Override
	public void CmtDelete(Integer cno, Integer fno) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cno", cno);
		map.put("fno", fno);
		commentsDao.CmtDelete(map);
	}
	//하나의 리스트 값 가져오기
	@Override
	public Comments getCmt(Integer fno, Integer cno) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("fno",fno);
		map.put("cno",cno);
		return commentsDao.getCmt(map);
	}
	//댓글 수정
	@Override
	public void modifyCmt(Comments comments) throws Exception {
		commentsDao.updateCmt(comments);
		
	}
//무료나눔
	//댓글 등록
	@Override
	public void registCommentshar(Comments comments) throws Exception {
		commentsDao.insertCommentshar(comments);
		
	}

	//댓글 리스트 
	@Override
	public List<Comments> selectCommentsno(Integer sno) throws Exception {
		// TODO Auto-generated method stub
		return  commentsDao.selectCommentsno(sno);
	}
	//댓글 삭제
	@Override
	public void sharingCmtDelete(Integer cno, Integer sno) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cno", cno);
		map.put("sno", sno);
		commentsDao.sharingCmtDelete(map);
		
	}
	//댓글 하나의 값 리스트
	@Override
	public Comments getsharingCmt(Integer sno, Integer cno) throws Exception {		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("sno",sno);
		map.put("cno",cno);
		return commentsDao.getsharingCmt(map);		
	}
	//댓글 수정
	@Override
	public void modifysharingCmt(Comments comments) throws Exception {
		commentsDao.updatesharingCmt(comments);
		
	}

	//개인판매
	//댓글 등록
	@Override
	public void registCommentsell(Comments comments) throws Exception {
		commentsDao.insertCommentsell(comments);
	}

	//댓글 리스트
	@Override
	public List<Comments> selectCommentino(Integer ino) throws Exception {
		return  commentsDao.selectCommentino(ino);
	}
	//댓글 삭제
	@Override
	public void sellCmtDelete(Integer cno, Integer ino) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("cno", cno);
		map.put("ino", ino);
		commentsDao.sellCmtDelete(map);
	}

	//하나의 리스트 값 
	@Override
	public Comments getsellCmt(Integer ino, Integer cno) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("ino",ino);
		map.put("cno",cno);
		return commentsDao.getsellCmt(map);		
	}

	//댓글 수정
	@Override
	public void modifysellCmt(Comments comments) throws Exception {
		commentsDao.updatesellCmt(comments);
		
	}

	
}
