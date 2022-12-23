package com.kosta.clothes.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Donation;
import com.kosta.clothes.dao.DonationDAO;

@Service
public class DonationServiceImpl implements DonationService {

	@Autowired
	DonationDAO donationDao;
	 
	//전체 기부업체 정보 가져오기
	@Override
	public List<Donation> allDonationInfo() throws Exception {
		return donationDao.selectDonation();
	}

	//기부업체 정보 일부 가져오기[메인]
	@Override
	public List<Donation> allDonationInfo1(String sido, String sigungu) throws Exception {
		Map<String,String> map = new HashMap<String,String>();
		map.put("sido", sido);
		map.put("sigungu", sigungu);
		return donationDao.selectDonation1(map);
	}

	

}
