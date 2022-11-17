package com.kosta.clothes.controller;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Users;
import com.kosta.clothes.service.SellService;

@Controller
public class SellController {
	@Autowired
	SellService sellService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/sellList")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("/sell/sellList");
		} catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}
	
	@GetMapping("/sellRegistForm")
	public String sharingRegistForm() {
		return "/sell/sellRegistForm";
	}

	@ResponseBody
	@PostMapping("/sellRegist")
	public ModelAndView registSell(@ModelAttribute Sell sell,
			@RequestParam("iimageFile") MultipartFile[] files) {
		ModelAndView mav = new ModelAndView();
		try {
			Users users = (Users) session.getAttribute("authUser");
			if (users != null) {
				sell.setUserno(users.getUserno());
				sellService.registSell(sell, files);
			}
			System.out.println("sellregistcontroller:" + sell);
			mav.setViewName("redirect:/sellList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
