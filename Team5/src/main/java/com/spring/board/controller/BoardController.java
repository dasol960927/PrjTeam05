package com.spring.board.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVo;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/Board")
	public ModelAndView board(String gubun) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bGubun", gubun);
		List<BoardVo> boardList = boardService.getBoardList(map);
		
		System.out.println(gubun);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardList", boardList);
		
		if(gubun.equals("N")) {
			mv.setViewName("board/boardNotice");			
		}
		else if(gubun.equals("F")){
			mv.setViewName("board/boardFAQ");
		}
		
		return mv;
	}
}
