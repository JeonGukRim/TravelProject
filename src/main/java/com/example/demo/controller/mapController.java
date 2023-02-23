package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mapController {

	@RequestMapping("/address.do") 
    public String kakao(Model model) throws Exception{
  
    	return "/map"; // WEB-INF에서 호출할 파일명
    }

}
