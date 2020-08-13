package com.spring.review.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.review.vo.RevVo;

public interface RevDao {

	List<RevVo> getGrdList(HashMap<String, Object> map);

	List<RevVo> getRevList(HashMap<String, Object> map);

	void insertGrd(HashMap<String, Object> map);

}
