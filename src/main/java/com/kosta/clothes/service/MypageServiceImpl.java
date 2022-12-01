package com.kosta.clothes.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.bean.Users;

import com.kosta.clothes.bean.Wapply;

import com.kosta.clothes.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	MypageDAO mypageDAO;
	
	@Autowired
	ServletContext servletContext;

	@Override
	public List<Sell> getSellList(Integer userno) throws Exception {
		return mypageDAO.getSellList(userno);
	}


	@Override
	public List<Sharing> getSharingList(Integer userno) throws Exception {
		return mypageDAO.getSharingList(userno);
	}

	@Override
	public List<Users> getSellapplylist(Integer ino) throws Exception {
		return mypageDAO.getSellapplylist(ino);
	}
	@Override
	public String uintroduce(String introduce, Integer userno) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("introduce", introduce);
		map.put("userno", userno);		
		mypageDAO.uintroduce(map);
		return mypageDAO.uintromyself(userno);
	}

	@Override
	public String bintroduce(String introduce, Integer bno) throws Exception {
		mypageDAO.bintroduce(introduce);
		return mypageDAO.bintromyself(bno);

	}


	@Override

	public List<Users> getSharingapplylist(Integer sno) throws Exception {
		return mypageDAO.getSharingapplylist(sno);
	}
	public Users getMypage(Integer userno) throws Exception {		
		return mypageDAO.getMypage(userno);

	}

}
