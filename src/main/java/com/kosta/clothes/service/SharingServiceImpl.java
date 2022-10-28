package com.kosta.clothes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.dao.SharingDAO;

@Service
public class SharingServiceImpl implements SharingService{

	@Autowired
	SharingDAO sharingDAO;

	@Override
	public void resistSharing(Sharing sharing) throws Exception {
		sharingDAO.insertSharing(sharing);
	}
	
	
}
