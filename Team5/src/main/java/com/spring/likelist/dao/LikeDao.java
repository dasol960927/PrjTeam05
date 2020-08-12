package com.spring.likelist.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.likelist.vo.LikeVo;



public interface LikeDao {

	List<LikeVo> getList(HashMap<String, Object> map);

	

}
