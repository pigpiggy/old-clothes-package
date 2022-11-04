package com.kosta.clothes.service;

import org.springframework.web.multipart.MultipartFile;

import com.kosta.clothes.bean.Sharing;

public interface SharingService {
	Integer registSharing(Sharing sharing, MultipartFile[] files) throws Exception;
	Sharing viewSharing(Integer sid) throws Exception;
}
