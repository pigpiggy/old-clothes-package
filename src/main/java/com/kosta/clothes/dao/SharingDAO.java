package com.kosta.clothes.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.JoinVo;
import com.kosta.clothes.bean.Sharing;

@Mapper
@Repository
public interface SharingDAO {
	Integer getNextSharingNo() throws Exception;
	void insertSharing(Sharing sharing) throws Exception;
	Sharing selectSharing(Integer sno) throws Exception;
	Sharing getByUserid(String userid) throws Exception;
	List<Sharing> selectSharingList() throws Exception;
	List<Sharing> infiniteScrollDown(Integer snoToStart) throws Exception;
}
