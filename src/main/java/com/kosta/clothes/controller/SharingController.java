package com.kosta.clothes.controller;

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
				System.out.println("들어옴");
				if(sharingList.get(i).getSfileids()!=null) {
					sharingList.get(i).setSfileids(sharingList.get(i).getSfileids().split(",")[0]);
				}
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
			sharingService.registSharing(sharing, files);
			System.out.println("registcontroller:" + sharing);
			mav.setViewName("redirect:/sharingList");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@GetMapping("/sharingView/{sno}")
	public ModelAndView viewSharing(@PathVariable("sno") Integer sno) {
		ModelAndView mav = new ModelAndView();
		try {
			Sharing sharing = sharingService.viewSharing(sno);
			String[] fidArr = sharing.getSfileids().split(","); //1,2,3이라는 문자열로 돼있으면 콤마로 잘라서 스트링 배열로 만들어줌 
			//fidArr[0]="1",fidArr[1]="2", fidArr[2]="3"
			List<Integer> fileList = new ArrayList<>();
			for(String fid : fidArr) {
				if(fid.trim().length() > 0) { //trim은 앞 뒤 스페이스 제거하고 비어있지 않으면
					fileList.add(Integer.parseInt(fid)); //int로 바꿔서 넣는다
				}
			}
			mav.addObject("files", fileList); 
			mav.addObject("sharing", sharing);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@GetMapping("/img/{sfileids}")
	public void viewImage(@PathVariable Integer sfileids, HttpServletResponse response) {
		String path = servletContext.getRealPath("/upload/");
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(path+sfileids);
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(fis, out);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(fis!=null) {
				try {
					fis.close();
				} catch(Exception e) {}
			}
		}
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
