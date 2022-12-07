package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Review;

@Mapper
@Repository
public interface ReviewDAO {
	Integer reviewcount(Integer userno) throws Exception;
	List<Review> getReviewList(Map map) throws Exception;
	Integer sReviewListCount(Integer userno) throws Exception;
	Integer iReviewListCount(Integer userno) throws Exception;
}
