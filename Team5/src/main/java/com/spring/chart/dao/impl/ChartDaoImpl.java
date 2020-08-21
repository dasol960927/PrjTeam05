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
		sqlSession.selectList("CHART.Grd" ,map);
		List<ChartVo> ChartList = (List<ChartVo>) map.get("result");
		return ChartList;
	}

	@Override
	public List<ChartVo> getGender(HashMap<String, Object> map) {	
		sqlSession.selectList("CHART.Gender" ,map);
		List<ChartVo> ChartList = (List<ChartVo>) map.get("result");
		return ChartList;
	}

	@Override
	public List<ChartVo> getAge(HashMap<String, Object> map) {
		sqlSession.selectList("CHART.Age" ,map);
		List<ChartVo> ChartList = (List<ChartVo>) map.get("result");
		return ChartList;
	}

	@Override
	public List<ChartVo> getMax(HashMap<String, Object> map) {
		sqlSession.selectList("CHART.Max" ,map);
		List<ChartVo> ChartList = (List<ChartVo>) map.get("result");
		return ChartList;
	}

}
