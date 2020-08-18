package com.spring.purchase.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;
import com.spring.purchase.service.PurService;
import com.spring.purchase.vo.PurVo;

@Controller
public class PurController {
	
	@Autowired
	private PurService purService;
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("/PUR/List")
	public ModelAndView purList(@RequestParam HashMap<String, Object> map) {
		
		List<PurVo> purList = purService.getPurList(map);
		MemberVo memberVo = memberService.getMemberInfo(map);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("purchase/purchaseList");
		mv.addObject("purList", purList);
		mv.addObject("memberVo", memberVo);	
		mv.addObject("docId", map.get("docId"));
		
		//mv.addObject("mId", map.get("mId"));
		
		System.out.println(purList);
		
		return mv;
	}
	
	// 테스트용
	@RequestMapping("/PUR/purFilm")
	public ModelAndView purFilm(@RequestParam HashMap<String, Object> map) {
		
		purService.insertPur(map);
		
		ModelAndView mv = new ModelAndView();
		 			
		
		mv.addObject("mId", map.get("mId"));
		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmPrice", map.get("filmPrice"));
		mv.addObject("oErrMsg", map.get("oErrMsg"));		
				
		System.out.println("purFilm map : " + map);
		
		// 예외처리
		String oErrMsg = (String) map.get("oErrMsg");
		
		 if(oErrMsg==null || oErrMsg.length()==0) { 			 
			 mv.setViewName("purchase/purchasetest");		
		 } else {
			 mv.setViewName("purchase/purchaseerror");
		 }
		
		return mv;
	}	
	
	
	
	
}
