package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Donation;

public interface DonationService {
	List<Donation> allDonationInfo() throws Exception; //기부업체 정보 가져오기
	List<Donation> allDonationInfo1(String sido, String sigungu) throws Exception; //기부업체 정보
	//List<Donation> DonationInfo(String store, String good, String story) throws Exception; //기부업체 메인정보 가져오기
}
