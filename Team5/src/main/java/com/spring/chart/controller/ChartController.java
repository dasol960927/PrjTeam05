package com.spring.chart.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.chart.service.ChartService;
import com.spring.chart.vo.ChartVo;

@Controller
public class ChartController {

	@Autowired
	private ChartService chartService;
	
	@RequestMapping("/Chart/Grd")
	public List<ChartVo> ChartGrd(@RequestParam HashMap<String, Object> map) {
		System.out.println("평점 맵 " + map);
		List<ChartVo> ChartList = chartService.getGrd(map);
		System.out.println("평점 리스트 " + map);
		return ChartList;
	}
	
	@RequestMapping("/Chart/Gender")
	public List<ChartVo> ChartGender(@RequestParam HashMap<String, Object> map) {
		System.out.println("성별 맵 " + map);
		List<ChartVo> ChartList = chartService.getGender(map);
		System.out.println("성별 리스트 " + ChartList);
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
