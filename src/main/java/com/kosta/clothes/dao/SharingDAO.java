package com.kosta.clothes.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Likes;
import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.bean.Users;

@Mapper
@Repository
public interface SharingDAO {
	Integer getNextSharingNo() throws Exception; //sharing sequence
	void insertSharing(Sharing sharing) throws Exception; 
	Sharing selectSharing(Integer sno) throws Exception;
	Sharing getByUserid(String userid) throws Exception;
	List<Sharing> selectSharingList() throws Exception;
	List<Sharing> infiniteScrollDown(Integer snoToStart) throws Exception;
	List<Sharing> selectSharingSearchedList(String kwd) throws Exception;
	List<Sharing> searchedInfiniteScrollDown(Map<String, Object> map) throws Exception;
	void updateSharing(Sharing sharing) throws Exception;
	void updateSfileids(Sharing sharing) throws Exception;
	void deleteSharing(Integer sno) throws Exception;
	void insertSlikes(Likes likes) throws Exception; //찜 기능
	void upSharingLikes(Sharing sharing) throws Exception;
	void downSharingLikes(Sharing sharing) throws Exception;
	void deleteLikes(Integer sno) throws Exception;
	Users getSnickname(Integer sno) throws Exception;
	void upApplycount(Sharing sharing) throws Exception;
	void alterSharingStatus(Integer sno) throws Exception;
	//
	Integer sharingcount(Integer userno) throws Exception;
	Integer statuscount(Integer userno)throws Exception;
}
