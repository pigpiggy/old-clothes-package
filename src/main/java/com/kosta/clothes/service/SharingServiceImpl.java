package com.kosta.clothes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.dao.SharingDAO;

@Service
public class SharingServiceImpl implements SharingService{

	@Autowired
	SharingDAO sharingDAO;

	@Override
	public void registSharing(Sharing sharing) throws Exception {
		sharingDAO.insertSharing(sharing);
	}

	@Override
	public List<Sharing> getSharingList() throws Exception {
		// TODO Auto-generated method stub
		return sharingDAO.selectSharingList();
	}
	
	
}
