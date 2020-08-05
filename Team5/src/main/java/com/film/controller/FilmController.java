package com.film.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.film.service.ReqBoardService;
import com.film.vo.ReqBoardVo;

@Controller
public class FilmController {
	
	@Autowired
	private ReqBoardService reqBoardService;
	
	@RequestMapping("/")
	public String main() {
		return "main"; 
	}
	
	@RequestMapping("/reqBoard/reqBoardWriter")
	public String writeForm() {
		return "/req/reqBoard";
	}
	
	@RequestMapping("/reqBoard")
	public String write(ReqBoardVo vo) {
		// request 정보를 vo
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mid", vo.getmId());
		map.put("email", vo.getEmail());
		map.put("reqconts", vo.getReqConts());
		reqBoardService.addReqBoard(map);
		
		return "main";
	}
}