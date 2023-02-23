package com.example.demo.controller;

import java.util.ArrayList;
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

import com.example.demo.dao.TravelService;
import com.example.demo.model.Bucket;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller // 컨트롤러라고 선언함
public class createPlanController { //test
	// Service 인터페이스 객체 생성 및 연결
    @Autowired
    private TravelService travelService; 
	@Autowired
	HttpSession session;
 	//mbti P J 선택
    @RequestMapping("/selectpj.do")  
    public String selectpj(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("userStatus", status);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userLogin", login);
    	return "/selectpj"; // 
    }
    
	//j또는skip 선택후 화면
    @RequestMapping("/createplan.do")  
    public String creatplane(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
    	return "/createplan"; // 
    }
    
    //p선택 룰렛 화면
    @RequestMapping("/randomplan.do")  
    public String randomplane(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
    	return "/randomplan"; // 
    }
    
    //j선택 장소 선택 화면
    @RequestMapping("/selectSpot.do")  
    public String selectSpot(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
    	return "/selectSpot"; // 
    }
    //MBTI E I선택 화면
    @RequestMapping("/selectei.do")  
    public String selectei(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
    	return "/selectei"; // 
    }
    
    // 최종 선택 후 화면
    @RequestMapping("/finalRecommend.do")  
    public String recommendPlane(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
		String id = (String)session.getAttribute("userIdSession");
		String name = (String)session.getAttribute("NameSession");
		String status = (String)session.getAttribute("TypeSession");
		String img = (String)session.getAttribute("ImgSession");
		String login = (String)session.getAttribute("loginSession");
		String nickname = (String) session.getAttribute("nickNameSession");
		request.setAttribute("userNickname", nickname);
		request.setAttribute("map", map);
		request.setAttribute("userId", id);
		request.setAttribute("userName", name);
		request.setAttribute("userImg", img);
		request.setAttribute("userStatus", status);
		request.setAttribute("userLogin", login);
    	return "/finalRecommend"; // 
    }
    
    
  //버킷리스트 추가
    @RequestMapping(value = "/addbucket.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    	@ResponseBody
    	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    		HashMap<String, Object> resultMap = new HashMap<String, Object>();
    		int num = travelService.addBucketList(map); // DB 접근 및 쿼리를 통한 데이터 호출
    		if (num > 0) {
    			resultMap.put("result", "성공");
    		} else {
    			resultMap.put("result", "실패");
    		}
    		return new Gson().toJson(resultMap);
    	}
  //버킷리스트 찜한것 가져오기
    @RequestMapping(value = "/getbucket.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    	@ResponseBody
    	public String getBucketList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
    		HashMap<String, Object> resultMap = new HashMap<String, Object>();
    		List<Bucket> list = travelService.getBucketList(map); // DB 접근 및 쿼리를 통한 데이터 호출
    		if (list.size() > 0) {
    			resultMap.put("result", "성공");
    		} else {
    			resultMap.put("result", "실패");
    		}
    		resultMap.put("list", list);
    		return new Gson().toJson(resultMap);
    	}
    
	// 플래너 
	@RequestMapping(value = "/createplan.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String creatplan(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String json = map.get("list").toString();
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, Object>> list = mapper.readValue(json, new TypeReference<ArrayList<Map<String, Object>>>(){});
		map.put("list", list);
		travelService.addPlan(map);
		/* travelService.addPlan1(map); */
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
	// 플래너 
	@RequestMapping(value = "/createplan1.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String creatplan1(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		/*
		 * String json = map.get("list").toString(); ObjectMapper mapper = new
		 * ObjectMapper(); List<Map<String, Object>> list = mapper.readValue(json, new
		 * TypeReference<ArrayList<Map<String, Object>>>(){}); map.put("list", list);
		 * travelService.addPlan(map);
		 */
		travelService.addPlan1(map);
		resultMap.put("message", "성공");
		return new Gson().toJson(resultMap);
	}
}