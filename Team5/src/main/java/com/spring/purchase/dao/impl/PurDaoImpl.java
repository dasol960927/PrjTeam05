package com.spring.purchase.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.purchase.dao.PurDao;
import com.spring.purchase.vo.PurVo;

@Repository("purDao")
public class PurDaoImpl implements PurDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PurVo> getPurList(HashMap<String, Object> map) {
		
		sqlSession.selectList("PURCHASE.PurList", map);
		List<PurVo> purList = (List<PurVo>) map.get("result");
		
		return purList;
	}

	@Override
	public void insertPur(HashMap<String, Object> map) {
		
		sqlSession.insert("PURCHASE.PurInsert", map);
	}
	
	
	
}
