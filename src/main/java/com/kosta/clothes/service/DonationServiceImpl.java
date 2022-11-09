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
<<<<<<< HEAD
	 
	@Override
	public List<Donation> allDonationInfo() throws Exception {
		return donationDao.selectDonation();
=======
	
	@Override
	public List<Donation> allDonation() throws Exception {
		return donationDao.selectDonation(); //기부 정보 다 가져오기
>>>>>>> 4d767a1fb23282fdd30fce7cc4e0d44df44e450d
	}

}
