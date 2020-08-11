package com.spring.purchase.service;

import java.util.HashMap;
import java.util.List;

import com.spring.purchase.vo.PurVo;

public interface PurService {

	List<PurVo> getPurList(HashMap<String, Object> map);

	void insertPur(HashMap<String, Object> map);

	

}
