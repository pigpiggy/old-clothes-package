package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Likes;

public interface LikesService {
	void registSlikes(Likes likes) throws Exception;
	//Likes selectSLikes(Likes likes) throws Exception;
	void updateSlikes(Likes likes) throws Exception;
	Long getLikescheck(Likes likes) throws Exception;
	List<Likes> getbno(Integer userno) throws Exception;
}
