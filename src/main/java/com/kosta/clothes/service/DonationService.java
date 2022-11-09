package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Donation;

public interface DonationService {
	List<Donation> allDonationInfo() throws Exception; //기부업체 정보 가져오기
	
}
