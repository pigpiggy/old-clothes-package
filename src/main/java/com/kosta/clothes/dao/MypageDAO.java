package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Sharing;

@Mapper
@Repository
public interface MypageDAO {
	List<Sell> getSellList(Integer userno) throws Exception;
<<<<<<< HEAD
	List<Sharing> getSharingList(Integer userno) throws Exception;
	String getSellapplylist(Integer ino) throws Exception;
=======

	void uintroduce(Map map) throws Exception;
	
	void bintroduce(String introduce) throws Exception;
	
	String uintromyself(Integer userno) throws Exception;
	String bintromyself(Integer bno) throws Exception;
>>>>>>> 457d938a5b9c8260df2f9cc102557d11b0ad34c1
}

