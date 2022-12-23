package com.kosta.clothes.service;

import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Trash;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.bean.ColumnPositionMappingStrategy;
import au.com.bytecode.opencsv.bean.CsvToBean;

@Service
public class TrashServiceImpl implements TrashService {

//	@Override
//	public List<String[]> readCSV(String filename) {
//		List<String[]> data = new ArrayList<String[]>();
//		try {
//			System.out.println("readCSV readCSV");
//			CSVReader reader = new CSVReader(new InputStreamReader(new FileInputStream(filename),"UTF-8"),',','"',0);
//			data = reader.readAll();
//			
//			reader.close();
//		}catch(Exception e) {
//			e.getStackTrace();
//		}
//		return data;
//	}

	@Override
	public List<Trash> readCsvToBean(String filename) {
		List<Trash> data = null;
		try {
			CSVReader reader = new CSVReader(new InputStreamReader(new FileInputStream(filename),"UTF-8"),',','"',0); 
			
			ColumnPositionMappingStrategy<Trash> mapper = new ColumnPositionMappingStrategy<Trash>();
			mapper.setType(Trash.class);   //VO파일을 맵핑하겠다.
			String[] columns = new String[] {"sido","sigungu","myeondong","oldcloaddress"}; // 각 컬럼을 정의할 배열
			mapper.setColumnMapping(columns); //각 컬럼명을 매퍼에 설정
			
			//매핑하기
			CsvToBean<Trash> csv = new CsvToBean<Trash>();
			data = csv.parse(mapper, reader); //(매핑방법, csv파일)
			
			reader.close();
			
		}catch(Exception e) {
			e.getStackTrace();
		}
		return data;
	}
	

}
