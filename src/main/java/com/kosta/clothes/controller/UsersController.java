package com.kosta.clothes.controller;


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
<<<<<<< HEAD
=======
import org.springframework.web.servlet.ModelAndView;
>>>>>>> e66b4b78ef2b59c90846da7fad90efd4ee664bf5

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
	
<<<<<<< HEAD
	
	//joinform.jsp 페이지로 이동
	@GetMapping("/joinform")
	public String joinform() {
		return "/user/joinform";
	}

=======
	@Autowired
	HttpSession session;
	
	@Autowired
	UsersService usersService;
	
>>>>>>> e66b4b78ef2b59c90846da7fad90efd4ee664bf5
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
	
	
<<<<<<< HEAD
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
	
		
	
=======
>>>>>>> e66b4b78ef2b59c90846da7fad90efd4ee664bf5
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
<<<<<<< HEAD
    
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

}



=======
    //로그인창
    @GetMapping("/login")
    public String login() {
    	return "user/loginform";
    }
    //로그인
    @PostMapping("/login")
    public String login(@RequestParam(value="email",required = true,defaultValue = "")String email, 
    					@RequestParam(value="password",required = true,defaultValue = "")String password,
    					Model model) {
    	try {
    		System.out.println("email:"+email);
    		System.out.println("password:"+password);
    		Users authUser = usersService.login(email,password);
    		System.out.println(authUser);
    		if(authUser == null) {
    			model.addAttribute("result", "fail");
				return "/user/loginform";
    		}
    		session.setAttribute("authUser", authUser);
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

}

>>>>>>> e66b4b78ef2b59c90846da7fad90efd4ee664bf5
