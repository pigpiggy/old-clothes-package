package com.kosta.clothes.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.kosta.clothes.bean.JoinVo;
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
			List<Sharing> sharingList = sharingService.getSharingList();
			System.out.println("sharing" + sharingList );
			List<Integer> fileList = new ArrayList<>();
			for(int i=0;i<sharingList.size();i++) {
				fileList.add(Integer.parseInt(sharingList.get(i).getSfileids().split(",")[0]));
				sharingList.get(i).setSfileids(Integer.toString(fileList.get(i)));
			}
			
			mav.addObject("sharingList", sharingList);
			
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
	
	@GetMapping("/sharingView")
	public String sharingView() {
		return "/sharing/sharingView";
	}
	
	@GetMapping("/upload/{fileid}")
	public void imgView(@PathVariable String fileid, HttpServletResponse response) {
		String path = servletContext.getRealPath("upload/");
		try {
			FileInputStream fis = new FileInputStream(path+fileid);
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(fis, out);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@PostMapping("/infiniteScrollDown")
	public List<Sharing> infiniteScrollDown(@RequestBody Sharing sharing) {
		Integer snoToStart = sharing.getSno()-1;
		List<Sharing> sharingList = new ArrayList<>();
		try {
			sharingList = sharingService.infiniteScrollDown(snoToStart);
			List<Integer> fileList = new ArrayList<>();
			for(int i=0;i<sharingList.size();i++) {
				fileList.add(Integer.parseInt(sharingList.get(i).getSfileids().split(",")[0]));
				sharingList.get(i).setSfileids(Integer.toString(fileList.get(i)));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return sharingList;
	}
	
}
