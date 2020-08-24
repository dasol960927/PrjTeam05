package com.spring.likelist.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.likelist.vo.LikeVo;

public interface LikeDao {

	List<LikeVo> getList(HashMap<String, Object> map);

	void setLike(HashMap<String, Object> map);

	void setDelete(HashMap<String, Object> map);

	LikeVo getLikeChk(HashMap<String, Object> map);

	List<LikeVo> getGenreList(HashMap<String, Object> map);

}
