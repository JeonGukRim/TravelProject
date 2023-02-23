package com.example.demo.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.dao.TravelService;
import com.example.demo.model.Plan;
import com.example.demo.model.Question;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller // 컨트롤러라고 선언함
public class mypageController { // test
	// Service 인터페이스 객체 생성 및 연결
	@Autowired
	private TravelService travelService;

	@Autowired
	HttpSession session;

	// 마이페이지
	@RequestMapping("/mypage.do")
	public String mypage(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String login = (String) session.getAttribute("loginSession");
		String pw = (String) session.getAttribute("pwSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		String email = (String) session.getAttribute("emailSession");
		String birthday = (String) session.getAttribute("daySession");
		String dd = (String) session.getAttribute("ddSession");
		String mm = (String) session.getAttribute("mmSession");
		String gender = (String) session.getAttribute("genderSession");
		request.setAttribute("userId", id);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userEmail", email);
		request.setAttribute("userBirthday", birthday);
		request.setAttribute("userDd", dd);
		request.setAttribute("userMm", mm);
		request.setAttribute("userGender", gender);
		request.setAttribute("userPassword", pw);
		request.setAttribute("map", map);
		return "/mypage"; //
	}

	// 정보수정
	@RequestMapping("/modifyInfo.do")
	public String modifyInfo(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String login = (String) session.getAttribute("loginSession");
		String pw = (String) session.getAttribute("pwSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		String email = (String) session.getAttribute("emailSession");
		String birthday = (String) session.getAttribute("daySession");
		String dd = (String) session.getAttribute("ddSession");
		String mm = (String) session.getAttribute("mmSession");
		String gender = (String) session.getAttribute("genderSession");
		request.setAttribute("userId", id);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userEmail", email);
		request.setAttribute("userBirthday", birthday);
		request.setAttribute("userDd", dd);
		request.setAttribute("userMm", mm);
		request.setAttribute("userGender", gender);
		request.setAttribute("userPassword", pw);
		request.setAttribute("map", map);
		return "/modifyInfo"; //
	}

	// 버킷리스트
	@RequestMapping("/bucket.do")
	public String bucket(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String login = (String) session.getAttribute("loginSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/bucket"; //
	}

	// 나의 여행 플래너
	@RequestMapping("/myplanner.do")
	public String myplanner(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String login = (String) session.getAttribute("loginSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/myplanner"; //
	}

	// 문의하기 목록 유저
	@RequestMapping("/contactlist.do")
	public String mycontactlist(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String login = (String) session.getAttribute("loginSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/contactlist"; //
	}

	// 문의하기 목록 관리자
	@RequestMapping("/adminContactlist.do")
	public String adminContactlist(Model model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String login = (String) session.getAttribute("loginSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/adminContactlist"; //
	}

	// 문의내용 보기 유저 관리자 공용
	// 문의하기 작성
	@RequestMapping("/creatcontact.do")
	public String contact(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		return "/creatcontact"; //
	}

	// 문의글 리스트
	@RequestMapping(value = "/contactlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getconlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt((String) map.get("startNum"));
		int lastNum = Integer.parseInt((String) map.get("lastNum"));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		List<Question> list = travelService.getContactList(map); // DB 접근 및 쿼리를 통한 데이터 호출
		int cnt = travelService.getContactListCnt(map);
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}

	// 관리자 문의글 리스트
	@RequestMapping(value = "/admincontactlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getAdminConlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt((String) map.get("startNum"));
		int lastNum = Integer.parseInt((String) map.get("lastNum"));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		List<Question> list = travelService.getAdminContactList(map); // DB 접근 및 쿼리를 통한 데이터 호출
		int cnt = travelService.getadminContactListCnt();
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}

	// 문의글 선택
	@RequestMapping("/selectcontact.do")
	public String selectContact(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam HashMap<String, Object> map) throws Exception {
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		return "selectcontact";
	}

	@RequestMapping(value = "/selectcontact.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectContactlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = travelService.selectContact(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/myplanner.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getMyplanner(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Plan> list = travelService.getMyplanner(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("list", list);
		/* resultMap = travelService.getMyplanner(map); */
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/myplanner1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getMyplanner1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Plan> list = travelService.getDate(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("list", list);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	// 관리자 문의글 선택
	@RequestMapping("/adminselectcontact.do")
	public String adminSelectContact(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam HashMap<String, Object> map) throws Exception {
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		return "adminSelectContact";
	}

	@RequestMapping(value = "/adminselectcontact.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String adminSelectContactlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = travelService.adminSelectContact(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}

	// 문의글 수정
	@RequestMapping("/editcontact.do")
	public String edit(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam HashMap<String, Object> map) throws Exception {
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		return "editcontact";
	}

	@RequestMapping(value = "/editcontact.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editContact(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		travelService.editqContact(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}

	// 문의글 작성
	@RequestMapping(value = "/creatcontact.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String creatContact(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int num = travelService.creatContact(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("num", num);
		return new Gson().toJson(resultMap);
	}

	// 문의글 삭제
	@RequestMapping(value = "/delcontact.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delContact(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int num = travelService.delContact(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("num", num);
		return new Gson().toJson(resultMap);
	}
	
	// 문의글 삭제
	@RequestMapping(value = "/admindelcontact.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String admindelContact(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int num = travelService.admindelContact(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("num", num);
		return new Gson().toJson(resultMap);
	}
	
	
	

	// 관리자 문의글 회신
	@RequestMapping(value = "/admincommentcontact.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String adminCommentContact(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int num = travelService.adminCommentContact(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("num", num);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String profileImg = (String) map.get("profileImg");
		travelService.updatePro(map);
		resultMap.put("message", "성공");
		resultMap.put("mId", map.get("mId"));
		return new Gson().toJson(resultMap);
	}

	@RequestMapping("/upload")
	public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("mId") String mId,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		String url = null;
		String path = "c:\\userimg";
		try {

			// String uploadpath = request.getServletContext().getRealPath(path);
			String uploadpath = path;
			String originFilename = multi.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			long size = multi.getSize();
			String saveFileName = genSaveFileName(extName);

			System.out.println("uploadpath : " + uploadpath);

			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			String path2 = System.getProperty("user.dir");
			System.out.println("Working Directory = " + path2 + "src\\webapp\\userimg");
			if (!multi.isEmpty()) {
				File file = new File(path2 + "\\src\\main\\webapp\\userimg", saveFileName);
				multi.transferTo(file);

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("profileImg", "\\userimg\\" + saveFileName);
				map.put("mId", mId);
				travelService.updatePro2(map);
				model.addAttribute("filename", multi.getOriginalFilename());
				model.addAttribute("uploadPath", file.getAbsolutePath());

				return "filelist";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:modifyInfo.do";
	}

	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";

		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;

		return fileName;
	}
}