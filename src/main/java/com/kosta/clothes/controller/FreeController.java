package com.kosta.clothes.controller;

import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FreeController {
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/freeList")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("/free/freelist");
		} catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}
	@GetMapping("/freeInsert")
	public String sharingInsert() {
		return "free/freeResistForm";
	}
	
}
