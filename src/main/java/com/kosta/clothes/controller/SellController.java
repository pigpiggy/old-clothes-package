package com.kosta.clothes.controller;


import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.bean.Users;
import com.kosta.clothes.service.SharingService;

@Controller
public class SellController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/sellList")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("/sell/individual");
		} catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}
}
