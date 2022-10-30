//package com.kosta.clothes.controller;
//
//import java.util.Random;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import com.kosta.clothes.service.CertificationService;
//
//
//
//@Controller
//public class UsersController {
//	
//	@Autowired
//	CertificationService certificationService;
//	/* 인증번호 */
//    @ResponseBody
//    @GetMapping("/main/execute")
//    public String sendSMS(String userPhoneNum) {
//        // 5자리 인증번호 만들기
//        Random random  = new Random();
//        String numStr = "";
//        for(int i=0; i<5; i++) {
//            String ranNum = Integer.toString(random.nextInt(10));   // 0부터 9까지 랜덤으로 숫자를 뽑는다.
//            numStr += ranNum;   // 랜덤으로 나온 숫자를 하나씩 누적해서 담는다.
//        }
//        // 확인용
//        System.out.println("수신자 번호 : " + userPhoneNum);
//        System.out.println("인증번호 : " + numStr);
//
//        // 문자 보내기
//        certificationService.certifiedPhoneNumber(userPhoneNum , numStr);
//        return numStr;    // 인증번호 반환
//    }
//
//
//
//}
