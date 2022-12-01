package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.bean.Users;

@Mapper
@Repository
public interface MypageDAO {
	List<Sell> getSellList(Integer userno) throws Exception;
	List<Sharing> getSharingList(Integer userno) throws Exception;
	List<Users> getSellapplylist(Integer ino) throws Exception;
	List<Users> getSharingapplylist(Integer sno) throws Exception;

	void uintroduce(Map map) throws Exception;
	
	void bintroduce(String introduce) throws Exception;
	
	String uintromyself(Integer userno) throws Exception;
	String bintromyself(Integer bno) throws Exception;
	
	Users getMypage(Integer userno) throws Exception;
}

