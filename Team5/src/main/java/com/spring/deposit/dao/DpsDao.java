package com.spring.deposit.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.deposit.vo.DpsVo;

public interface DpsDao {

	List<DpsVo> getDpsList(HashMap<String, Object> map);

	void insertDps(HashMap<String, Object> map);
	
}
