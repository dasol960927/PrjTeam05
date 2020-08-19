package com.spring.chart.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.chart.service.ChartService;
import com.spring.chart.vo.ChartVo;

@Controller
public class ChartController {

	@Autowired
	private ChartService chartService;
	
	@RequestMapping("/Chart/Grd")
	public ModelAndView ChartGrd(@RequestParam HashMap<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("평점 맵 " + map);
		List<ChartVo> ChartList = chartService.getGrd(map);
		System.out.println("평점 리스트 " + map);
		mv.addObject("ChartList", ChartList);
		mv.setViewName("/chartData/");
		return mv;
	}
	
	@RequestMapping("/Chart/Gender")
	@ResponseBody
	public List<ChartVo> ChartGender(@RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println("성별 맵 " + map);
		List<ChartVo> ChartList = chartService.getGender(map);
		System.out.println("성별 리스트 " + ChartList);
		
//		ObjectMapper mapper = new ObjectMapper();
//		String jsonChartList = mapper.writeValueAsString(ChartList);
//		
//		System.out.println("json으로 변경" + jsonChartList);
		return ChartList;
	}
	
	@RequestMapping("/Chart/Age")
	public List<ChartVo> ChartAge(@RequestParam HashMap<String, Object> map) {
		System.out.println("나이 맵 " + map);
		List<ChartVo> ChartList = chartService.getAge(map);
		System.out.println("나이 리스트 " + ChartList);
		return ChartList;
	}
	
}
