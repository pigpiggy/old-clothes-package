package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Likes;

public interface LikesService {
	/* 무료나눔 찜 */
	void registSlikes(Likes likes) throws Exception;
	//Likes selectSLikes(Likes likes) throws Exception;
	void updateSlikes(Likes likes) throws Exception;
	Long getSlikescheck(Likes likes) throws Exception;
	/* 개인판매 찜 */
	void registIlikes(Likes likes) throws Exception;
	Long getIlikescheck(Likes likes) throws Exception;
	void updateIlikes(Likes likes) throws Exception;

}
