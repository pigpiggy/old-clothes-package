package com.kosta.clothes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Sharing;

@Mapper
@Repository
public interface SharingDAO {
	Integer getNextSharingNo() throws Exception;
	void insertSharing(Sharing sharing) throws Exception;
	Sharing selectSharing(Integer sno) throws Exception;
	List<Sharing> selectSharingList() throws Exception;
}
