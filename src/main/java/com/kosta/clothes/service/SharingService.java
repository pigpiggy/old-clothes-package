package com.kosta.clothes.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kosta.clothes.bean.FileVO;
import com.kosta.clothes.bean.Likes;
import com.kosta.clothes.bean.Sharing;

public interface SharingService {
//	Integer registSharing(Sharing sharing, MultipartFile[] files) throws Exception;
	void registSharing(Sharing sharing, MultipartFile[] files) throws Exception;
	Sharing viewSharing(Integer sno) throws Exception;
	Sharing getUserid(String userid) throws Exception;
	List<Sharing> getSharingList() throws Exception;
	List<Sharing> getSharingList(String kwd) throws Exception;
	List<Sharing> infiniteScrollDown(Integer snoToStart) throws Exception;
	List<Sharing> infiniteScrollDown(Integer snoToStart, String kwd) throws Exception;
	void modifySharing(Sharing sharing) throws Exception;
	void modifySfileids(Sharing sharing, FileVO fileVo, MultipartFile[] files) throws Exception;
	void deleteSharing(Integer sno) throws Exception;
	void modifySharingLikes(Sharing sharing) throws Exception;
	
}
