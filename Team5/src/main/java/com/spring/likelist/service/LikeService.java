package com.spring.likelist.service;

import java.util.HashMap;
import java.util.List;

import com.spring.likelist.vo.LikeVo;



public interface LikeService {

	List<LikeVo> getList(HashMap<String, Object> map);

	void setLike(HashMap<String, Object> map);

	void setDelete(HashMap<String, Object> map);


	

}
