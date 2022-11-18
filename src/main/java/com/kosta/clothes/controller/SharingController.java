package com.kosta.clothes.controller;

import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.clothes.bean.FileVO;
import com.kosta.clothes.bean.Likes;
import com.kosta.clothes.bean.MessageVO;
import com.kosta.clothes.bean.Sharing;
import com.kosta.clothes.bean.Users;
import com.kosta.clothes.bean.Wapply;
import com.kosta.clothes.service.ApplyService;
import com.kosta.clothes.service.LikesService;
import com.kosta.clothes.service.MessageService;
import com.kosta.clothes.service.SharingService;

@Controller
public class SharingController {

	@Autowired
	SharingService sharingService;

	@Autowired
	LikesService likesService;

	
	@Autowired 
	MessageService messageService;
	 
	@Autowired 
	ApplyService applyService;
	
	@Autowired
	ServletContext servletContext;

	@Autowired
	HttpSession session;

	@GetMapping("/sharingList")
	public ModelAndView main(HttpServletRequest request, @RequestParam(value = "kwd", required = false) String kwd) {
		ModelAndView mav = new ModelAndView();
		List<Sharing> sharingList;
		try {
			if (kwd != null && kwd != "") {
				sharingList = sharingService.getSharingList(kwd);
			} else {
				sharingList = sharingService.getSharingList();
			}
			for (int i = 0; i < sharingList.size(); i++) {
				if (sharingList.get(i).getSfileids() != null) {
					sharingList.get(i).setSfileids(sharingList.get(i).getSfileids().split(",")[0]);
				}
			}
			System.out.println("컨트롤리스트:" + sharingList);
			mav.addObject("sharingList", sharingList);
			mav.addObject("kwd", kwd);
			mav.setViewName("/sharing/sharingList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@GetMapping("/sharingRegistForm")
	public String sharingRegistForm() {
		return "/sharing/sharingRegistForm";
	}

	@ResponseBody
	@PostMapping("/sharingRegist")
	public ModelAndView registSharing(@ModelAttribute Sharing sharing,
			@RequestParam("simageFile") MultipartFile[] files) {
		ModelAndView mav = new ModelAndView();
		try {
			Users users = (Users) session.getAttribute("authUser");
			if (users != null) {
				sharing.setUserno(users.getUserno());
				sharingService.registSharing(sharing, files);
			}
			System.out.println("registcontroller:" + sharing);
			mav.setViewName("/sharing/sharingList");
			mav.setViewName("redirect:/sharingList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@GetMapping("/sharingView/{sno}")
	public ModelAndView viewSharing(@PathVariable("sno") Integer sno, Model model, @RequestParam(value = "submitcheck", required = false) String submitcheck) {
		System.out.println("sno:" + sno);
		ModelAndView mav = new ModelAndView();
		try {
			Sharing sharing = sharingService.viewSharing(sno);
			System.out.println("sharingview" + sharing);
			if (sharing.getSfileids() != null) {
				String[] fidArr = sharing.getSfileids().split(","); // 1,2,3이라는 문자열로 돼있으면 콤마로 잘라서 스트링 배열로 만들어줌
				mav.addObject("files", fidArr);
			}
			Users users = (Users) session.getAttribute("authUser");
			
			if (users == null) {
				model.addAttribute("logincheck", "false");
			} else {
				Likes likevo = new Likes();
				likevo.setSno(sno);
				likevo.setUserno(users.getUserno());
				Long likeselect = likesService.getSlikescheck(likevo);
				if (likeselect != null) {
					mav.addObject("likes", likeselect);
				}
			}
			Users uservo = new Users();
			uservo = sharingService.getSnickname(sno);
			model.addAttribute("uservo", uservo);
			model.addAttribute("submitcheck", submitcheck);
			mav.addObject("sharing", sharing);
			mav.setViewName("/sharing/sharingView");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}

	@GetMapping("/sharingModifyForm")
	public ModelAndView modifySharing(@RequestParam("sno") Integer sno) {
		ModelAndView mav = new ModelAndView();
		try {
			Sharing sharing = sharingService.viewSharing(sno);
			mav.addObject("sharing", sharing);
			mav.setViewName("/sharing/sharingModifyForm");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@PostMapping("/sharingModify")
	public ModelAndView modifySharing(@ModelAttribute Sharing sharing, @ModelAttribute FileVO fileVo,
			@RequestParam("simageFile") MultipartFile[] files) {
		ModelAndView mav = new ModelAndView();
		try {
			System.out.println("modifycontroller: " + sharing);
			sharingService.modifySharing(sharing);
			sharingService.modifySfileids(sharing, fileVo, files);
			// String[] fidArr = sharing.getSfileids().split(",");
			// mav.addObject("files", fidArr);
			mav.setViewName("redirect:/sharingView/" + sharing.getSno());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@ResponseBody
	@PostMapping("/sharingDelete")
	public ModelAndView deleteSharing(@RequestParam(value = "sno", required = false) Integer sno, Model model) {
		ModelAndView mav = new ModelAndView();
		try {
			sharingService.deleteSharing(sno);
			mav.setViewName("redirect:/sharingList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	@ResponseBody
	@PostMapping("/sharingView/likes")
	public Long registLikes(@RequestParam("sno") Integer sno, @RequestParam("userno") Integer userno) {
		Likes likes = new Likes();
		Long likescheck = null;
		try {
			likes.setSno(sno);
			likes.setUserno(userno);
			Sharing sharing = new Sharing();
			sharing.setSno(sno);
			likescheck = likesService.getSlikescheck(likes); //likescheck를 가져와(지금 무슨 상태죠?)
			if(likescheck == null) { //처음 눌렀을 때
				likesService.registSlikes(likes);
				sharingService.upSharingLikes(sharing);
			}else if(likescheck == 1) {
				System.out.println("1일때"+ likescheck);
				likes.setLikescheck(likesService.getSlikescheck(likes));
				likesService.updateSlikes(likes);
				sharingService.downSharingLikes(sharing);
			}else { //likescheck가 0일 때 1로 올려주는
				System.out.println("0일때"+ likescheck);
				likes.setLikescheck(likesService.getSlikescheck(likes));
				likesService.updateSlikes(likes);
				sharingService.upSharingLikes(sharing);
			}
			likescheck = likesService.getSlikescheck(likes);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return likescheck;
	}
	
	@PostMapping("/sharingView/smessage")
	public ModelAndView submitMessage(@ModelAttribute MessageVO message, Model model, @RequestParam("sno") Integer sno) {
		ModelAndView mav = new ModelAndView();
		try {
			Users users = (Users) session.getAttribute("authUser");
			message.setSendUserno(users.getUserno());
			System.out.println("messagecontroller:" + message);
			String submitcheck = messageService.submitMessage(message);
			System.out.println("submitcheck:"+submitcheck);
			if(submitcheck == "true") {
				mav.addObject("submitcheck", "true");
			}else {
				mav.addObject("submitcheck", "false");
			}
			mav.setViewName("redirect:/sharingView/"+sno);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
		
	}
	
	@ResponseBody
	@PostMapping("/sharingView/wapply")
	public void sharingWapply(@RequestParam("sno") Integer sno, @ModelAttribute Sharing sharing) {
		try {
			Users users = (Users) session.getAttribute("authUser");
			Wapply apply = new Wapply();
			apply.setWuserno(users.getUserno());
			apply.setSno(sno);
			applyService.registSwapply(apply);
			sharingService.upApplycount(sharing);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	/* commons에 필요한 애들 */
	@GetMapping("/img/{sfileids}")
	public void viewImage(@PathVariable Integer sfileids, HttpServletResponse response) {
		String path = servletContext.getRealPath("/upload/");
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(path + sfileids);
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (fis != null) {
				try {
					fis.close();
				} catch (Exception e) {
				}
			}
		}
	}

	@GetMapping("/upload/{fileid}")
	public void imgView(@PathVariable String fileid, HttpServletResponse response) {
		String path = servletContext.getRealPath("/upload/");
		try {
			FileInputStream fis = new FileInputStream(path + fileid);
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(fis, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
}	

	@ResponseBody
	@PostMapping("/infiniteScrollDown")
	public List<Sharing> infiniteScrollDown(@RequestBody Map<String, Object> params) {
		String keyword = (String) params.get("keyword");
		Integer sno = Integer.parseInt((String) params.get("sno"));
		Integer snoToStart = sno - 1;
		List<Sharing> sharingList = new ArrayList<>();
		try {
			if (keyword != null && keyword != "") {
				System.out.println(keyword);
				sharingList = sharingService.infiniteScrollDown(snoToStart, keyword);
			} else {
				sharingList = sharingService.infiniteScrollDown(snoToStart);
			}

			System.out.println("스크롤다운" + sharingList);
			for (int i = 0; i < sharingList.size(); i++) {
				if (sharingList.get(i).getSfileids() != null) {
					sharingList.get(i).setSfileids(sharingList.get(i).getSfileids().split(",")[0]);
					System.out.println(sharingList.get(i).getSfileids());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sharingList;
	}
	
}

