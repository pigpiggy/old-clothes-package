package com.kosta.clothes.service;

import java.util.List;

import com.kosta.clothes.bean.Sharing;

public interface SharingService {
	void registSharing(Sharing sharing) throws Exception;
	List<Sharing> getSharingList() throws Exception;
}
