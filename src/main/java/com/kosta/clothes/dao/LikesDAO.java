package com.kosta.clothes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Likes;

@Mapper
@Repository
public interface LikesDAO {
	void insertSlikes(Likes likes) throws Exception; //찜 기능
	void deleteSlikes(Integer sno) throws Exception;
	//Likes selectSLikes(Likes likes) throws Exception;
	void upSlikescheck(Likes likes) throws Exception;
	void downSlikescheck(Likes likes) throws Exception;
	Long getLikescheck(Likes likes) throws Exception;
}
