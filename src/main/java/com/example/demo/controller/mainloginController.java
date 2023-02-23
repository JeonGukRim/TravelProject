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
import com.example.demo.model.Account;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller // 컨트롤러라고 선언함
public class mainloginController {
	// Service 인터페이스 객체 생성 및 연결
	@Autowired
	private TravelService travelService;

	@Autowired
	HttpSession session;
	
	private String id_fromfindPw;

	// 메인화면 주소
	@RequestMapping("/main.do")
	public String main(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String nickname = (String)session.getAttribute("nickNameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/main"; //
	}

	// 로그인 주소
	@RequestMapping("/login.do")
	public String login(Model model , HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		String nickname = (String)session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/login"; //
		
		// String id = (String)session.getAttribute("id");
		 //session.removeAttribute("id");
		// session.invalidate();
		
	}

	// 관리자 로그인 주소
	@RequestMapping("/managerlogin.do")
	public String managerlogin(Model model) throws Exception {
		return "/managerlogin"; //
	}

	// 회원가입 주소
	@RequestMapping("/join.do")
	public String join(Model model) throws Exception {
		return "/join"; //
	}

	// 아이디 찾기 주소
	@RequestMapping("/findId.do")
	public String findid(Model model) throws Exception {
		return "/findId"; //
	}

	// 비밀번호 찾기 주소
	@RequestMapping("/findPw.do")
	public String findPw(Model model) throws Exception {
		return "/findPw"; //
	}

	// 비밀번호 재설정
	@RequestMapping("/modifyPw.do")
	public String modifyInfo(Model model) throws Exception {
		return "/modifyPw"; //
	}

	// 소개 주소
	@RequestMapping("/introduce.do")
	public String information(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		String nickname = (String)session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/introduce"; //
	}

	// 유저 로그인 데이터 호출
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userLogin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Account> list = travelService.selectIdList(map); // DB 접근 및 쿼리를 통한 데이터 호출
		if (list.size() > 0) {
			resultMap.put("result", "성공");
		} else {
			resultMap.put("result", "실패");
		}

		Account user = travelService.getAccount(map);
		if (user != null) {
			session.setAttribute("userIdSession", user.getmId());
			session.setAttribute("NameSession", user.getmName());
			session.setAttribute("TypeSession", user.getStatus());
			session.setAttribute("ImgSession", user.getProfileImg());
			session.setAttribute("pwSession", user.getPassword());
			session.setAttribute("nickNameSession", user.getmNickname());
			session.setAttribute("emailSession", user.getmEmail());
			session.setAttribute("daySession", user.getmBirthday());
			session.setAttribute("ddSession", user.getmBirthdd());
			session.setAttribute("mmSession", user.getmBirthmm());
			session.setAttribute("genderSession", user.getmGender());
			session.setAttribute("loginSession","0");
			resultMap.put("user", user);
		}else {
			session.setAttribute("loginSession","1");
			resultMap.put("user", user);
		}
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
		
		
	}
	
	@RequestMapping(value = "/getimg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userProimg(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Account> list = travelService.getProimg(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/logout.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userLogout(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Account> list = travelService.selectIdList(map); // DB 접근 및 쿼리를 통한 데이터 호출
		session.removeAttribute("id");
		session.removeAttribute("name");
		session.removeAttribute("img");
		session.removeAttribute("status");
		session.removeAttribute("nickname");
		session.removeAttribute("email");
		session.removeAttribute("birthday");
		session.removeAttribute("dd");
		session.removeAttribute("mm");
		session.removeAttribute("gender");
		session.removeAttribute("pw");
		/* session.removeAttribute("login"); */
		session.removeAttribute("status");
		session.invalidate();
		Account user = travelService.getAccount(map);
		session.setAttribute("loginSession","1");
		resultMap.put("user", user);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
		
		
	}
	
	@RequestMapping("/header.do")
	public String mypageheader(Model model , HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String nickname = (String)session.getAttribute("nickNameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/header"; //
	}
	@RequestMapping("/footer.do")
	public String mypagefooter(Model model , HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String nickname = (String)session.getAttribute("nickNameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/footer"; //
	}
	
	@RequestMapping("/myNavigator.do")
	public String myNavigator(Model model , HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/myNavigator"; //
	}
	@RequestMapping("/navigator.do")
	public String navigator(Model model , HttpServletRequest request, HttpServletResponse response) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String) session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		request.setAttribute("userId", id);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
		return "/navigator"; //
	}
	
	
	// 매니저 로그인 데이터 호출
	@RequestMapping(value = "/managerlogin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String managerLogin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Account> list = travelService.selectIdList(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}

	// 회원가입
	@RequestMapping(value = "/login/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userJoin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int num = travelService.addUserid(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("num", num);
		return new Gson().toJson(resultMap);
	}

	// 아이디 찾기
	@RequestMapping(value = "/login/findid.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String id = travelService.findUserId(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("id", id);
		return new Gson().toJson(resultMap);
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/login/findpw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findPw(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String pw = travelService.findUserPw(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("pw", pw);
		if(resultMap.get("pw") != null) {
			id_fromfindPw = (String)(map.get("m_id"));
		}
		return new Gson().toJson(resultMap);
	}
	
	// 비밀번호 재설정
	@RequestMapping(value = "/login/modifyPw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyPw(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		if(id_fromfindPw != null) {
			map.put("m_id", id_fromfindPw);
			int checkNum_modifyPw = travelService.modifyUserPw(map); // DB 접근 및 쿼리를 통한 데이터 호출
			resultMap.put("num", checkNum_modifyPw);
		} else {
			resultMap.put("num", 0);
		}
		return new Gson().toJson(resultMap);
	}
	
	// 아이디 중복체크
	@RequestMapping(value = "/join/checkId.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String dupId = travelService.checkUserid(map); // DB 접근 및 쿼리를 통한 데이터 호출
		if(dupId != null) {
			resultMap.put("dup", "no");
		} else {
			resultMap.put("dup", "ok");
		}
		return new Gson().toJson(resultMap);
	}
	
	// 닉네임 중복체크
	@RequestMapping(value = "/join/checkNick.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkNick(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Account> dupNick = travelService.checkUserNick(map); // DB 접근 및 쿼리를 통한 데이터 호출
		if(dupNick.size()==0) { 
			resultMap.put("dup", "ok");
		} else {
			resultMap.put("dup", "no");
		}
		return new Gson().toJson(resultMap);
	}
	
	// 이메일 중복체크
	@RequestMapping(value = "/join/checkEmail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String checkEmail(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int num = travelService.checkUserEmail(map); // DB 접근 및 쿼리를 통한 데이터 호출
		resultMap.put("num", num);
		return new Gson().toJson(resultMap);
	}
}