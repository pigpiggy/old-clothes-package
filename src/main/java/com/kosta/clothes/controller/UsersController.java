package com.kosta.clothes.controller;


import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosta.clothes.bean.Business;
import com.kosta.clothes.bean.Users;
import com.kosta.clothes.service.CertificationService;
import com.kosta.clothes.service.UsersService;
@Controller
public class UsersController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	CertificationService certificationService;
	

	
	//joinform.jsp 페이지로 이동
	@GetMapping("/joinform")
	public String joinform() {
		return "/user/joinform";
	}


	@Autowired
	HttpSession session;
	
	@Autowired
	UsersService usersService;
	

	//회원가입[개인]
	@PostMapping("/personnal")
	public String personnal(@ModelAttribute Users users, Model model) {
		System.out.println("usersController:" + users.toString());
		try {
			certificationService.insertUsers(users); //사용자가 입력한 정보를 DB에 전달[Service에] 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "home";
	}
	
	

	//회원가입[업체]
	@PostMapping("/businesss")
	public String business(@ModelAttribute Business business, Model model) {
		System.out.println("usersController:" + business.toString());
		try {
			certificationService.insertBusiness(business); //사용자가 입력한 정보를 DB에 전달[Service에]
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "home";
	}
	
		

	/* 인증번호 */
	//본인 인증 !
    @ResponseBody
    @GetMapping("/main/execute")
    public String sendSMS(String phone) {
        // 5자리 인증번호 만들기
        Random random  = new Random();
        String numStr = "";
        for(int i=0; i<5; i++) {
            String ranNum = Integer.toString(random.nextInt(10));   // 0부터 9까지 랜덤으로 숫자를 뽑는다.
            numStr += ranNum;   // 랜덤으로 나온 숫자를 하나씩 누적해서 담는다.
        }
        // 확인용
        System.out.println("수신자 번호 : " + phone);
        System.out.println("인증번호 : " + numStr);
        // 문자 보내기
        certificationService.certifiedPhoneNumber(phone , numStr);
        return numStr;    // 인증번호 반환
    }
    
    //닉네임 중복 확인[개인]
    @ResponseBody
    @PostMapping("/nickname")
    public String checknick(Model model, @RequestParam("nickname") String nickname) {
    	System.out.println("nickname" + nickname);
    	try {
    		if(certificationService.checkId(nickname)) {
    			return "true"; //닉네임이 중복이라면 true값을 가져온다.
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return "false";
    }

    //닉네임 중복 확인[업체]
    @ResponseBody
    @PostMapping("/bname")
    public String bname(Model model, @RequestParam("bname") String bname) {
    	System.out.println("nickname" + bname);
    	try {
    		if(certificationService.checkBname(bname)) {
    			return "true"; //닉네임이 중복이라면 true값을 가져온다.
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return "false";
    }

    
    //아이디 중복 확인[개인]
    @ResponseBody
    @PostMapping("/checkuserid")
    public String checkuserid(Model model, @RequestParam("checkuserid") String checkuserid) {
    	System.out.println("nickname" + checkuserid);
    	try {
    		if(certificationService.checkuserid(checkuserid)) {
    			return "true"; //아이디가 중복이라면 true값을 가져온다.
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return "false";
    }

    //아이디 중복 확인[업체]
    @ResponseBody
    @PostMapping("/businessid")
    public String buserid(Model model, @RequestParam("businessid") String businessid) {
    	System.out.println("businessid" + businessid);
    	try {
    		if(certificationService.businessidCheck(businessid)) {
    			return "true"; //아이디가 중복이라면 true값을 가져온다.
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return "false";
    }


    //로그인창
    @GetMapping("/login")
    public String login() {
    	return "user/loginform";
    }
    //로그인
    @PostMapping("/login")
    public String login(@RequestParam(value="id",required = true,defaultValue = "")String id, 
    					@RequestParam(value="password",required = true,defaultValue = "")String password,
    					Model model) {
    	try {
    		Users authUser=null;
    		Business bauthUser = null;
    		String userid = id;
    		System.out.println("id:"+userid);
    		System.out.println("password:"+password);
    		authUser = usersService.login(userid,password);
    		System.out.println(authUser);
    		if(authUser == null) {
    			String businessid = id;
    			String bpassword = password;
    			System.out.println("bid:"+businessid);
        		System.out.println("password:"+bpassword);
        		bauthUser = usersService.blogin(businessid,bpassword);
    		}
    		if(authUser == null && bauthUser==null) {
    			model.addAttribute("result", "fail");
				return "/user/loginform";
    		}else if(authUser!=null){
    			session.setAttribute("authUser", authUser);
    		}else {
    		session.setAttribute("authUser", bauthUser);
    		}
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return "redirect:/";
    }
  //로그아웃
  @RequestMapping(value="/logout",method = RequestMethod.GET)
  public String logout(HttpSession session) {
	  session.removeAttribute("authUser");
	  return "redirect:/";
  }
  //아이디찾기창
  @GetMapping("/searchid")
  public String searchId() {
	  return "user/searchid";
  }
  //아이디찾기
  @PostMapping("/searchid")
  public String searchId(@RequestParam("ph")String ph, Model model) {
	  System.out.println(ph);
	  try {
		 String fuId = null;
		 String fbId = null;
		 String phone = ph; 
		 fuId = usersService.findUserId(phone);
		 System.out.println(fuId);
		 if(fuId != null) {
			 model.addAttribute("user", fuId);
		 } else if(fuId==null) {
			 String bphone = ph;
			 fbId = usersService.findBusinessId(bphone);
			 System.out.println(fbId);
			 model.addAttribute("business", fbId);
		 }
		 if(fuId==null&&fbId==null) {
			 model.addAttribute("msg", "정보와 일치하는 아이디가 없습니다.");
			 return "user/searchid";
		 }
		  
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return "user/searchidresult";
  }
  //아이디와 전화번호 체크창
  @GetMapping("/checkidnphone")
  public String checkIdnPhone() {
	  return "user/checkidnphone";
  }
  //아이디와 전화번호 체크
  @PostMapping("/checkidnphone")
  public String checkIdnPhone(@RequestParam("id")String id,@RequestParam("phone")String ph, Model model) {
	  try {
		  String userid = null;
		  String businessid = null;
		  String phone = null;
		  String bphone = null;
		  String cbid = null;
		  userid = id;
		  phone = ph;
		  String cuid = usersService.checkUserIdnPhone(userid, phone);
		  if(cuid!=null) {
			  model.addAttribute("id", cuid);
		  } else if(cuid==null) {
			  businessid = id;
			  bphone = ph;
			  cbid = usersService.checkBusinessIdnPhone(businessid, bphone);
			  model.addAttribute("id", cbid);
		  }
		  if(cuid==null&&cbid==null) {
			  model.addAttribute("msg", "정보와 일치하는 회원이 없습니다.");
				 return "user/checkidnphone";
		  }
		  
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return "user/changepass";
  }
  //새 비밀번호
  @PostMapping("/changepass")
  public String changePass(@RequestParam("id")String id, 
		  @RequestParam("password") String password, Model model) {
	  try { 
		  System.out.println("id:"+id);
		  boolean cuserid = usersService.checkuserid(id);
		  boolean cbusinessid = usersService.businessidCheck(id);
		  System.out.println("cuserid:"+cuserid);
		  System.out.println("cbusinessid:"+cbusinessid);
		  if(cuserid) {
		  usersService.changePass(id, password);
	  	  }else if(cbusinessid) {
	  	  String bpassword = password;
	  	  usersService.changebPass(id, bpassword);
	  	  }
	  	  else {
	  		  model.addAttribute("msg", "비밀번호 수정에 실패했습니다.");
	  		  return "user/changepass";
	  	  }
		  
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	  return "user/loginform";
  }
}

