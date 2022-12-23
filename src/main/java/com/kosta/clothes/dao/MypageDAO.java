package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Business;
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
	Sell completedCount(Integer ino) throws Exception;
	void upDealCount(Integer ino) throws Exception;
	void upSeDealCount(Integer ino) throws Exception;
	void completeDeal(Integer ino) throws Exception;
	
	Sharing completedSharingCount(Integer sno) throws Exception;
	void upSharingDealCount(Integer sno) throws Exception;
	void upShDealCount(Integer sno) throws Exception;
	void completeSharingDeal(Integer sno) throws Exception;
	
	void sendIReview(Map map) throws Exception;
	void sendSReview(Map map) throws Exception;
	void changeIReviewStatus(Map map) throws Exception;
	void changeSReviewStatus(Map map) throws Exception;
	void sendUapplyReview(Map map) throws Exception;
	void uapplyReviewCompleted(Map map) throws Exception;
	void uapplyReviewStatus(Integer ano) throws Exception;
	
	List<Sharing> getLikeSharingList(Integer userno) throws Exception;
	List<Sell> getLikeSellList(Integer userno)throws Exception;
	List<Business> getLikeBusinessList(Integer userno)throws Exception;
	void deletesLike(@Param("userno") Integer userno, @Param("sno") Integer sno) throws Exception;
	void deleteiLike(@Param("userno")Integer userno, @Param("ino")Integer ino) throws Exception;
	void deletebLike(@Param("userno")Integer userno, @Param("bno")Integer bno) throws Exception;
	void deletesLikecount(Integer sno) throws Exception;
	void deleteiLikecount(Integer ino) throws Exception;
}

