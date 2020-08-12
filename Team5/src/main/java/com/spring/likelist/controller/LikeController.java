package com.spring.likelist.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.likelist.service.LikeService;
import com.spring.likelist.vo.LikeVo;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;


@Controller
public class LikeController {
	
	@Autowired
	private LikeService likeService;
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("LIKE/List")
	public ModelAndView likeList(@RequestParam HashMap<String, Object> map) {
		
		System.out.println("LIKE/List map : " + map);
		
		List<LikeVo> likeList = likeService.getList(map);
		MemberVo memberVo = memberService.getMemberInfo(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("table/likelist");
		
		return mv;
		
	}
	
}
