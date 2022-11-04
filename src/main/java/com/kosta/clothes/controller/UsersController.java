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
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.Users;
import com.kosta.clothes.service.CertificationService;
import com.kosta.clothes.service.UsersService;
@Controller
public class UsersController {
	
	@Autowired
	ServletContext servletContext;
	
	@Autowired
	CertificationService certificationService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	UsersService usersService;
	
	//회원가입[개인]
	@PostMapping("/personnal")
	public ModelAndView personnal(@ModelAttribute Users users
			, Model model) {
		ModelAndView mav = new ModelAndView("redirect:/personnal"); //뷰 동시 설정
		try {
			certificationService.insertUsers(users);
			model.addAttribute("users",users);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	
	
	/* 인증번호 */
	//본인 인증 !
    @ResponseBody
    @GetMapping("/main/execute")
    public String sendSMS(String userPhoneNum) {
        // 5자리 인증번호 만들기
        Random random  = new Random();
        String numStr = "";
        for(int i=0; i<5; i++) {
            String ranNum = Integer.toString(random.nextInt(10));   // 0부터 9까지 랜덤으로 숫자를 뽑는다.
            numStr += ranNum;   // 랜덤으로 나온 숫자를 하나씩 누적해서 담는다.
        }
        // 확인용
        System.out.println("수신자 번호 : " + userPhoneNum);
        System.out.println("인증번호 : " + numStr);
        // 문자 보내기
        certificationService.certifiedPhoneNumber(userPhoneNum , numStr);
        return numStr;    // 인증번호 반환
    }
    
    //닉네임 중복 확인!
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
    
    //이메일 중복 확인!
    @ResponseBody
    @PostMapping("/checkemail")
    public String checkemail(Model model, @RequestParam("checkemail") String checkemail) {
    	System.out.println("nickname" + checkemail);
    	try {
    		if(certificationService.checkEmail(checkemail)) {
    			return "true"; //닉네임이 중복이라면 true값을 가져온다.
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

