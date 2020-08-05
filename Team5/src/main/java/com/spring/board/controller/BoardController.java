package com.spring.board.controller;

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
		List<BoardVo> boardList = boardService.getBoardList();
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardList", boardList);
		mv.setViewName("board/board");
		
		return mv;
	}
}
