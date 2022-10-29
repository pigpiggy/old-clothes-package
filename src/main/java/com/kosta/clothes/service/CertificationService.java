package com.kosta.clothes.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Users;
import com.kosta.clothes.dao.UsersDAO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class CertificationService implements UsersService {

	@Autowired
	UsersDAO usersDao;
	// 인증번호(전화번호, 인증번호)
    public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
        String api_key = "NCSSTR2OR1HK2NFR"; //coolsms에서 발급받은 api_key
        String api_secret = "XZ48XV4BD6MGF7DAAWJAG7PNSBMWKRLY";//coolsms에서 발급받은 api_secret key
        Message coolsms = new Message(api_key, api_secret);

        HashMap<String, String> params = new HashMap<>();
        params.put("to", phoneNumber);    // 수신전화번호 
        params.put("from", "01086963080");    // 발신전화번호 테스트 시에는 본인 번호 다 넣기 수신/발신 
        params.put("type", "SMS");
        params.put("text", "하우헌옷의 인증번호 " + "["+cerNum+"]" + "를 입력하세요."); //문자 받을 때 문구 넣 을 곳 
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = coolsms.send(params);  // 문자 보내기
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {  // 문자전송 실패 시 메세지
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
    }
    
    //닉네임 중복 체크
    public boolean checkId(String checknick) throws Exception{
    	Users users = usersDao.selectName(checknick);
    	System.out.println("users" + users);
    	if(users == null) {
    		return false;
    	}
    	return true;
    }

    //이메일 중복 체크
	@Override
	public boolean checkEmail(String checkemail) throws Exception {
		Users users = usersDao.selectEmail(checkemail);
    	System.out.println("users" + users);
    	if(users == null) {
    		return false;
    	}
    	return true;
	}

}
