package com.kosta.clothes.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.FileVO;
import com.kosta.clothes.bean.Likes;
import com.kosta.clothes.bean.MessageVO;
import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Users;
import com.kosta.clothes.bean.Wapply;
import com.kosta.clothes.service.ApplyService;
import com.kosta.clothes.service.LikesService;
import com.kosta.clothes.service.MessageService;
import com.kosta.clothes.service.SellService;

@Controller
public class SellController {
	@Autowired
	SellService sellService;
	
	@Autowired 
	LikesService likesService;
	
	@Autowired
	MessageService messageService;
	
	@Autowired
	ApplyService applyService;
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/sellList")
	public ModelAndView main(HttpServletRequest request, @RequestParam(value = "kwd", required = false) String kwd) {
		ModelAndView mav = new ModelAndView();
		System.out.println(kwd);
		List<Sell> sellList;
		try {
			if (kwd != null && kwd != "") {
				System.out.println("키워드있음");
				sellList = sellService.getSellList(kwd);
			} else {
				sellList = sellService.getSellList();
			}
			for (int i = 0; i < sellList.size(); i++) {
				if (sellList.get(i).getIfileids() != null) {
					sellList.get(i).setIfileids(sellList.get(i).getIfileids().split(",")[0]);
				}
			}
			System.out.println("컨트롤리스트:" + sellList);
			mav.addObject("sellList", sellList);
			mav.addObject("kwd", kwd);
			mav.setViewName("/sell/sellList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@GetMapping("/sellRegistForm")
	public String sharingRegistForm() {
		return "/sell/sellRegistForm";
	}

	@ResponseBody
	@PostMapping("/sellRegist")
	public ModelAndView registSell(@ModelAttribute Sell sell,
			@RequestParam("iimageFile") MultipartFile[] files) {
		ModelAndView mav = new ModelAndView();
		try {
			Users users = (Users) session.getAttribute("authUser");
			if (users != null) {
				sell.setUserno(users.getUserno());
				sellService.registSell(sell, files);
			}
			System.out.println("sellregistcontroller:" + sell);
			mav.setViewName("redirect:/sellList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@GetMapping("/sellView/{ino}")
	public ModelAndView viewSell(@PathVariable("ino") Integer ino, Model model,
			@RequestParam(value = "submitcheck", required = false) String submitcheck) {
		System.out.println("ino:" + ino);
		ModelAndView mav = new ModelAndView();
		try {
			Sell sell = sellService.viewSell(ino);
			System.out.println("sellview:" + sell);
			if(sell.getIfileids() != null) {
				String[] fidArr = sell.getIfileids().split(",");
				mav.addObject("files", fidArr);
			}
			Business bauthuser = new Business();
			String sect;
			Users uauthuser = new Users();
			if(session.getAttribute("authUser") != null) {
				if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")) {
					uauthuser = (Users) session.getAttribute("authUser");
					sect = uauthuser.getSect();
				} else {
					bauthuser = (Business) session.getAttribute("authUser");
					sect = bauthuser.getSect();
				}
				model.addAttribute("sect", sect);
			}	
			//개인
			if(uauthuser.getUserno() == null && bauthuser.getBno() == null) {
				model.addAttribute("logincheck", "false");
			} else if(uauthuser.getUserno() != null) {
				Likes likevo = new Likes();
				likevo.setIno(ino);
				likevo.setUserno(uauthuser.getUserno());
				Long likeselect = likesService.getIlikescheck(likevo);
				if(likeselect != null) {
					mav.addObject("likes", likeselect);
				}
			} else {
				
			}
//			Users users = (Users) session.getAttribute("authUser");
//			if(users == null) {
//				model.addAttribute("logincheck", "false");
//			}else {
//				Likes likevo = new Likes();
//				likevo.setIno(ino);
//				likevo.setUserno(users.getUserno());
//				Long likeselect = likesService.getIlikescheck(likevo);
//				if(likeselect != null) {
//					mav.addObject("likes", likeselect);
//				}
//			}
			Users uservo = new Users();
			uservo = sellService.getInickname(ino);
			model.addAttribute("uservo", uservo);
			model.addAttribute("submitcheck", submitcheck);
			mav.addObject("sell", sell);
			mav.setViewName("/sell/sellView");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}	
	
	@GetMapping("/sellModifyForm")
	public ModelAndView modifySharing(@RequestParam("ino") Integer ino) {
		ModelAndView mav = new ModelAndView();
		try {
			Sell sell = sellService.viewSell(ino);
			mav.addObject("sell", sell);
			mav.setViewName("/sell/sellModifyForm");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@PostMapping("/sellModify")
	public ModelAndView modifySharing(@ModelAttribute Sell sell, @ModelAttribute FileVO fileVo,
			@RequestParam("iimageFile") MultipartFile[] files) {
		ModelAndView mav = new ModelAndView();
		try {
			System.out.println("modifysellcontroller: " + sell);
			sellService.modifySell(sell);
			sellService.modifyIfileids(sell, fileVo, files);
			mav.setViewName("redirect:/sellView/" + sell.getIno());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/sellDelete")
	public ModelAndView deleteSharing(@RequestParam(value = "ino", required = false) Integer ino, Model model) {
		ModelAndView mav = new ModelAndView();
		try {
			sellService.deleteSell(ino);
			mav.setViewName("redirect:/sellList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	@ResponseBody
	@PostMapping("/sellView/likes")
	public Long registLikes(@RequestParam("ino") Integer ino) {
		Likes likes = new Likes();
		Long likescheck = null;
		try {
			likes.setIno(ino);
			if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")) {
				Users user = (Users) session.getAttribute("authUser");
				likes.setUserno(user.getUserno());
			}
			Sell sell = new Sell();
			sell.setIno(ino);
			likescheck = likesService.getIlikescheck(likes);
			if(likescheck == null) {
				likesService.registIlikes(likes);
				sellService.upSellLikes(sell);
			}else if(likescheck == 1) {
				likes.setLikescheck(likesService.getIlikescheck(likes));
				likesService.updateIlikes(likes);
				sellService.downSellLikes(sell);
			}else {
				likes.setLikescheck(likesService.getIlikescheck(likes));
				likesService.updateIlikes(likes);
				sellService.upSellLikes(sell);
			}
			likescheck = likesService.getIlikescheck(likes);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return likescheck;
	}
	
	@PostMapping("/sellView/imessage")
	public ModelAndView submitMessage(@ModelAttribute MessageVO message, Model model, 
			@RequestParam("ino") Integer ino) {
		ModelAndView mav = new ModelAndView();
		try {
			String sect = "";
			if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")) {
				Users users = (Users) session.getAttribute("authUser");
				message.setSendUserno(users.getUserno());
				sect = users.getSect();
			} else {
				Business bauthuser = (Business) session.getAttribute("authUser");
				message.setSendBno(bauthuser.getBno());
				sect = bauthuser.getSect();
			}
			System.out.println("messagecontroller:" + message);
			String submitcheck = messageService.submitMessage(message, sect);
			if(submitcheck == "true") {
				mav.addObject("submitcheck", "true");
			}else {
				mav.addObject("submitcheck", "false");
			}
			mav.setViewName("redirect:/sellView/"+ino);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
		
	}

	@ResponseBody
	@PostMapping("/sellView/wapply")
	public void sharingWapply(@RequestParam("ino") Integer ino, @ModelAttribute Sell sell) {
		try {
			Users users = (Users) session.getAttribute("authUser");
			Wapply apply = new Wapply();
			apply.setWuserno(users.getUserno());
			apply.setIno(ino);
			applyService.registIwapply(apply);
			sellService.upApplycount(sell);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@PostMapping("/sellInfiniteScrollDown")
	public List<Sell> infiniteScrollDown(@RequestBody Map<String, Object> params) {
		String keyword = (String) params.get("keyword");
		Integer ino = Integer.parseInt((String) params.get("ino"));
		Integer inoToStart = ino - 1;
		List<Sell> sellList = new ArrayList<>();
		try {
			if (keyword != null && keyword != "") {
				System.out.println(keyword);
				sellList = sellService.infiniteScrollDown(inoToStart, keyword);
			} else {
				sellList = sellService.infiniteScrollDown(inoToStart);
			}

			System.out.println("스크롤다운" + sellList);
			for (int i = 0; i < sellList.size(); i++) {
				if (sellList.get(i).getIfileids() != null) {
					sellList.get(i).setIfileids(sellList.get(i).getIfileids().split(",")[0]);
					System.out.println(sellList.get(i).getIfileids());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sellList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
