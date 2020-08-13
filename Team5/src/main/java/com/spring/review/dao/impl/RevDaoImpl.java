package com.spring.review.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.review.dao.RevDao;
import com.spring.review.vo.RevVo;

@Repository("revDao")
public class RevDaoImpl implements RevDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<RevVo> getGrdList(HashMap<String, Object> map) {
		
		sqlSession.selectList("REVIEW.GrdList", map);
		List<RevVo> grdList = (List<RevVo>) map.get("result");
		
		return grdList;
	}

	@Override
	public List<RevVo> getRevList(HashMap<String, Object> map) {

		sqlSession.selectList("REVIEW.RevList", map);
		List<RevVo> revList = (List<RevVo>) map.get("result");
		
		return revList;
	}
	
}
