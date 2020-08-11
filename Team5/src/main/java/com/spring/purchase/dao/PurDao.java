package com.spring.purchase.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.purchase.vo.PurVo;

public interface PurDao {

	List<PurVo> getPurList(HashMap<String, Object> map);

	void insertPur(HashMap<String, Object> map);

}
