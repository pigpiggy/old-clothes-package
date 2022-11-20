package com.kosta.clothes.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.Donation;
import com.kosta.clothes.bean.Likes;
import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.bean.Trash;
import com.kosta.clothes.bean.Users;
import com.kosta.clothes.service.BusinessService;
import com.kosta.clothes.service.DonationService;
import com.kosta.clothes.service.LikesService;
import com.kosta.clothes.service.TrashService;

//헌옷수거함+기부업체 정보 안내 컨트롤러
@Controller
public class InfoController {
	@Autowired
	TrashService trashService;
	@Autowired
	ServletContext servletContext;
	@Autowired
	DonationService donationService;

	@Autowired
	BusinessService businessService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	LikesService likesService;

	// 정보 안내(기부업체)
	@GetMapping("/information")
	ModelAndView alladdress(Model model) {
		ModelAndView mav = new ModelAndView();
		try {
			List<Donation> dona = donationService.allDonationInfo();
			//List<Donation> donation = donationService.DonationInfo(store,good,story);
			System.out.println("dona" +dona.toString());
			//System.out.println("donation" + donation.toString());
			mav.addObject("donation",dona);
			mav.setViewName("/info/donationmap");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	//헌옷수거함 페이지 오픈

	@GetMapping("/clothingbin")
	public String clothingBin() {
		return "info/clothingbin";
	}
	//csv 파일을 bean과 매칭
	@ResponseBody
	@PostMapping("/csvToBean")
	public List<String> csvToBean(@RequestBody Map<String,Object> params , Model model) {
		//ajax로 데이터 받아온 것
		String sido = (String) params.get("sido");
		String sigungu = (String) params.get("sigugun");
		String myeondong = (String) params.get("dong");
		Trash trash = null;
		List<String> list = new ArrayList<String>();
		//csv 파일 경로
		String path = servletContext.getRealPath("/csv/");
		path += "oldclothesutf.csv";
		List<Trash> data = trashService.readCsvToBean(path); //읽어온 것을 data에 담는다
		
		Iterator<Trash> it = data.iterator(); //Iterator생성
		while(it.hasNext()) {
			trash = (Trash)it.next();
			//받아온 selectbox 데이터를 조건으로 그와 일치하는 리스트 검색
			if(trash.getSido().contains(sido)&&trash.getSigungu().contains(sigungu)&&trash.getMyeondong().contains(myeondong)) {
			System.out.println(trash.getOldcloaddress());
			
			list.add(trash.getOldcloaddress());
			}
//			System.out.println("sido:"+trash.getSido());
//			System.out.println("sigungu:"+trash.getSigungu());
//			System.out.println("myeondong:"+trash.getMyeondong());
//			System.out.println("address:"+trash.getOldcloaddress());
		
		}
		model.addAttribute("trash", list);
		System.out.println("list:"+list);
		
		return list;
	}
	

	//판매 업체 jsp 넘겨주는것	
	@GetMapping("/businessinfo")
	public String businessinfo(Model model) {
		try {
	         Business bauthuser=new Business();
	         String sect;
	         Integer userno =0;
	         Users uauthuser=new Users();	        
	         if(session.getAttribute("authUser")!=null) {
		         if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")){
		            uauthuser = (Users) session.getAttribute("authUser");
		            sect = uauthuser.getSect(); 
		            userno = uauthuser.getUserno();
		            System.out.println("sect " + sect);
		         } else{
		        	 bauthuser = (Business) session.getAttribute("authUser");
			         sect = bauthuser.getSect();
			            //userno = bauthuser.getBno();
			         System.out.println(sect);
		         }
	         }else {
	        	 model.addAttribute("logincheck","false");
	         }
			 //Business business = (Business) session.getAttribute("bauthUser");			 
			if(userno!=null || userno !=0) { //개인이 로그인 했을떄 										
				List<Likes> list =  likesService.getbno(userno);
				System.out.println("userslist : " + list);	
				model.addAttribute("list",list);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "info/businessinfo";
	}
	
	// 판매업체
	@ResponseBody
	@PostMapping("/businesslist")
	public List<Business> businesslist(@RequestBody Map<String,Object> params,Model model) {
		List<Business> business = null;
		//ajax로 데이터 받아온 것
		String sido = (String) params.get("sido");		
		String sigungu = (String) params.get("sigugun");		
		
		System.out.println("sido : " + sido);
		System.out.println("sigungu : " + sigungu);
		try {
			business = businessService.allBusinessInfo(sido,sigungu);			

		}catch(Exception e) {
			e.printStackTrace();
		}
		return business;
	}

	//판매업체 좋아요
		@ResponseBody
		@PostMapping("/businessinfo/likes")
		public Long registLikes(@RequestParam("bno") Integer bno) {
			Likes likes = new Likes();
			Long likescheck = null;
			Users uauthuser=new Users();
			Integer userno=0;
			try {
				//개인이 로그인 했을 때 
				if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")) {
					uauthuser = (Users) session.getAttribute("authUser");
					userno = uauthuser.getUserno();
				}
				likes.setBno(bno);
				likes.setUserno(userno);
				
				likescheck = likesService.getBlikescheck(likes); //likescheck를 가져와(지금 무슨 상태죠?)
				if(likescheck == null) { //처음 눌렀을 때
					likesService.registBlikes(likes);
					likesService.upBusinessLikes(likes);
				}else{
					System.out.println("1일때"+ likescheck);
					likes.setLikescheck(likesService.getBlikescheck(likes));
					likesService.updateBlikes(likes);				
				}
				likescheck = likesService.getBlikescheck(likes);
			}catch(Exception e) {
				e.printStackTrace();
			}
			return likescheck;
		}
		
	
}
