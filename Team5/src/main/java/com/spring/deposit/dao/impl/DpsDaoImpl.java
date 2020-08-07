package com.spring.deposit.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.deposit.dao.DpsDao;
import com.spring.deposit.vo.DpsVo;

@Repository("dpsDao")
public class DpsDaoImpl implements DpsDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DpsVo> getDpsList(HashMap<String, Object> map) {

		
		sqlSession.selectList("DEPOSIT.DpsList", map);
		List<DpsVo> dpsList = (List<DpsVo>) map.get("result");

		return dpsList;
		
	}

	@Override
	public void insertDps(HashMap<String, Object> map) {
		
		sqlSession.insert("DEPOSIT.DpsInsert", map);
		
	}
	
}
