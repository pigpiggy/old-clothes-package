package com.kosta.clothes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Likes;
import com.kosta.clothes.dao.LikesDAO;
import com.kosta.clothes.dao.SharingDAO;

@Service
public class LikesServiceImpl implements LikesService{

	@Autowired
	LikesDAO likesDAO;
	
	@Autowired
	SharingDAO sharingDAO;
	
	@Override
	public void registSlikes(Likes likes) throws Exception {
		likes.setLikescheck((long) 1);
		likesDAO.insertSlikes(likes);
	}

//	@Override
//	public Likes selectSLikes(Likes likes) throws Exception {
//		return likesDAO.selectSLikes(likes);
//	}

	@Override
	public void updateSlikes(Likes likes) throws Exception {
		System.out.println("likescheckup:" + likes.getLikescheck());
		if(likes.getLikescheck()==0) {
			likesDAO.upSlikescheck(likes);
		}else {
			likesDAO.downSlikescheck(likes);
		}
	}

	@Override
	public Long getLikescheck(Likes likes) throws Exception {
		return likesDAO.getLikescheck(likes);
	}
	//bno 값을 가져오려고
	@Override
	public List<Likes> getbno(Integer userno) throws Exception {
		
		return likesDAO.getbno(userno);
	}

}
