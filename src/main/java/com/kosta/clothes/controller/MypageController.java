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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kosta.clothes.bean.Apply;
import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.MessageVO;
import com.kosta.clothes.bean.PageInfo;
import com.kosta.clothes.bean.Review;
import com.kosta.clothes.bean.Sell;
import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.bean.Users;
import com.kosta.clothes.service.ApplyService;
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
	ApplyService applyService;
	
	@Autowired
	HttpSession session;
	
	/*
	 * @GetMapping ("/mypage") String main() { return "/mypage/mypage"; }
	 */
	@GetMapping ("/mypage/bmypage/{bno}")
	String main(@PathVariable("bno") Integer bno,Model model) {
		System.out.println("bmypage" + bno);
		List<Apply> apply = null;
		List<Review> reviewList = null;
		try {
			if(session.getAttribute("authUser")!=null) {//사용자가 로그인 했을 때 
	              if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")){
	                 System.out.println("bmypage 사용자");
	                 Business business = messageService.mypageBusiness(bno);
	                  System.out.println("business mypage" +  business.toString());         
	                  model.addAttribute("business",business);
	                  
	                  //신청목록
	                  Integer applycount = applyService.applycount(bno);
	                  System.out.println("applycount : " + applycount);
	                  model.addAttribute("applycount",applycount);
	                  
	                  //거래후기
	                  reviewList = reviewService.getBReviewList(bno);
	                  model.addAttribute("reviewList", reviewList);
	                  //수거상태
	                  Map astatuscount= applyService.astatuscount(bno);
	                  Integer acount= (Integer) astatuscount.get("수거중");
	                  Integer bcount= (Integer) astatuscount.get("수거거절");
	                  Integer ccount= (Integer) astatuscount.get("수거완료");
	                  System.out.println("astatuscount:"+astatuscount);
	                  model.addAttribute("acount",acount);
	                  model.addAttribute("bcount",bcount);
	                  model.addAttribute("ccount",ccount);
	                  
	                  
	              }else if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Business")) {//사업자가 로그인 했을 때
	                  System.out.println("bmypage 사업자");
	                  Business business = messageService.mypageBusiness(bno);
	                  System.out.println("business mypage" +  business.toString());         
	                  model.addAttribute("business",business);
	                  
	                  //사용자->사업자 신청
	                  apply = applyService.getBapply(bno);
	                  model.addAttribute("apply",apply);
	                  System.out.println("Bmypage apply : " + apply.toString());
	                  //
	                  Integer applycount = applyService.applycount(bno);
	                  System.out.println("applycount : " + applycount);
	                  model.addAttribute("applycount",applycount);
	              
	                  //거래후기
	                  reviewList = reviewService.getBReviewList(bno);
	                  model.addAttribute("reviewList", reviewList);
	                  Map astatuscount= applyService.astatuscount(bno);
	                  Integer acount= (Integer) astatuscount.get("수거중");
	                  Integer bcount= (Integer) astatuscount.get("수거거절");
	                  Integer ccount= (Integer) astatuscount.get("수거완료");
	                  System.out.println("astatuscount:"+astatuscount);
	                  model.addAttribute("acount",acount);
	                  model.addAttribute("bcount",bcount);
	                  model.addAttribute("ccount",ccount);
	                  
	              }else {//로그인 안했을 때
	                 System.out.println("bmypage 무무");
	               Business business = messageService.mypageBusiness(bno);
	               System.out.println("business mypage" +  business.toString());         
	               model.addAttribute("business",business);  
	               
	               //거래후기
	               reviewList = reviewService.getBReviewList(bno);
	               model.addAttribute("reviewList", reviewList);
	               model.addAttribute("business",business);
	               
	               Integer applycount = applyService.applycount(bno);
	                  System.out.println("applycount : " + applycount);
	                  model.addAttribute("applycount",applycount);
	                  
	                  Map astatuscount= applyService.astatuscount(bno);
	                  Integer acount= (Integer) astatuscount.get("수거중");
	                  Integer bcount= (Integer) astatuscount.get("수거거절");
	                  Integer ccount= (Integer) astatuscount.get("수거완료");
	                  System.out.println("astatuscount:"+astatuscount);
	                  model.addAttribute("acount",acount);
	                  model.addAttribute("bcount",bcount);
	                  model.addAttribute("ccount",ccount);
	              }
	         }else {
	            System.out.println("bmypage 무무무");
	            Business business = messageService.mypageBusiness(bno);
	             System.out.println("business mypage" +  business.toString());         
	             model.addAttribute("business",business);
                 //거래후기
                 reviewList = reviewService.getBReviewList(bno);
                 model.addAttribute("reviewList", reviewList);	
	         }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/mypage/bmypage";
	}
	   @GetMapping ("mypage/umypage/{userno}")
	   String umypage(@PathVariable("userno") Integer userno,Model model) {
	      System.out.println("mypage" + userno);
	      try {
	         System.out.println("여기기기기기기");
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

	@GetMapping ("mypage/umypage/{userno}/review")
	public String umypage(@PathVariable("userno") Integer userno, Model model,
			@RequestParam(value = "rpage", required = false, defaultValue = "1") Integer rpage) {
		PageInfo rpageInfo = new PageInfo();
		List<Review> reviewList;
		
		try {
			if(session.getAttribute("authUser")!=null) {
				if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")){
					reviewList = reviewService.getReviewList(userno, rpage, rpageInfo);
					System.out.println("reviewpage:" + reviewList + rpageInfo);
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

					model.addAttribute("rpageInfo", rpageInfo);
					model.addAttribute("reviewList", reviewList);					
				}else if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Business")) {
					reviewList = reviewService.getReviewList(userno, rpage, rpageInfo);
					System.out.println("reviewpage:" + reviewList + rpageInfo);
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

					model.addAttribute("rpageInfo", rpageInfo);
					model.addAttribute("reviewList", reviewList);	
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

				reviewList = reviewService.getReviewList(userno, rpage, rpageInfo);
				System.out.println("reviewpage:" + reviewList + rpageInfo);
				model.addAttribute("rpageInfo", rpageInfo);
				model.addAttribute("reviewList", reviewList);		
			}
			 Users users = mypageService.getMypage(userno);
			 System.out.println("userssss" + users.toString());
			 model.addAttribute("users",users);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mypage/review";
	}
			
	@GetMapping ("mypage/umypage/{userno}/sell")
	public String umypagesell(@PathVariable("userno") Integer userno, Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "spage", required = false, defaultValue = "1") Integer spage) {
		PageInfo pageInfo = new PageInfo();
		PageInfo spageInfo = new PageInfo();
		try {
			/*판매 상품(개인판매)*/
			List<Sell> sellList;
			/* 판매 상품(무료나눔) */
			List<Sharing> sharingList;
			if(session.getAttribute("authUser")!=null) {
				if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")){
					Users users1 = (Users) session.getAttribute("authUser");
					sellList = mypageService.getSellList(userno,page,pageInfo);
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

					model.addAttribute("pageInfo", pageInfo);
					model.addAttribute("sellList", sellList);
					System.out.println("sellList:"+sellList);
					sharingList = mypageService.getSharingList(userno,spage,spageInfo);
					model.addAttribute("spageInfo", spageInfo);
					model.addAttribute("sharingList", sharingList);
				} else if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Business")) {
					 sellList = mypageService.getSellList(userno,page,pageInfo);
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

					 model.addAttribute("pageInfo", pageInfo);
					 model.addAttribute("sellList", sellList);
					 System.out.println("sellList:"+sellList);
					 sharingList = mypageService.getSharingList(userno,spage,spageInfo);
					 model.addAttribute("spageInfo", spageInfo);
					 model.addAttribute("sharingList", sharingList);
				}
			}else {
				sellList = mypageService.getSellList(userno,page,pageInfo);
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

				model.addAttribute("pageInfo", pageInfo);
				model.addAttribute("sellList", sellList);
				System.out.println("sellList:"+sellList);
				sharingList = mypageService.getSharingList(userno,spage,spageInfo);
				model.addAttribute("spageInfo", spageInfo);
				model.addAttribute("sharingList", sharingList);				
			}
			Users users = mypageService.getMypage(userno);
			 System.out.println("userssss" + users.toString());
			 model.addAttribute("users",users);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "/mypage/sellProduct";
	}
	
	@GetMapping ("mypage/umypage/{userno}/buy")
	public String umypagebuy(@PathVariable("userno") Integer userno,Model model, 
			@RequestParam(value = "bspage", required = false, defaultValue = "1") Integer bspage,
			@RequestParam(value = "ppage", required = false, defaultValue = "1") Integer ppage) {
		PageInfo bspageInfo = new PageInfo();
		PageInfo ppageInfo = new PageInfo();
		try {
			/* 구매 상품(개인판매) */
			List<Sell> buysellList;
			/* 구매 상품(무료나눔) */
			List<Sharing> buysharingList;
			if(session.getAttribute("authUser")!=null) {
				if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Users")){
				  Users users1 = (Users) session.getAttribute("authUser");
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

				 buysellList = mypageService.getBuySellList(userno,bspage,bspageInfo);
				 model.addAttribute("bspageInfo", bspageInfo);
				 model.addAttribute("buysellList", buysellList);
				
				 buysharingList = mypageService.getBuySharingList(userno,ppage,ppageInfo);
				 model.addAttribute("ppageInfo", ppageInfo);
				 model.addAttribute("buysharingList", buysharingList);
			
				} else if(session.getAttribute("authUser").getClass().getName().equals("com.kosta.clothes.bean.Business")) {
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

				}
			}else {
				
			}
			 //users 값을 가져온다
			 Users users = mypageService.getMypage(userno);
			 System.out.println("userssss" + users.toString());
			 model.addAttribute("users",users);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "/mypage/buyProduct";
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
   
   @GetMapping("/selectSellApply")
   public String selectSellApply(@RequestParam("list") Integer list, @RequestParam("ino") Integer ino) {
      System.out.println("userno:"+list);
      try {
         mypageService.selectSellApply(list,ino);
         sellService.alterStatus(list, ino);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return "redirect:/sellView/"+ino;
   }
   
   @GetMapping("/selectSharingApply")
   public String selectSharingApply(@RequestParam("list") Integer list, @RequestParam("sno") Integer sno) {
      System.out.println("userno:"+list);
      try {
         mypageService.selectSharingApply(list,sno);
         sharingService.alterStatus(list,sno);
      }catch(Exception e) {
         e.printStackTrace();
      }
      return "redirect:/sharingView/"+sno;
   }
   
   @ResponseBody
   @GetMapping("/cancelDeal")
   public void cancelDeal(@RequestParam("ino") Integer ino) {
      try {
         mypageService.cancelDeal(ino);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   @ResponseBody
   @GetMapping("/cancelSharingDeal")
   public void cancelSharingDeal(@RequestParam("sno") Integer sno) {
      try {
         mypageService.cancelSharingDeal(sno);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   @ResponseBody
   @GetMapping("/completeDeal")
   public void completeDeal(@RequestParam("ino") Integer ino) {
      try {
    	  System.out.println("들어옴");
         mypageService.completeDeal(ino);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   @ResponseBody
   @GetMapping("/completeSharingDeal")
   public void completeSharingDeal(@RequestParam("sno") Integer sno) {
      try {
         mypageService.completeSharingDeal(sno);
      }catch(Exception e) {
         e.printStackTrace();
      }
   } 
   
   @ResponseBody
   @GetMapping("/sendIReview")
   public void sendIReview(@RequestParam("star") Integer star, @RequestParam("content") String content,
		   @RequestParam("ino") Integer ino) {
      try {
    	  Users users = (Users) session.getAttribute("authUser");
    	  Integer userno = users.getUserno();
    	  Map<String, Object> map = new HashMap<String, Object>();
    	  map.put("star", star);
    	  map.put("content", content);
    	  map.put("ino", ino);
    	  map.put("userno", userno);
         mypageService.sendIReview(map);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }
   	
	@GetMapping("/mypage/likelist/{userno}")
	public String likelist(@PathVariable("userno") Integer userno, Model model) {
		try {
			Users users = mypageService.getMypage(userno);
			model.addAttribute("users", users);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mypage/likelist";
	}
	@ResponseBody
	@PostMapping("/mypage/likelist/likelistaj")
	public List<?> likelistaj (@RequestBody Map<String,Object> params, Model model){
		String category = (String) params.get("category");
		System.out.println("category : " + category);
		List<Sharing> sList = new ArrayList<Sharing>();
		List<Sell> iList = new ArrayList<Sell>();
		List<Business> bList = new ArrayList<Business>();
		Users users = (Users)session.getAttribute("authUser");
		Integer userno = users.getUserno();
		try {
			if("free".equals(category)) {
				sList = mypageService.getLikeSharingList(userno);
				for (int i = 0; i < sList.size(); i++) {
					if (sList.get(i).getSfileids() != null) {
						sList.get(i).setSfileids(sList.get(i).getSfileids().split(",")[0]);
					}
				}
				System.out.println("SLIST:"+sList);
				return sList;
			}else if("indi".equals(category)) {
				iList = mypageService.getLikeSellList(userno);
				System.out.println("ILIST:"+iList);
				return iList;
			}else {
				bList = mypageService.getLikeBusinessList(userno);
				System.out.println("BLIST:"+bList);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return bList;
	}
	
}

