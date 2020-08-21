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

	@Override
	public List<RevVo> getRevList2(HashMap<String, Object> map) {
		
		sqlSession.selectList("REVIEW.RevList2", map);
		
		List<RevVo> revList = (List<RevVo>) map.get("result");		
		
		return revList;
	}	
	
	@Override
	public void insertGrd(HashMap<String, Object> map) {
		
		sqlSession.insert("REVIEW.GrdInsert", map);
		
	}
	
	@Override
	public void insertRev(HashMap<String, Object> map) {
		
		sqlSession.insert("REVIEW.RevInsert", map);
		
	}	

	@Override
	public RevVo getRevConts(HashMap<String, Object> map) {
		sqlSession.selectList("REVIEW.RevConts", map);
		List<RevVo> revList = (List<RevVo>) map.get("result");
		RevVo revVo = revList.get(0);
		
		return revVo;
	}

	@Override
	public void insRevLvl1(HashMap<String, Object> map) {
		
		sqlSession.insert("REVIEW.RevInsLvl1", map);
		
	}

	@Override
	public void insRevLvl2(HashMap<String, Object> map) {
		
		sqlSession.insert("REVIEW.RevInsLvl2", map);
		
	}

	@Override
	public void insertSym(HashMap<String, Object> map) {
		
		sqlSession.insert("REVIEW.SymInsert", map);
		
	}


	
}
