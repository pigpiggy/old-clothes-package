package com.kosta.clothes.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Business;
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
	
	@Autowired
	HttpSession session;
	
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
	
	
	//글 작성 폼 띄우기
	@GetMapping("/freeRegistForm")
	public String freeRegistForm() {
		return "free/freeRegistForm";
	}
	
	//글 등록 동작
	@PostMapping("/freeInsert")
	public ModelAndView boardwrite(@ModelAttribute Free free,
			@RequestParam("fcontent") String content,HttpSession session ) {//값을 전부 받아온다.
		System.out.println("들어옴");
		ModelAndView mav = new ModelAndView(); // 뷰 데이터 동시 설정 가능함
		try {
			Users users = (Users)session.getAttribute("authUser");
			System.out.println("users:"+users);
			String sect = users.getSect();
			if (sect.equals("users")) {
				free.setUserno(users.getUserno());
				String nickname=users.getNickname();
				free.setFname(nickname);
				System.out.println("users:"+free);
			}else {
				Business user = (Business)session.getAttribute("authUser");
				free.setBno(user.getBno());
				String nickname=user.getBname();
				free.setFname(nickname);
				System.out.println("business"+free);
			}
				
			System.out.println("content"  + content.trim());
			String nickname=users.getNickname();
			free.setFname(nickname);
			free.setFcontent(content);
			freeService.registFree(free); // board에 저장된 값을 Service에 있는 registBoard에 넘겨준다
			mav.setViewName("redirect:/freeList"); // 아래로 간다 글 쓰고 페이지 목록 보여주기 위해서
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}
	
	
	 //글 상세보기(조회수증가)
	@GetMapping("freeView/{fno}")
	public ModelAndView freeView(@PathVariable("fno") Integer fno,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
		System.out.println("들어옴");
		ModelAndView mav = new ModelAndView();
		try {
			Users users = (Users)session.getAttribute("authUser");
			if(users==null) {
				model.addAttribute("logincheck", "false");//로그인했는지 여부-?jsp로		
			}
			Free free1 = freeService.Freehit(fno);
			Free free = freeService.getFree(fno);
			mav.addObject("article", free);
			mav.addObject("page", page);
			mav.setViewName("/free/freeView");
			
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return mav;
	}	
	//as CK에디터
	@ResponseBody
	@PostMapping("/upload")
	public Map<String, Object> fileupload(@RequestParam(value="upload") MultipartFile file) {
		String path = servletContext.getRealPath("/upload/");
		String filename = file.getOriginalFilename();
		File destfile = new File(path+filename);
		Map<String, Object> json = new HashMap<>();
		try {
			file.transferTo(destfile);
			json.put("uploaded", 1);
			json.put("filename", filename);
			json.put("url", "/fileview/"+filename);
		} catch(IOException e) {
			e.printStackTrace();
		}
		return json;
	}
	//as CK에디터
	@GetMapping("/fileview/{filename}")
	public void fileview(@PathVariable String filename, HttpServletResponse response) {
		String path=servletContext.getRealPath("/upload/");
		File file = new File(path+filename);
		FileInputStream fis = null;
		try {
			OutputStream out = response.getOutputStream();
			fis = new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			out.flush();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(fis!=null) fis.close();
			} catch(Exception e) {}
		}
	}
	
	//글 수정하기 폼 띄우기
	@GetMapping("/modifyform/{fno}")
	public ModelAndView freeModify(@PathVariable("fno") String fno) {
		ModelAndView mav = new ModelAndView();
		System.out.println("들어옴?");
		try {
			Free free = freeService.getFree(Integer.parseInt(fno));
			System.out.println("여기여기:"+free.toString());
			mav.addObject("article",free);
			mav.setViewName("/free/freeModify");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
		
	//글 수정하기 동작
	@PostMapping("/freeModify/{fno}")
	public ModelAndView freeModify(@ModelAttribute Free free,
			@RequestParam("fcontent") String fcontent,
			@PathVariable("fno") String fno) {
		System.out.println("수정하기 : " + free.toString());
		ModelAndView mav = new ModelAndView();
		try {
			free.setFno(Integer.parseInt(fno));
			free.setFcontent(fcontent);
			freeService.modifyFree(free);			
			mav.setViewName("redirect:/freeView/"+free.getFno());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	//글 삭제하기
	@ResponseBody
	@PostMapping("/freeDelete")
	public ModelAndView freeDelete(@RequestParam("fno") String fno,Model model){
		ModelAndView mav = new ModelAndView();
		try {
			System.out.println("삭제 : " + fno);
			freeService.freeDelete(Integer.parseInt(fno));
			mav.setViewName("redirect:/freeList");
		}catch(Exception e) {
			e.printStackTrace();
			mav.addObject("err",e.getMessage());
		}
		return mav;
	}
}
