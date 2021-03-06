package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;

@Repository("boardDao")
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List<BoardVo> getBoardList(HashMap<String, Object> map) {
				
		sqlSession.selectList("BOARD.BoardList", map);
		List<BoardVo> boardList = (List<BoardVo>) map.get("result");
		

		return boardList;
	}

}
