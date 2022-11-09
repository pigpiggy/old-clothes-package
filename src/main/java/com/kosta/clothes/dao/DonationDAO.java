package com.kosta.clothes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Donation;

@Mapper
@Repository
public interface DonationDAO {
<<<<<<< HEAD
	List<Donation> selectDonation() throws Exception; //기부업체 정보 조회
=======
	List<Donation> selectDonation() throws Exception; //기부정보 전체 가져오기
>>>>>>> 4d767a1fb23282fdd30fce7cc4e0d44df44e450d
}
