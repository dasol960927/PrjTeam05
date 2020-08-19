package com.spring.review.service;

import java.util.HashMap;
import java.util.List;

import com.spring.review.vo.RevVo;

public interface RevService {

	List<RevVo> getGrdList(HashMap<String, Object> map);

	List<RevVo> getRevList(HashMap<String, Object> map);

	void insertGrd(HashMap<String, Object> map);

	RevVo getRevConts(HashMap<String, Object> map);

	List<RevVo> getRevList2(HashMap<String, Object> map);

	void insRevLvl1(HashMap<String, Object> map);

	void insRevLvl2(HashMap<String, Object> map);

	void insertSym(HashMap<String, Object> map);

	

}
