package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.PageInfo;
import com.kosta.clothes.bean.Review;

public interface ReviewService {

	Integer reviewcount(Integer userno) throws Exception ;
	List<Review> getReviewList(Integer userno, int rpage, PageInfo rpageInfo) throws Exception;
	List<Review> getBReviewList(Integer bno) throws Exception;
}
