package com.kosta.clothes.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Free;
import com.kosta.clothes.bean.PageInfo;
import com.kosta.clothes.bean.Users;
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
			System.out.println("areticleList"+articleList.toString());
			mav.addObject("pageInfo", pageInfo);
			mav.setViewName("/free/freeList");
		} catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}
	
	//글 작성
	@GetMapping("/freeRegistForm")
	public String freeRegistForm() {
		return "free/freeRegistForm";
	}
	
	//글 등록
	@PostMapping("/freeInsert")
	public ModelAndView boardwrite(@ModelAttribute Free free,HttpSession session ) {//값을 전부 받아온다.
		ModelAndView mav = new ModelAndView(); // 뷰 데이터 동시 설정 가능함
		try {
			Users users = (Users)session.getAttribute("authUser");
			String nickname=users.getNickname();
			free.setFname(nickname);
			freeService.registFree(free); // board에 저장된 값을 Service에 있는 registBoard에 넘겨준다
			mav.setViewName("redirect:/freeList"); // 아래로 간다 글 쓰고 페이지 목록 보여주기 위해서
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}
	
	 //글 상세보기
	@GetMapping("/freeView")
	public ModelAndView freeView(@RequestParam("fno") int free_num,
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
			mav.addObject("fno",free.getFno());
			mav.setViewName("redirect:/freeView");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
}
