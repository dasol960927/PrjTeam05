package com.spring.deposit.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.deposit.service.DpsService;
import com.spring.deposit.vo.DpsVo;

@Controller
public class DpsController {
	
	@Autowired
	private DpsService dpsService;
	
	// login.jsp -> facebook a tag에 연결(테스트용)
	@RequestMapping("/DPS/List")	
	public ModelAndView dpsList(@RequestParam HashMap<String, Object> map) {
		
		List<DpsVo> dpsList = dpsService.getDpsList(map);		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("dpsList", dpsList);		
		mv.setViewName("deposit/depositList");
		
		mv.addObject("mId", map.get("mId"));
		
		System.out.println("map : "  + map);
		System.out.println("mv : " + mv);
		
		return mv;
	}
	
	@RequestMapping("/DPS/Deposit1")
	public ModelAndView dps1(@RequestParam HashMap<String, Object> map) {
				
		ModelAndView mv = new ModelAndView();
		List<DpsVo> dpsList = dpsService.getDpsList(map);
		
		System.out.println("dps1 map : " + map);
		System.out.println("dps1 List : " + dpsList);
		
		mv.addObject("mId", map.get("mId"));
		
		mv.addObject("dpsList", dpsList);		
		mv.setViewName("deposit/depositForm");
		
		return mv;
	}
	
	
	@RequestMapping("/DPS/Deposit2")
	public ModelAndView dps2(@RequestParam HashMap<String, Object> map) {
		
		// map : mId + dPay + dComVal
		System.out.println("dps2 map : " + map);
		
		dpsService.insertDps(map);
		
		ModelAndView mv = new ModelAndView();
		 			
		
		mv.addObject("mId", map.get("mId"));
		mv.addObject("dComId", map.get("dComId"));
		mv.addObject("dPay", map.get("dPay"));
		//mv.setViewName("redirect:/login");		
		
		String dComId = (String) map.get("dComId");
		

		
		switch(dComId) {
			case "COM001" :
				mv.setViewName("/deposit/pay1");
				break;
			case "COM002" :
				mv.setViewName("/deposit/pay2");
				break;
			case "COM003" :
				mv.setViewName("/deposit/pay3");
				break;
		}
			
		//System.out.println("last map : " + map);
		//System.out.println(mv);
		
		return mv;
	}
	
	
}
