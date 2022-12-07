package com.kosta.clothes.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.MessageVO;
import com.kosta.clothes.bean.PageInfo;
import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.bean.Users;
import com.kosta.clothes.bean.Wapply;
import com.kosta.clothes.service.MessageService;
import com.kosta.clothes.service.MypageService;
import com.kosta.clothes.service.ReviewService;
import com.kosta.clothes.service.SellService;
import com.kosta.clothes.service.SharingService;

@Controller
public class MypageController {

	@Autowired 
	MessageService messageService;
	@Autowired
	SharingService sharingService;
	@Autowired
	SellService sellService;
	@Autowired
	ReviewService reviewService;
	@Autowired
	MypageService mypageService;
	
	@Autowired
	HttpSession session;
	
	/*
	 * @GetMapping ("/mypage") String main() { return "/mypage/mypage"; }
	 */
	@GetMapping ("/mypage/bmypage/{bno}")
	String main(@PathVariable("bno") Integer bno,Model model) {
		System.out.println("bmypage" + bno);
		try {
			Business business = messageService.mypageBusiness(bno);
			System.out.println("business mypage" +  business.toString());
			model.addAttribute("business",business);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/mypage/bmypage";
	}
	

	@GetMapping ("mypage/umypage/{userno}")
	String umypage(@PathVariable("userno") Integer userno,Model model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "spage", required = false, defaultValue = "1") Integer spage) {
		PageInfo pageInfo = new PageInfo();
		PageInfo spageInfo = new PageInfo();
		System.out.println("mypage" + userno);
		try {
			System.out.println("여기기기기기기");
			/*판매 상품(개인판매)*/
			List<Sell> sellList;
			/* 판매 상품(무료나눔) */
			List<Sharing> sharingList;
			if(session.getAttribute("authUser")!=null) {
				if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")){
				  Users users1 = (Users) session.getAttribute("authUser");
				  System.out.println("userssss241" + users1.toString());
				//상품등록
				 Integer sharingcount = sharingService.sharingcount(userno);
				 System.out.println("sharingcount : " + sharingcount);
				 Integer sellcount = sellService.sellcount(userno);
				 System.out.println("sellcount:" + sellcount);
				 Integer totalcount = sharingcount + sellcount;
				 System.out.println("totalcount : " + totalcount);
				 model.addAttribute("totalcount",totalcount);
				 
				 //거래후기
				 Integer reviewcount = reviewService.reviewcount(userno);
				 model.addAttribute("reviewcount",reviewcount);		 
				
				 //거래완료
				 Integer statuscount = sharingService.statuscount(userno);
				 System.out.println("statuscount:"+statuscount);
				 statuscount +=sellService.statuscount(userno);
				 System.out.println("statuscount:"+statuscount);
				 model.addAttribute("statuscount",statuscount);
				 
				 sellList = mypageService.getSellList(userno,page,pageInfo);
				 model.addAttribute("pageInfo", pageInfo);
				 model.addAttribute("sellList", sellList);
				 System.out.println("sellList:"+sellList);
				 sharingList = mypageService.getSharingList(userno,spage,spageInfo);
				 model.addAttribute("spageInfo", spageInfo);
				 model.addAttribute("sharingList", sharingList);
				 
				 //users 값을 가져온다
				 Users users = mypageService.getMypage(userno);
				 System.out.println("userssss" + users.toString());
				 model.addAttribute("users",users);
				}else if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Business")) {
					//상품등록
					 Integer sharingcount = sharingService.sharingcount(userno);
					 System.out.println("sharingcount : " + sharingcount);
					 Integer sellcount = sellService.sellcount(userno);
					 System.out.println("sellcount:" + sellcount);
					 Integer totalcount = sharingcount + sellcount;
					 System.out.println("totalcount : " + totalcount);
					 model.addAttribute("totalcount",totalcount);
					 
					 //거래후기
					 Integer reviewcount = reviewService.reviewcount(userno);
					 model.addAttribute("reviewcount",reviewcount);		 
					
					 //거래완료
					 Integer statuscount = sharingService.statuscount(userno);
					 System.out.println("statuscount:"+statuscount);
					 statuscount +=sellService.statuscount(userno);
					 System.out.println("statuscount:"+statuscount);
					 model.addAttribute("statuscount",statuscount);
					 
					 sellList = mypageService.getSellList(userno,page,pageInfo);
					 model.addAttribute("pageInfo", pageInfo);
					 model.addAttribute("sellList", sellList);
					 System.out.println("sellList:"+sellList);
					 sharingList = mypageService.getSharingList(userno,spage,spageInfo);
					 model.addAttribute("spageInfo", spageInfo);
					 model.addAttribute("sharingList", sharingList);
					 
					 //users 값을 가져온다
					 Users users = mypageService.getMypage(userno);
					 System.out.println("userssss" + users.toString());
					 model.addAttribute("users",users);
				}else {
					
				}
			}else {
				//상품등록
				 Integer sharingcount = sharingService.sharingcount(userno);
				 System.out.println("sharingcount : " + sharingcount);
				 Integer sellcount = sellService.sellcount(userno);
				 System.out.println("sellcount:" + sellcount);
				 Integer totalcount = sharingcount + sellcount;
				 System.out.println("totalcount : " + totalcount);
				 model.addAttribute("totalcount",totalcount);
				 
				 //거래후기
				 Integer reviewcount = reviewService.reviewcount(userno);
				 model.addAttribute("reviewcount",reviewcount);		 
				
				 //거래완료
				Integer statuscount = sharingService.statuscount(userno);
				System.out.println("statuscount:"+statuscount);
				statuscount +=sellService.statuscount(userno);
				System.out.println("statuscount:"+statuscount);
				model.addAttribute("statuscount",statuscount);
				 
				 sellList = mypageService.getSellList(userno,page,pageInfo);
				 model.addAttribute("pageInfo", pageInfo);
				 model.addAttribute("sellList", sellList);
				 System.out.println("sellList:"+sellList);
				 sharingList = mypageService.getSharingList(userno,spage,spageInfo);
				 model.addAttribute("spageInfo", spageInfo);
				 model.addAttribute("sharingList", sharingList);
				 
				 //users 값을 가져온다
				  Users users = mypageService.getMypage(userno);
				  System.out.println("userssss" + users.toString());
				  model.addAttribute("users",users);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/mypage/usermypage";
	}
	
	@PostMapping("/mypage/smessage")
	public ModelAndView submitMessage(@ModelAttribute MessageVO message, Model model, RedirectAttributes r) {
		ModelAndView mav = new ModelAndView();
		try {
			String sect = "";
			if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")) {
				Users users = (Users) session.getAttribute("authUser");
				message.setSendUserno(users.getUserno());
				sect = users.getSect();
				System.out.println("답장:" + message);
			} else {
				Business bauthuser = (Business) session.getAttribute("authUser");
				message.setSendBno(bauthuser.getBno());
				sect = bauthuser.getSect();
			}
			System.out.println("messagecontroller:" + message);
			String submitcheck = messageService.submitMessage(message, sect);
			System.out.println("submitcheck:"+submitcheck);
			if(submitcheck.equals("true")) {
				r.addAttribute("submitcheck", "true");
			}else {
				r.addAttribute("submitcheck", "false");
			}
			mav.setViewName("redirect:/mypage/message");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
		
	}
	
	@GetMapping ("/mypage/message")
	String myMessage(@RequestParam(value = "rpage", required = false, defaultValue = "1") Integer rpage,
			@RequestParam(value = "spage", required = false, defaultValue = "1") Integer spage, Model model,
			@RequestParam(value = "select", required = false, defaultValue = "0") Integer select,
			@RequestParam(value = "submitcheck", required = false, defaultValue = "") String submitcheck) {
		List<MessageVO> rmessageList = new ArrayList<>();
		List<MessageVO> smessageList = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		PageInfo rpageInfo = new PageInfo();
		PageInfo spageInfo = new PageInfo();
		try {
	         Business bauthuser = new Business();
	         String sect;
	         Users uauthuser = new Users();
	         if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")){
	            uauthuser = (Users) session.getAttribute("authUser");
	            map.put("recvUserno", uauthuser.getUserno());
	            map.put("page", rpage);
	            map.put("pageInfo", rpageInfo);
	            rmessageList = messageService.uRecvMessage(map);//사용자의 받은편지함
	            smessageList = messageService.uSendMessage(uauthuser.getUserno(),spage,spageInfo);//사용자의 보낸편지함
	            model.addAttribute("recvmessage", rmessageList);
	            model.addAttribute("sendmessage", smessageList);
	            model.addAttribute("rpageInfo", rpageInfo);
	            model.addAttribute("spageInfo", spageInfo);
	            model.addAttribute("select", select);
	            model.addAttribute("submitcheck", submitcheck);
	         } else {
	            bauthuser = (Business) session.getAttribute("authUser");
	            map.put("recvUserno", bauthuser.getBno());
	            System.out.println("businessno:"+bauthuser.getBno());
	            map.put("page", rpage);
	            map.put("pageInfo", rpageInfo);
	            rmessageList = messageService.bRecvMessage(map);
	            System.out.println("spage:"+spage);
	            smessageList = messageService.bSendMessage(bauthuser.getBno(),spage,spageInfo);
	            System.out.println(smessageList);
	            model.addAttribute("recvmessage", rmessageList);
	            model.addAttribute("sendmessage", smessageList);
	            model.addAttribute("rpageInfo", rpageInfo);
	            model.addAttribute("spageInfo", spageInfo);
	            model.addAttribute("select", select);
	            model.addAttribute("submitcheck", submitcheck);
	         }
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/mypage/message";
	}
	
	@ResponseBody
	@GetMapping("/viewRecvMessage")
	public MessageVO viewRecvMessage(@RequestParam("mno") Integer mno) {
		MessageVO message = new MessageVO();
		try {
		     Business bauthuser = new Business();
	         Users uauthuser = new Users();
	         if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")){
	            uauthuser = (Users) session.getAttribute("authUser");
	            message = messageService.uRecvViewMessage(mno);
	            System.out.println("뷰리시브" +message);
	         } else {
	            bauthuser = (Business) session.getAttribute("authUser");
	            message = messageService.bRecvViewMessage(mno);
	         }			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	
	@ResponseBody
	@GetMapping("/viewSendMessage")
	public MessageVO viewSendMessage(@RequestParam("mno") Integer mno) {
		MessageVO message = new MessageVO();
		try {
		     Business bauthuser = new Business();
	         Users uauthuser = new Users();
	         if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")){
	            uauthuser = (Users) session.getAttribute("authUser");
	            message = messageService.uSendViewMessage(mno);
	         } else {
	            bauthuser = (Business) session.getAttribute("authUser");
	            message = messageService.bSendViewMessage(mno);
	         }			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	
	@ResponseBody
	@GetMapping("/recvDelete")
	public void recvDelete(@RequestParam("mno") Integer mno) {
		try {
			messageService.deleteMessage(mno);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@GetMapping("/sendDelete")
	public void sendDelete(@RequestParam("mno") Integer mno) {
		try {
			messageService.deleteMessage(mno);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/mypage/review")
	public String review() {
		try {
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/mypage/review";
	}
	//마이페이지 자기소개란 수정
	@ResponseBody
	@PostMapping("/mypage")
	public String introduce(@RequestParam("introduce") String introduce) {
		String introtext="";
		try { 
				Business bauthuser = new Business();
		         Users uauthuser = new Users();
		         if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")){
		            uauthuser = (Users) session.getAttribute("authUser");
		            introtext=mypageService.uintroduce(introduce,uauthuser.getUserno());
		         } else {
		            bauthuser = (Business) session.getAttribute("authUser");
		            introtext=mypageService.bintroduce(introduce,bauthuser.getBno());
		         }			
			System.out.println("introtext"+introtext);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return introtext;
	}
	
	@ResponseBody
	@GetMapping("/viewsellapply")
	public List<Users> viewsellapply(@RequestParam("ino") Integer ino) {
		List<Users> sellapplylist = null;
		try {
			sellapplylist = mypageService.getSellapplylist(ino);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sellapplylist;
	}
	
	@ResponseBody
	@GetMapping("/viewsharingapply")
	public List<Users> viewsharingapply(@RequestParam("sno") Integer sno) {
		List<Users> sharingapplylist = null;
		try {
			sharingapplylist = mypageService.getSharingapplylist(sno);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sharingapplylist;
	}
}
