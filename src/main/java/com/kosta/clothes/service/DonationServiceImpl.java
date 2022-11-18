package com.kosta.clothes.service;

import java.util.List;

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
	

}
