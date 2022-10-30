//package com.kosta.clothes.service;
//
//import java.util.HashMap;
//
//import org.json.simple.JSONObject;
//import org.springframework.stereotype.Service;
//
//import net.nurigo.java_sdk.exceptions.CoolsmsException;
//
//@Service
//public class CertificationService {
//	// 인증번호(전화번호, 인증번호)
//    public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
//        String api_key = "NCSSTR2OR1HK2NFR";
//        String api_secret = "XZ48XV4BD6MGF7DAAWJAG7PNSBMWKRLY";
//        Message coolsms = new Message(api_key, api_secret);
//
//        HashMap<String, String> params = new HashMap<>();
//        params.put("to", phoneNumber);    // 수신전화번호
//        params.put("from", "01086963080");    // 발신전화번호
//        params.put("type", "SMS");
//        params.put("text", "하우헌옷의 인증번호 " + "["+cerNum+"]" + "를 입력하세요.");
//        params.put("app_version", "test app 1.2"); // application name and version
//
//        try {
//            JSONObject obj = coolsms.send(params);  // 문자 보내기
//            System.out.println(obj.toString());
//        } catch (CoolsmsException e) {  // 문자전송 실패 시 메세지
//            System.out.println(e.getMessage());
//            System.out.println(e.getCode());
//        }
//    }
//
//}
