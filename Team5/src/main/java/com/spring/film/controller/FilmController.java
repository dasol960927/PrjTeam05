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
		FilmVo fVo = filmService.getPrice(map);
		String docId = (String) map.get("docId");
		
		ModelAndView mv = new ModelAndView();
//		FilmVo fVo = new FilmVo();
//		fVo.setDocId(docId);
		
		mv.addObject("fVo", fVo);
		System.out.println(mv);
		mv.setViewName("reviews/filmReview");
		return mv;
	}
}
