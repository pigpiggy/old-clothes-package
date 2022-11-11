package com.kosta.clothes.service;


import java.util.List;

import com.kosta.clothes.bean.Trash;

public interface TrashService {
//	public List<String[]> readCSV(String filename);
	public List<Trash> readCsvToBean(String filename);
	
}
