package com.spring.film.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.film.service.FilmService;
import com.spring.film.vo.FilmVo;
import com.spring.likelist.service.LikeService;
import com.spring.likelist.vo.LikeVo;

@Controller
public class FilmController {
	
	@Autowired
	private FilmService filmService; 
	
	@Autowired
	private LikeService likeService;

	@RequestMapping("/filmReview")
	public ModelAndView filmReview(@RequestParam HashMap<String, Object> map) {
		System.out.println("필름컨트롤러의 " + map);
		
		filmService.setFilm(map);
		FilmVo fVo = filmService.getPrice(map);
		
		//로그인 한 사람의 likechk를 받아오기 위한 코드
		LikeVo LVo = likeService.getLikeChk(map);
		
		String docId = (String) map.get("docId");
		String filmId = (String) map.get("filmId");
		String filmSeq = (String) map.get("filmSeq");
		String filmYear = (String) map.get("filmYear");
		
		ModelAndView mv = new ModelAndView();

//		FilmVo fVo = new FilmVo();
//		fVo.setDocId(docId);

		FilmVo vo = new FilmVo();
		vo.setDocId(docId);
		vo.setFilmId(filmId);
		vo.setFilmSeq(filmSeq);
		vo.setFilmYear(filmYear);


		mv.addObject("fVo", fVo);

		mv.addObject("docId", vo.getDocId());
		mv.addObject("filmId", vo.getFilmId());
		mv.addObject("filmSeq", vo.getFilmSeq());
		mv.addObject("filmYear", vo.getFilmYear());
		mv.addObject("likeChk", LVo.getLikeChk());
		
	
		System.out.println(mv);
		mv.setViewName("reviews/filmReview");
		return mv;
	}
}
