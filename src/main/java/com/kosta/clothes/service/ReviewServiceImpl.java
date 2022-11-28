package com.kosta.clothes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.dao.ReviewDAO;
import com.kosta.clothes.dao.SharingDAO;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	ReviewDAO reviewDAO;
	
	@Override
	public Integer reviewcount(Integer userno) throws Exception {

		return reviewDAO.reviewcount(userno);
	}

}
