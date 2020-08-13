package com.spring.film.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.film.service.FilmService;
import com.spring.film.vo.FilmVo;

@Controller
public class FilmController {
	
	@Autowired
	private FilmService filmService; 

	@RequestMapping("/filmReview")
	public ModelAndView filmReview(@RequestParam HashMap<String, Object> map) {
		System.out.println("필름컨트롤러의 " + map);
		filmService.setFilm(map);
		
		
		return null;
	}
}
