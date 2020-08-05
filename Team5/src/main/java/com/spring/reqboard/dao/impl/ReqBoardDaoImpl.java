package com.spring.reqboard.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.reqboard.dao.ReqBoardDao;

@Repository("reqBoardDao")
public class ReqBoardDaoImpl implements ReqBoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void addReqBoard(HashMap<String, Object> map) {
		sqlSession.insert("ReqBoard.ReqBoardInsert", map);
		
	}
}
