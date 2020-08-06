package com.spring.reqboard.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.reqboard.service.ReqBoardService;
import com.spring.reqboard.vo.ReqBoardVo;


public class ReqBoardController {
	
	@Autowired
	private ReqBoardService reqBoardService;
	
//	@RequestMapping("/reqBoardWriter")
//	public String reqBoardWriter(@RequestParam	HashMap<String, Object> map) {
//		return "reqBoard/reqBoard";	
//		}
	
//	@RequestMapping("/reqBoard")
//	public String reqBoard(@RequestParam HashMap<String, Object> map) {
//	
//		reqBoardService.setWrite(map);
//		
//		ModelAndView mv = new ModelAndView();
//		
//		List<ReqBoardVo>  menuList = ReqBoardService.getList(map);
//		mv.addObject("mid", vo.getmId());
//		mv.addObject("email", vo.getEmail());
//		mv.addObject("reqconts", vo.getReqConts());
//		reqBoardService.addReqBoard(map);
//		
//		return "/reqboard/reqBoardCheck";
//	}

}