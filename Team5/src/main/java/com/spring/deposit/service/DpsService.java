package com.spring.deposit.service;

import java.util.HashMap;
import java.util.List;

import com.spring.deposit.vo.DpsVo;

public interface DpsService {

	List<DpsVo> getDpsList(HashMap<String, Object> map);

	void insertDps(HashMap<String, Object> map);

	

	

}
