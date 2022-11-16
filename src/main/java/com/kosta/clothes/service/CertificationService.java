package com.kosta.clothes.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Business;

import com.kosta.clothes.bean.Users;
import com.kosta.clothes.dao.UsersDAO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
@Service
public class CertificationService implements UsersService {

	@Autowired
	UsersDAO usersDao;

	// 인증번호(전화번호, 인증번호)
    public void certifiedPhoneNumber(String phone, String cerNum) {
        String api_key = "NCSDPJ0B6C6QCEYN"; //coolsms에서 발급받은 api_key
        String api_secret = "QNZICKM2RTJY1NBJYIEEEK92YXSVXTCL";//coolsms에서 발급받은 api_secret key
        Message coolsms = new Message(api_key, api_secret);
        HashMap<String, String> params = new HashMap<>();
        params.put("to", phone);    // 수신전화번호 
        params.put("from", "01020564881");    // 발신전화번호 테스트 시에는 본인 번호 다 넣기 수신/발신 
        params.put("type", "SMS");
        params.put("text", "하우헌옷의 인증번호 : " + "["+cerNum+"]" + "입니다."); //문자 받을 때 문구 넣 을 곳 
        params.put("app_version", "test app 1.2"); // application name and version
        try {
            JSONObject obj = coolsms.send(params);  // 문자 보내기
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {  // 문자전송 실패 시 메세지
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
    }
    
    //닉네임 중복 체크[개인]
    public boolean checkId(String checknick) throws Exception{
    	Users users = usersDao.selectName(checknick); //닉네임에 대한 정보를 찾아와 담는다ㅏ.
    	System.out.println("users" + users);
    	if(users == null) {//정보가 null라면 사용가능
    		return false;
    	}
    	return true;
    }
    
    //상호명 중복 체크[업체]
    @Override
	public boolean checkBname(String checkname) throws Exception {
    	Business business = usersDao.selectBname(checkname);//닉네임에 대한 정보를 찾아와 담는다ㅏ.
    	if(business == null) {//정보가 null라면 사용가능
    		return false;
    	}
		return true;
	}
    
    //아이디 중복 체크[개인]
	@Override
	public boolean checkuserid(String checkuserid) throws Exception {
		Users users = usersDao.selectuserid(checkuserid);//아이디에 대한 정보를 찾아와 담는다ㅏ.
    	System.out.println("users" + users);
    	if(users == null) {//정보가 null라면 사용가능
    		return false;
    	}
    	return true;
	}

	
	 //아이디 중복 체크[업체]
		@Override
		public boolean businessidCheck(String businessidCheck) throws Exception {
			Business business = usersDao.selectbusinessid(businessidCheck);//아이디에 대한 정보를 찾아와 담는다ㅏ.
	    	if(business == null) {//정보가 null이라면 사용가능
	    		return false;
	    	}
	    	return true;
		}
	
	//회원가입[개인]
	@Override
	public void insertUsers(Users users) throws Exception {
		System.out.println("users : " + users.toString());
		usersDao.insertUsers(users);
	}

	//회원가입[업체]
	@Override
	public void insertBusiness(Business business) throws Exception {
		System.out.println("business : " + business.toString());
		usersDao.insertBusiness(business);
	}

	//로그인[개인]
		@Override
		public Users login(String userid, String password) throws Exception {
			System.out.println(userid);
			System.out.println(password);
			Map<String,String> map = new HashMap<String, String>();
			map.put("userid", userid);
			map.put("password", password);
			return usersDao.selectAccount(map);
		}
		//로그인[업체]
		@Override
		public Business blogin(String businessid, String bpassword) throws Exception {
			System.out.println(businessid);
			System.out.println(bpassword);
			Map<String,String> map = new HashMap<String, String>();
			map.put("businessid", businessid);
			map.put("bpassword", bpassword);
			return usersDao.selectbAccount(map);
		}

		@Override
		public List<String> findUserId(String phone) throws Exception {
			return usersDao.findUserId(phone);
		}

		@Override
		public List<String> findBusinessId(String bphone) throws Exception {
			return usersDao.findBusinessId(bphone);
		}

		@Override
		public String checkUserIdnPhone(String userid, String phone) throws Exception {
			Map<String,String> map = new HashMap<String, String>();
			map.put("userid", userid);
			map.put("phone", phone);
			return usersDao.checkUserIdnPhone(map);
		}

		@Override
		public String checkBusinessIdnPhone(String businessid, String bphone) throws Exception {
			Map<String,String> map = new HashMap<String, String>();
			map.put("businessid", businessid);
			map.put("bphone", bphone);
			return usersDao.checkBusinessIdnPhone(map);
		}

		@Override
		public void changePass(String userid, String password) throws Exception {
			System.out.println("userid:"+userid);
			System.out.println("password:"+password);
			Map<String,String> map = new HashMap<String, String>();
			map.put("userid", userid);
			map.put("password", password);
			usersDao.updatepassword(map);
		}

		@Override
		public void changebPass(String businessid, String bpassword) throws Exception {
			System.out.println("businessid:"+businessid);
			System.out.println("bpassword:"+bpassword);
			Map<String,String> map = new HashMap<String, String>();
			map.put("businessid", businessid);
			map.put("bpassword", bpassword);
			usersDao.updatebpassword(map);
		}

}
