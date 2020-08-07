package com.spring.board.service;

import java.util.HashMap;
import java.util.List;

import com.spring.board.vo.BoardVo;

public interface BoardService {

	List<BoardVo> getBoardList(HashMap<String, Object> map);

}
