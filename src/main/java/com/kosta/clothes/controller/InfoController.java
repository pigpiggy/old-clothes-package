package com.kosta.clothes.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Donation;
import com.kosta.clothes.bean.Trash;
import com.kosta.clothes.service.DonationService;
import com.kosta.clothes.service.TrashService;

//헌옷수거함+기부업체 정보 안내 컨트롤러
@Controller
public class InfoController {
	@Autowired
	TrashService trashService;
	@Autowired
	ServletContext servletContext;
	@Autowired
	DonationService donationService;

	
	// 정보 안내(헌웃수거함/기부업체)
	@GetMapping("/information")
	ModelAndView alladdress(Model model) {
		ModelAndView mav = new ModelAndView();
		try {
			List<Donation> dona = donationService.allDonationInfo();
			System.out.println(dona.toString());
			mav.addObject("donation",dona);
	
		mav.setViewName("/info/donationmap");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	//헌옷수거함 페이지 오픈
	@GetMapping("/clothingbin")
	public String clothingBin() {
		return "info/clothingbin";
	}
	//csv 파일을 bean과 매칭
	@ResponseBody
	@PostMapping("/csvToBean")
	public List<String> csvToBean(@RequestBody Map<String,Object> params , Model model) {
		//ajax로 데이터 받아온 것
		String sido = (String) params.get("sido");
		String sigungu = (String) params.get("sigugun");
		String myeondong = (String) params.get("dong");
		Trash trash = null;
		List<String> list = new ArrayList<String>();
		//csv 파일 경로
		String path = servletContext.getRealPath("/csv/");
		path += "oldclothesutf.csv";
		List<Trash> data = trashService.readCsvToBean(path); //읽어온 것을 data에 담는다
		
		Iterator<Trash> it = data.iterator(); //Iterator생성
		while(it.hasNext()) {
			trash = (Trash)it.next();
			//받아온 selectbox 데이터를 조건으로 그와 일치하는 리스트 검색
			if(trash.getSido().contains(sido)&&trash.getSigungu().contains(sigungu)&&trash.getMyeondong().contains(myeondong)) {
			System.out.println(trash.getOldcloaddress());
			
			list.add(trash.getOldcloaddress());
			}
//			System.out.println("sido:"+trash.getSido());
//			System.out.println("sigungu:"+trash.getSigungu());
//			System.out.println("myeondong:"+trash.getMyeondong());
//			System.out.println("address:"+trash.getOldcloaddress());
		
		}
		model.addAttribute("trash", list);
		System.out.println("list:"+list);
		
		return list;
	}
}
