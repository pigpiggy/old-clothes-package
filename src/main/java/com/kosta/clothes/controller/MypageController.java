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

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.MessageVO;
import com.kosta.clothes.bean.PageInfo;
import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Users;
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
		System.out.println("mypage" + bno);
		try {
			Business business = messageService.mypageBusiness(bno);
			model.addAttribute("business",business);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/mypage/bmypage";
	}
	
	@GetMapping ("/mypage/usermypage/{userno}")
	String umypage(@PathVariable("userno") Integer userno,Model model) {
		System.out.println("mypage" + userno);
		try {
			/*판매목록*/
			List<Sell> sellList;
			
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
			 
			//sellList = mypageService.getSellList(userno);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/mypage/usermypage";
	}
	
	@PostMapping("/mypage/smessage")
	public ModelAndView submitMessage(@ModelAttribute MessageVO message, Model model) {
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
			if(submitcheck == "true") {
				mav.addObject("submitcheck", "true");
			}else {
				mav.addObject("submitcheck", "false");
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
			@RequestParam(value = "select", required = false, defaultValue = "0") Integer select) {
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
	            map.put("rpage", rpage);
	            map.put("pageInfo", rpageInfo);
	            rmessageList = messageService.uRecvMessage(map);
	            smessageList = messageService.uSendMessage(uauthuser.getUserno(),spage,spageInfo);
	            model.addAttribute("recvmessage", rmessageList);
	            model.addAttribute("sendmessage", smessageList);
	            model.addAttribute("rpageInfo", rpageInfo);
	            model.addAttribute("spageInfo", spageInfo);
	            model.addAttribute("select", select);
	         } else {
	            bauthuser = (Business) session.getAttribute("authUser");
	            map.put("recvUserno", bauthuser.getBno());
	            map.put("page", rpage);
	            map.put("pageInfo", rpageInfo);
	            rmessageList = messageService.bRecvMessage(map);
	            smessageList = messageService.bSendMessage(bauthuser.getBno(),spage,spageInfo);
	            model.addAttribute("recvmessage", rmessageList);
	            model.addAttribute("sendmessage", smessageList);
	            model.addAttribute("pageInfo", rpageInfo);
	            model.addAttribute("select", select);
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
	
	@PostMapping("/mypage")
	public String introduce(@RequestParam("introduce") String introduce) {
		String introtext="";
		try {
			introtext=mypageService.introduce(introduce);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}return introtext;
	}
}
