package com.kosta.clothes.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kosta.clothes.bean.JoinVo;
import com.kosta.clothes.bean.Sharing;

public interface SharingService {
	Integer registSharing(Sharing sharing, MultipartFile[] files) throws Exception;
	Sharing viewSharing(Integer sno) throws Exception;
	List<Sharing> getSharingList() throws Exception;
	List<Sharing> infiniteScrollDown(Integer snoToStart) throws Exception;
	List<Sharing> infiniteScrollUp(Integer snoToStart) throws Exception;
}
