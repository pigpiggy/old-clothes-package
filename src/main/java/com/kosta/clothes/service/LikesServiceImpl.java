package com.kosta.clothes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Likes;
import com.kosta.clothes.dao.LikesDAO;

@Service
public class LikesServiceImpl implements LikesService{

	@Autowired
	LikesDAO likesDAO;
	
	@Override
	public void registSlikes(Likes likes) throws Exception {
		likes.setLikescheck((long) 1);
		likesDAO.insertSlikes(likes);
	}

	@Override
	public List<Likes> selectSLikesList(Likes likes) throws Exception {
		return likesDAO.selectSLikesList(likes);
	}

	@Override
	public void updateSlikes(Likes likes) throws Exception {
		System.out.println("likescheckup:" + likes.getLikescheck());
		if(likes.getLikescheck()==0) {
			likesDAO.upSlikes(likes);
		}else {
			likesDAO.downSlikes(likes);
		}
	}

}
