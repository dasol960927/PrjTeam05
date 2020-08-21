package com.spring.chart.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.chart.vo.ChartVo;

public interface ChartDao {

	List<ChartVo> getGrd(HashMap<String, Object> map);
	
	List<ChartVo> getGender(HashMap<String, Object> map);
	
	List<ChartVo> getAge(HashMap<String, Object> map);

	List<ChartVo> getMax(HashMap<String, Object> map);

}
