package com.kosta.clothes.controller;

import java.util.List;

<<<<<<< HEAD
import org.json.simple.JSONArray;
=======
>>>>>>> 4d767a1fb23282fdd30fce7cc4e0d44df44e450d
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Donation;
import com.kosta.clothes.service.DonationService;

//헌옷수거함+기부업체 정보 안내 컨트롤러
@Controller
public class InfoController {
	
	@Autowired
	DonationService donationService;
<<<<<<< HEAD

	
	// 정보 안내(헌웃수거함/기부업체)
	@GetMapping("/information")
	ModelAndView alladdress(Model model) {
		ModelAndView mav = new ModelAndView();
		try {
			List<Donation> dona = donationService.allDonationInfo();
			System.out.println(dona.toString());
			mav.addObject("donation",dona);
=======
	
	@GetMapping("/information")
	public ModelAndView alldonation(Model model) {
		ModelAndView mav = new ModelAndView();
		try {
			List<Donation> dona = donationService.allDonation();
			System.out.println("dodonana"+dona.toString());
			mav.addObject("dona",dona);
>>>>>>> 4d767a1fb23282fdd30fce7cc4e0d44df44e450d
			mav.setViewName("/info/donationmap");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
<<<<<<< HEAD
		
=======
>>>>>>> 4d767a1fb23282fdd30fce7cc4e0d44df44e450d
	}
}
