package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.TravelService;
import com.example.demo.model.Notice;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller // 컨트롤러라고 선언함
public class noticeController { // test
	// Service 인터페이스 객체 생성 및 연결
	@Autowired
	private TravelService travelService;

	@Autowired
	HttpSession session;

	// 공지사항 주소 유저,관리자 공용 관리자모드시 작성,수정,삭제 버튼 추가
	@RequestMapping("/notice.do")
	public String unotice(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String login = (String) session.getAttribute("loginSession");
		String nickname = (String)session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/notice"; //
	}

	// 공지사항 주소 유저,관리자 공용 관리자모드시 작성,수정,삭제 버튼 추가
	@RequestMapping("/adminNotice.do")
	public String adminNotice(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String login = (String) session.getAttribute("loginSession");
		String nickname = (String)session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/adminNotice"; //
	}

	// 공지사항 생성 주소
	@RequestMapping("/createnotice.do")
	public String creatnotice(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String login = (String) session.getAttribute("loginSession");
		String nickname = (String)session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/createnotice"; //
	}

//	// 공지사항 게시글 조회 주소 관리자모드시 수정,삭제 버튼 추가
//	@RequestMapping("/noticeview.do")
//	public String noticeview(Model model) throws Exception {
//		return "/noticeview"; //
//	}

	// 공지사항 목록 호출
	@RequestMapping(value = "/noticelist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getNoticeList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt((String) map.get("startNum"));
		int lastNum = Integer.parseInt((String) map.get("lastNum"));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		List<Notice> list = travelService.selectNoticeList(map); // DB 접근 및 쿼리를 통한 데이터 호출
		int cnt = travelService.selectNoticeCnt();
		resultMap.put("list", list);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}

	/*
	 * @RequestMapping(value = "/noticelist1.dox", method = RequestMethod.POST,
	 * produces = "application/json;charset=UTF-8")
	 * 
	 * @ResponseBody public String getNoticesearch(Model model, @RequestParam
	 * HashMap<String, Object> map) throws Exception { HashMap<String, Object>
	 * resultMap = new HashMap<String, Object>(); List<Notice> list =
	 * travelService.selectNoticesearch(map); // DB 접근 및 쿼리를 통한 데이터 호출
	 * resultMap.put("list", list); return new Gson().toJson(resultMap); }
	 */
	// 공지사항 조회
	@RequestMapping("/noticeview.do")
	public String view(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam HashMap<String, Object> map) throws Exception {
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String login = (String) session.getAttribute("loginSession");
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		request.setAttribute("map", map);
		return "noticeview";
	}

	@RequestMapping(value = "/noticeview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String noticeView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = travelService.getNotice(map);
		return new Gson().toJson(resultMap);
	}

	// 공지사항 조회
	@RequestMapping(value = "/addnotice.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addNotice(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int num = travelService.addNotice(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("num", num);
		return new Gson().toJson(resultMap);
	}

	// 공지사항 편집
	@RequestMapping("/editNotice.do")
	public String edit(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam HashMap<String, Object> map) throws Exception {
		String id = (String) session.getAttribute("userIdSession");
		String name = (String) session.getAttribute("NameSession");
		String status = (String) session.getAttribute("TypeSession");
		String img = (String) session.getAttribute("ImgSession");
		String login = (String) session.getAttribute("loginSession");
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		request.setAttribute("map", map);
		return "editNotice";
	}

	@RequestMapping(value = "/editnotice.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editnotice(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		travelService.editNotice(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}

	// 공지사항 삭제
	@RequestMapping(value = "/delnotice.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delNotice(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int num = travelService.delNotice(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("num", num);
		return new Gson().toJson(resultMap);
	}

}