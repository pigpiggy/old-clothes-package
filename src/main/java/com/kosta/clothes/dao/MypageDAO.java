package com.kosta.clothes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Sharing;

@Mapper
@Repository
public interface MypageDAO {
	List<Sell> getSellList(Integer userno) throws Exception;
	List<Sharing> getSharingList(Integer userno) throws Exception;
	String getSellapplylist(Integer ino) throws Exception;
}
