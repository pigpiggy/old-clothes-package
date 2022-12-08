package com.kosta.clothes.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosta.clothes.bean.Apply;
import com.kosta.clothes.bean.Wapply;
import com.kosta.clothes.dao.ApplyDAO;

@Service
public class ApplyServiceImpl implements ApplyService{

	@Autowired
	ApplyDAO applyDAO;
	
	@Override
	public String registSwapply(Wapply wapply) throws Exception {
		applyDAO.insertSwapply(wapply);
		return "true";
	}

	@Override
	public String registIwapply(Wapply wapply) throws Exception {
		applyDAO.insertIwapply(wapply);
		return "true";
	}

	@Override
	public Wapply selectSwapply(Map map) throws Exception {
		return applyDAO.getSapply(map);
	}

	@Override
	public Wapply selectIwapply(Map map) throws Exception {
		return applyDAO.getIapply(map);
	}


	@Override
	public Integer applycount(Integer bno) throws Exception {
		return  applyDAO.applycount(bno);
<<<<<<< HEAD
	}
=======
		}
>>>>>>> fc2f86aef0289dc8b2666abcda59e2cfb6dfd23c

	//사용자 -> 사업자 신청목록
	@Override
	public List<Apply> getBapply(Integer bno) throws Exception {
		return applyDAO.getBapply(bno);
<<<<<<< HEAD

	}

	@Override
	public Map astatuscount(Integer bno) throws Exception { 
		Integer a=applyDAO.astatuscount(bno);
		Integer b=applyDAO.bstatuscount(bno);
		Integer c=applyDAO.cstatuscount(bno);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("수거중", a);
		map.put("수거거절", b);
		map.put("수거완료", c);
		return  map;
=======
>>>>>>> fc2f86aef0289dc8b2666abcda59e2cfb6dfd23c
	}



}
