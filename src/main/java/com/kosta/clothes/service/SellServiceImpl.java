package com.kosta.clothes.service;

import java.io.FileOutputStream;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.clothes.bean.FileVO;
import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.dao.FileDAO;
import com.kosta.clothes.dao.SellDAO;

@Service
public class SellServiceImpl implements SellService{
	@Autowired
	SellDAO sellDAO;
	
	@Autowired
	FileDAO fileDAO;
	
	@Autowired
	ServletContext servletContext;

	@Override
	public void registSell(Sell sell, MultipartFile[] files) throws Exception {
		Integer sellid = sellDAO.getNextIndividualNo();
		Sell sellvo = new Sell();
		sellvo.setIno(sellid);
		sellvo.setItitle(sell.getItitle());
		sellvo.setIcontent(sell.getIcontent());
		sellvo.setIstatus("등록완료");
		sellvo.setUserno(sell.getUserno());
		String fileids = "";
		FileVO fileVo = new FileVO();
		if(files!=null) {
			String path = servletContext.getRealPath("/upload/");
			for(MultipartFile file : files) {
				if(!file.isEmpty()) {
					fileVo.setDirectory_name(path);
					fileVo.setTname(file.getOriginalFilename());
					fileVo.setTsize(file.getSize());
					fileVo.setIno(sellid);
					fileVo.setContent_type(file.getContentType());
					fileDAO.insertFileInfo(fileVo);
					System.out.println("sharingServiceImpl:" + fileVo);
					
					FileOutputStream fos = new FileOutputStream(path+fileVo.getTno());
					FileCopyUtils.copy(file.getBytes(), fos);
					
					fileids += fileVo.getTno()+",";
				}
				
			}
		}
		sellvo.setIfileids(fileids);
		sellvo.setIdealType(sell.getIdealType());
		sellvo.setPrice(sell.getPrice());
		sellvo.setAddressCity(sell.getAddressCity());
		sellvo.setAddressTown(sell.getAddressTown());
		
		sellDAO.insertIndividual(sellvo);
	}
	
}
