package com.spring.board.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.board.vo.BoardVo;

public interface BoardDao {

	List<BoardVo> getBoardList(HashMap<String, Object> map);

}
