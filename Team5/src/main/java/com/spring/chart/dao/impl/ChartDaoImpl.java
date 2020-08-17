package com.spring.chart.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.chart.dao.ChartDao;
import com.spring.chart.vo.ChartVo;

@Repository("charDao")
public class ChartDaoImpl implements ChartDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ChartVo> getGrd(HashMap<String, Object> map) {
		List<ChartVo> ChartList = sqlSession.selectList("CHART.Grd" ,map);
		return ChartList;
	}

	@Override
	public List<ChartVo> getGender(HashMap<String, Object> map) {
		List<ChartVo> ChartList = sqlSession.selectList("CHART.Gender" ,map);
		return ChartList;
	}

	@Override
	public List<ChartVo> getAge(HashMap<String, Object> map) {
		List<ChartVo> ChartList = sqlSession.selectList("CHART.Age" ,map);
		return ChartList;
	}

}
