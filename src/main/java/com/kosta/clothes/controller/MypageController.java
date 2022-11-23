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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.MessageVO;
import com.kosta.clothes.bean.PageInfo;
import com.kosta.clothes.bean.Users;
import com.kosta.clothes.service.MessageService;

@Controller
public class MypageController {

	@Autowired 
	MessageService messageService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping ("/mypage")
	String main() {
		return "/mypage/mypage";
	}
	
	@GetMapping ("/mypage/message")
	String myMessage(@RequestParam(value = "page", required = false, defaultValue = "1") Integer page, Model model) {
		List<MessageVO> rmessageList = new ArrayList<>();
		List<MessageVO> smessageList = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		PageInfo pageInfo = new PageInfo();
		try {
	         Business bauthuser = new Business();
	         String sect;
	         Users uauthuser = new Users();
	         if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")){
	            uauthuser = (Users) session.getAttribute("authUser");
	            map.put("recvUserno", uauthuser.getUserno());
	            map.put("page", page);
	            map.put("pageInfo", pageInfo);
	            rmessageList = messageService.uRecvMessage(map);
	            smessageList = messageService.uSendMessage(uauthuser.getUserno(),page,pageInfo);
	            model.addAttribute("recvmessage", rmessageList);
	            model.addAttribute("sendmessage", smessageList);
	            
	         } else {
	            bauthuser = (Business) session.getAttribute("authUser");
	            map.put("recvUserno", bauthuser.getBno());
	            map.put("page", page);
	            map.put("pageInfo", pageInfo);
	            rmessageList = messageService.bRecvMessage(map);
	            smessageList = messageService.bSendMessage(bauthuser.getBno(),page,pageInfo);
	            model.addAttribute("recvmessage", rmessageList);
	            model.addAttribute("sendmessage", smessageList);
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
