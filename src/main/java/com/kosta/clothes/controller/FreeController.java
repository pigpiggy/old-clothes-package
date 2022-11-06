package com.kosta.clothes.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Free;
import com.kosta.clothes.bean.PageInfo;
import com.kosta.clothes.service.FreeService;

@Controller
public class FreeController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	FreeService freeService;
	
	// 자유게시판 글 목록
	@GetMapping("/freeList")
	public ModelAndView freeList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		ModelAndView mav = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Free> articleList = freeService.getFreeList(page,pageInfo);
			mav.addObject("articleList", articleList);
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName("/free/freeList");
		} catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}
	
	//글 작성
	@GetMapping("/freeWrite")
	public String freeInsert() {
		return "free/freeWrite";
	}
	 //글 상세보기
	@GetMapping("/freeView")
	public ModelAndView freeView(@RequestParam("free_num") int free_num,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page) {
		ModelAndView mav = new ModelAndView();
		try {
			Free free = freeService.getFree(free_num);
			mav.setViewName("/free/freeView");
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return mav;
	}	
		
	@GetMapping("/freeModify")
	public ModelAndView freeModify(@ModelAttribute Free free) {
		ModelAndView mav = new ModelAndView();
		try {
			freeService.modifyFree(free);
			mav.addObject("fee_num",free.getFree_num());
			mav.setViewName("redirect:/freeView");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
}
