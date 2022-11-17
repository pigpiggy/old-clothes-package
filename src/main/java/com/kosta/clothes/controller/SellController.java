package com.kosta.clothes.controller;


import java.util.List;

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
import com.kosta.clothes.bean.Sharing;
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
	public ModelAndView main(HttpServletRequest request, @RequestParam(value = "kwd", required = false) String kwd) {
		ModelAndView mav = new ModelAndView();
		List<Sell> sellList;
		try {
			if (kwd != null && kwd != "") {
				sellList = sellService.getSellList(kwd);
			} else {
				sellList = sellService.getSellList();
			}
			for (int i = 0; i < sellList.size(); i++) {
				if (sellList.get(i).getIfileids() != null) {
					sellList.get(i).setIfileids(sellList.get(i).getIfileids().split(",")[0]);
				}
			}
			System.out.println("컨트롤리스트:" + sellList);
			mav.addObject("sellList", sellList);
			mav.addObject("kwd", kwd);
			mav.setViewName("/sell/sellList");
		} catch (Exception e) {
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
