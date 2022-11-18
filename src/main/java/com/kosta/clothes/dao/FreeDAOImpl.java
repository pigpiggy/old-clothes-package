package com.kosta.clothes.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Free;

@Repository
public class FreeDAOImpl implements FreeDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	//게시판 글 등록
	@Override
	public void insertFree(Free free) throws Exception {
		sqlSession.insert("insertFree",free);
	}
	
	//등록된 글의 총 개수(as페이징)
	@Override
	public Integer selectFreeCount() throws Exception {
		return sqlSession.selectOne("selectFreeCount");
	}
	
	//전체 글 목록 조회(as페이징)
	@Override
	public List<Free> selectFreeList(Integer row) throws Exception {
		return sqlSession.selectList("selectFreeList",row);
	}
	
	//조회수 증가
	public Free hitFree(Integer freadcount)throws Exception{
		return sqlSession.selectOne("hitFree",freadcount);
	}
	
	//글 수정
	@Override
	public void updateFree(Free free) throws Exception {
		sqlSession.selectOne("updateFree",free);
		
	}
	
	//글 삭제
	@Override
	public void deleteFree(Integer freeNum) throws Exception {
		sqlSession.delete("deleteFree",freeNum);
	}

	////글 클릭 시 관련 num 으로 정보 값 가져오기
	@Override
	public Free selectFree(Integer free_num) throws Exception {
		return sqlSession.selectOne("selectFree",free_num);
	}
	//게시판 최신 글번호
	@Override
	public Integer selectMaxFreeNum() throws Exception {
		return sqlSession.selectOne("selectMaxFreeNum");
	}
	//검색기능
	@Override
	public List<Free> selectFreeSearchedList(String kwd) throws Exception {
		
		return  sqlSession.selectList("selectFreeSearchedList",kwd);
	}

	@Override
	public Integer searchedFreeCount(String kwd) throws Exception {
		return sqlSession.selectOne("searchedFreeCount",kwd);
	}

	@Override
	public List<Free> searchedFreeList(String kwd, Integer row) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kwd",kwd);
		map.put("row", row);
		return sqlSession.selectList("searchedFreeList",map);
	}

	
}
