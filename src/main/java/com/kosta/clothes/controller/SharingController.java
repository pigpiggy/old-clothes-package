package com.kosta.clothes.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.service.SharingService;

@Controller
public class SharingController {
	
	@Autowired
	SharingService sharingService;
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/sharingList")
	public ModelAndView main(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		try {
			mav.setViewName("/sharing/sharingList");
		} catch(Exception e){
			e.printStackTrace();
		}
		return mav;
	}
	
	@GetMapping("/sharingRegistForm")
	public String sharingRegistForm() {
		return "/sharing/sharingRegistForm";
	}
	
//	@PostMapping("/sharingRegist")
//	public ModelAndView registSharing(@ModelAttribute Sharing sharing, Model model) {
//		ModelAndView mav = new ModelAndView();
//		try {
//			MultipartFile file = sharing.getSimageFile();
//			System.out.println(file);
//			if(!file.isEmpty()) {
//				String path = servletContext.getRealPath("/upload/");
//				File destFile = new File(path+file.getOriginalFilename());
//				file.transferTo(destFile);
//				sharing.setSimage(file.getOriginalFilename());
//			}
//			sharingService.registSharing(sharing);
//			mav.setViewName("redirect:/sharingList");
//		}catch(Exception e) {
//			e.printStackTrace();
//			mav.setViewName("/err");
//		}
//		return mav;
//	}
	
	@ResponseBody
	@PostMapping("/sharingRegist")
	public ModelAndView registSharing(@ModelAttribute Sharing sharing, Model model,
			@RequestParam("simageFile") MultipartFile[] files) {
		ModelAndView mav = new ModelAndView();
		try {
			Integer sharingid = sharingService.registSharing(sharing, files);
			Sharing sharingview = sharingService.viewSharing(sharingid);
			model.addAttribute("title", sharing.getStitle());
			model.addAttribute("content", sharing.getScontent());
			String[] fidArr = sharingview.getSfileids().split(",");
			mav.addObject("files", fidArr);
			mav.setViewName("redirect:/sharingList");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
//	@GetMapping("/upload/{filename}")
//	public void viewImage(@PathVariable String filename, HttpServletResponse response) {
//		String path=servletContext.getRealPath("/upload/");
//		FileInputStream fis = null;
//		try {
//			fis = new FileInputStream(path+filename);
//			OutputStream out = response.getOutputStream();
//			FileCopyUtils.copy(fis, out);
//			out.flush();
//		} catch(Exception e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(fis!=null) fis.close();
//			} catch(Exception e) {}
//		}
//	}
	
	
	@GetMapping("/sharingView")
	public String sharingView() {
		return "/sharing/sharingView";
	}
	
}
