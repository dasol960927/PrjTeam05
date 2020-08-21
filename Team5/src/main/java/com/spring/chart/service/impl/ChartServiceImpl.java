package com.spring.chart.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.chart.dao.ChartDao;
import com.spring.chart.service.ChartService;
import com.spring.chart.vo.ChartVo;

@Service("charService")
public class ChartServiceImpl implements ChartService {

	@Autowired
	private ChartDao chartDao;
	
	@Override
	public List<ChartVo> getGrd(HashMap<String, Object> map) {
		List<ChartVo> ChartList = chartDao.getGrd(map);
		return ChartList;
	}

	@Override
	public List<ChartVo> getGender(HashMap<String, Object> map) {
		List<ChartVo> ChartList = chartDao.getGender(map);
		return ChartList;
	}

	@Override
	public List<ChartVo> getAge(HashMap<String, Object> map) {
		List<ChartVo> ChartList = chartDao.getAge(map);
		return ChartList;
	}

	@Override
	public List<ChartVo> getMax(HashMap<String, Object> map) {
		List<ChartVo> ChartList = chartDao.getMax(map);
		return ChartList;
	}

}
