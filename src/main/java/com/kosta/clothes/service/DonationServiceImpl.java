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
	 
	@Override
	public List<Donation> allDonationInfo() throws Exception {
		return donationDao.selectDonation();
	}

}
