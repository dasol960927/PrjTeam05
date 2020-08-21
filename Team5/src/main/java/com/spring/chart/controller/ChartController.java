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
	@ResponseBody
	public List<ChartVo> ChartGrd(@RequestParam HashMap<String, Object> map) {
		List<ChartVo> ChartList = chartService.getGrd(map);
		return ChartList;
	}
	
	@RequestMapping("/Chart/Gender")
	@ResponseBody
	public List<ChartVo> ChartGender(@RequestParam HashMap<String, Object> map) throws Exception {
		List<ChartVo> ChartList = chartService.getGender(map);
		return ChartList;
	}
	
	@RequestMapping("/Chart/Age")
	@ResponseBody
	public List<ChartVo> ChartAge(@RequestParam HashMap<String, Object> map) {
		List<ChartVo> ChartList = chartService.getAge(map);	
		return ChartList;
	}
	
	@RequestMapping("/Chart/Max")
	@ResponseBody
	public List<ChartVo> ChartMax(@RequestParam HashMap<String, Object> map) {
		List<ChartVo> ChartList = chartService.getMax(map);	
		System.out.println("누가 가장 좋아할까" + map);
		return ChartList;
	}
	
}
