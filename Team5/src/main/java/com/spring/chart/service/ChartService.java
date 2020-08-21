package com.spring.chart.service;

import java.util.HashMap;
import java.util.List;

import com.spring.chart.vo.ChartVo;

public interface ChartService {

	List<ChartVo> getGrd(HashMap<String, Object> map);
	
	List<ChartVo> getGender(HashMap<String, Object> map);
	
	List<ChartVo> getAge(HashMap<String, Object> map);

	List<ChartVo> getMax(HashMap<String, Object> map);

}
