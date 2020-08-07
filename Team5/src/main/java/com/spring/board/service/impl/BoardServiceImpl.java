package com.spring.board.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.BoardService;
import com.spring.board.vo.BoardVo;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardVo> getBoardList(HashMap<String, Object> map) {
		List<BoardVo> boardList = boardDao.getBoardList(map);
		return boardList;
	}

}
