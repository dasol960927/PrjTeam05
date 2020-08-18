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
		
		System.out.println("리뷰 맵" + map);
		// map : filmId 하나, 무조건 들어와야됨
		List<RevVo> grdList = revService.getGrdList(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/filmReview1");
		
		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));
		mv.addObject("grdList", grdList);
		
		System.out.println(map);
		System.out.println(grdList);
		
		return mv;
	}
	
	@RequestMapping("/REVIEW/revList")
	public ModelAndView revList1(@RequestParam HashMap<String, Object> map) {
		
		
		// map : filmId 하나, 무조건 들어와야됨
		List<RevVo> revList = revService.getRevList(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/filmReview2");
		
		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));
		mv.addObject("revList", revList);
		
		return mv;
	}	


	
	
	@RequestMapping("/REVIEW/reviewRead")
	public ModelAndView reviewRead(@RequestParam HashMap<String, Object> map) {
		
		// map : revIdx
		System.out.println("reviewRead map : " + map);

		
		RevVo revVo = revService.getRevConts(map);
		List<RevVo> revList1 = revService.getRevList(map);
		List<RevVo> revList2 = revService.getRevList2(map);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/filmReviewConts");
		
		mv.addObject("revIdx", map.get("revIdx"));
		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));
		mv.addObject("revVo", revVo);
		mv.addObject("revList1", revList1);
		mv.addObject("revList2", revList2);

		System.out.println("reviewRead list1 : " + revList1);
		System.out.println("reviewRead list2 : " + revList2);
		
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
		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));
		
		return mv;
	}	
	
	
}

