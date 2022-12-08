package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.Likes;
import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.bean.Users;

@Mapper
@Repository
public interface MypageDAO {
	List<Sell> getSellList(Map map) throws Exception;
	List<Sharing> getSharingList(Map map) throws Exception;
	List<Users> getSellapplylist(Integer ino) throws Exception;
	List<Users> getSharingapplylist(Integer sno) throws Exception;
	List<Sell> getBuySellList(Map map) throws Exception;
	List<Sharing> getBuySharingList(Map map) throws Exception;

	void uintroduce(Map map) throws Exception;
	
	void bintroduce(Map map) throws Exception;
	
	String uintromyself(Integer userno) throws Exception;
	String bintromyself(Integer bno) throws Exception;
	
	Users getMypage(Integer userno) throws Exception;
	
	Integer sellListCount(Integer userno) throws Exception;
	Integer sharingListCount(Integer userno) throws Exception;
	
	Integer buySellListCount(Integer userno) throws Exception;
	Integer buySharingListCount(Integer userno) throws Exception;
	
	void selectSellApply(Map map) throws Exception;
	void selectSharingApply(Map map) throws Exception;
	void cancelDeal(Integer ino) throws Exception;
	void cancelSharingDeal(Integer sno) throws Exception;
	Integer completedCount(Integer ino) throws Exception;
	void upDealCount(Integer ino) throws Exception;
	void completeDeal(Integer ino) throws Exception;
	
	Integer completedSharingCount(Integer sno) throws Exception;
	void upSharingDealCount(Integer sno) throws Exception;
	void completeSharingDeal(Integer sno) throws Exception;
	
	void sendIReview(Map map) throws Exception;
	
	List<Sharing> getLikeSharingList(Integer userno) throws Exception;
	List<Sell> getLikeSellList(Integer userno)throws Exception;
	List<Business> getLikeBusinessList(Integer userno)throws Exception;
}

