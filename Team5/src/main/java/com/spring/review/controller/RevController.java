package com.spring.review.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.review.service.RevService;
import com.spring.review.vo.RevVo;

@Controller
public class RevController {

	@Autowired
	private RevService revService;
	
	@RequestMapping("/REVIEW/grdList")
	public ModelAndView grdList(@RequestParam HashMap<String, Object> map) {
		
		// map : filmId 하나, 무조건 들어와야됨
		List<RevVo> grdList = revService.getGrdList(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/filmReview1");
		
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("grdList", grdList);
		
		System.out.println(map);
		System.out.println(grdList);
		
		return mv;
	}
	
	@RequestMapping("/REVIEW/revList")
	public ModelAndView revList(@RequestParam HashMap<String, Object> map) {
		
		// map : filmId 하나, 무조건 들어와야됨
		List<RevVo> revList = revService.getRevList(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/filmReview2");
		
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("revList", revList);
		
		return mv;
	}	
	
	@RequestMapping("/REVIEW/insertGrdForm")
	public ModelAndView insertGrdForm(@RequestParam HashMap<String, Object> map){
		
		System.out.println(map);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/insertGrdForm");
				
		return mv;		
	}
	
	@RequestMapping("/REVIEW/insertGrd")
	public ModelAndView insertGrd(@RequestParam HashMap<String, Object> map) {
		
		// map : {mId=A@naver.com, filmId=F00004, grdScore=4, grdConts=가나다라}
		System.out.println("맵제발" + map);
		revService.insertGrd(map);
						
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("redirect:/REVIEW/grdList");		
		mv.addObject("filmId", map.get("filmId"));		
		
		return mv;
	}	
	
	
}
