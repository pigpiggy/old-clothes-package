package com.kosta.clothes.service;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringJoiner;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.clothes.bean.FileVO;
import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.bean.Users;
import com.kosta.clothes.dao.CommentsDAO;
import com.kosta.clothes.dao.FileDAO;
import com.kosta.clothes.dao.LikesDAO;
import com.kosta.clothes.dao.ReviewDAO;
import com.kosta.clothes.dao.SharingDAO;

@Service
public class SharingServiceImpl implements SharingService{

	@Autowired
	SharingDAO sharingDAO;

	@Autowired
	FileDAO fileDAO;

	@Autowired
	LikesDAO likesDAO;
	
	@Autowired
	ReviewDAO reviewDAO;
	
	@Autowired
	CommentsDAO commentsDAO;
	@Autowired
	ServletContext servletContext;
	
	@Override
	public void registSharing(Sharing sharing, MultipartFile[] files) throws Exception {
		Integer sharingid = sharingDAO.getNextSharingNo();
		Sharing sharingvo = new Sharing();
		sharingvo.setSno(sharingid);
		sharingvo.setStitle(sharing.getStitle());
		sharingvo.setScontent(sharing.getScontent());
		sharingvo.setSstatus("등록완료");
		sharingvo.setUserno(sharing.getUserno());
		String fileids = "";
		FileVO fileVo = new FileVO();
		if(files!=null) {
			String path = servletContext.getRealPath("/upload/");
			for(MultipartFile file : files) {
				if(!file.isEmpty()) {
					fileVo.setDirectory_name(path);
					fileVo.setTname(file.getOriginalFilename());
					fileVo.setTsize(file.getSize());
					fileVo.setSno(sharingid);
					fileVo.setContent_type(file.getContentType());
					fileDAO.insertFileInfo(fileVo);
					System.out.println("sharingServiceImpl:" + fileVo);
					
					FileOutputStream fos = new FileOutputStream(path+fileVo.getTno());
					FileCopyUtils.copy(file.getBytes(), fos);
					
					fileids += fileVo.getTno()+",";
				}
				
			}
		}
		sharingvo.setSfileids(fileids);
		sharingvo.setSdealType(sharing.getSdealType());
		sharingvo.setSaddress(sharing.getSaddress());
		
		sharingDAO.insertSharing(sharingvo);
		System.out.println(sharing);
	}

	@Override
	public Sharing viewSharing(Integer sno) throws Exception {
		return sharingDAO.selectSharing(sno);
	}

	@Override
	public Sharing getUserid(String userid) throws Exception {
		return sharingDAO.getByUserid(userid);
	}
	@Override
	public List<Sharing> getSharingList() throws Exception {
		List<Sharing> sharingList = sharingDAO.selectSharingList();
		for(int i = 0; i < sharingList.size(); i++) {
			String addr = sharingList.get(i).getSaddress();
			String[] addChange = addr.split(" "); //주소 공백으로 분
			if(addChange[2].matches("^.*.구$")) { //세 번째 단어에서 '구'로 끝나면 동까지 입력 
				String join1 = new StringJoiner(" ").add(addChange[0]).add(addChange[1]).add(addChange[2]).add(addChange[3]).toString();
				sharingList.get(i).setSaddress(join1);
				System.out.println("join1:" + join1);

			} else {
				String join2 = new StringJoiner(" ").add(addChange[0]).add(addChange[1]).add(addChange[2]).toString();
				sharingList.get(i).setSaddress(join2);
				System.out.println("join2:" + join2);
			}
			System.out.println("join:");
			System.out.println("string:" + addr);			
		}
		return sharingList;
	}

	@Override
	public List<Sharing> infiniteScrollDown(Integer snoToStart) throws Exception {
		// TODO Auto-generated method stub
		return sharingDAO.infiniteScrollDown(snoToStart);
	}

	@Override
	public List<Sharing> getSharingList(String kwd) throws Exception {
		// TODO Auto-generated method stub
		return sharingDAO.selectSharingSearchedList(kwd);
	}

	@Override
	public List<Sharing> infiniteScrollDown(Integer snoToStart, String kwd) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sno", snoToStart);
		map.put("kwd", kwd);
		return sharingDAO.searchedInfiniteScrollDown(map);
	}

	@Override
	public void modifySharing(Sharing sharing) throws Exception {
		sharingDAO.updateSharing(sharing);
	}

	@Override
	public void deleteSharing(Integer sno) throws Exception {
		likesDAO.deleteSlikes(sno);
		reviewDAO.deleteSReview(sno);
		commentsDAO.commentSDelete(sno);
		sharingDAO.deleteSharing(sno);
		fileDAO.deleteSfileInfo(sno);
	}

	@Override
	public void modifySfileids(Sharing sharing, FileVO fileVo, MultipartFile[] files) throws Exception {
		fileDAO.deleteSfileInfo(sharing.getSno());
		String fileids = "";
		FileVO nfileVo = new FileVO();
		if(files!=null) {
			String path = servletContext.getRealPath("/upload/");
			for(MultipartFile file : files) {
				if(!file.isEmpty()) {
					nfileVo.setDirectory_name(path);
					nfileVo.setTname(file.getOriginalFilename());
					nfileVo.setTsize(file.getSize());
					nfileVo.setSno(sharing.getSno());
					nfileVo.setContent_type(file.getContentType());
					fileDAO.insertFileInfo(nfileVo);
					
					FileOutputStream fos = new FileOutputStream(path+nfileVo.getTno());
					FileCopyUtils.copy(file.getBytes(), fos);
					
					fileids += nfileVo.getTno()+",";
					sharing.setSfileids(fileids);
				} else {
				}
				
			}
		} 
		sharing.setSfileids(sharing.getSfileids());
		sharingDAO.updateSfileids(sharing);
	}

	public void upSharingLikes(Sharing sharing) throws Exception {
		sharingDAO.upSharingLikes(sharing);
	}
	
	public void downSharingLikes(Sharing sharing) throws Exception {
		sharingDAO.downSharingLikes(sharing);
	}

	@Override
	public Users getSnickname(Integer sno) throws Exception {
		return sharingDAO.getSnickname(sno);
	}

	@Override
	public void upApplycount(Sharing sharing) throws Exception {
		sharingDAO.upApplycount(sharing);
	}

	@Override
	public Integer sharingcount(Integer userno) throws Exception {
		
		return  sharingDAO.sharingcount(userno);
	}

	@Override
	public Integer statuscount(Integer userno) throws Exception {
		return sharingDAO.statuscount(userno);
	}

	@Override
	public void alterStatus(Integer userno, Integer sno) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userno", userno);
		map.put("sno", sno);
		sharingDAO.alterSharingStatus(map);
	}

	

	

}
