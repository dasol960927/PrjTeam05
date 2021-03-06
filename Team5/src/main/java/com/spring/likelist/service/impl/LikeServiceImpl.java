package com.spring.likelist.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.likelist.dao.LikeDao;
import com.spring.likelist.service.LikeService;
import com.spring.likelist.vo.LikeVo;

@Service("likeService")
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeDao likeDao;

	@Override
	public List<LikeVo> getList(HashMap<String, Object> map) {
		List<LikeVo> likeList = likeDao.getList(map);
		
		return likeList;
	}

	@Override
	public void setLike(HashMap<String, Object> map) {
		likeDao.setLike(map);
	}

	public void setDelete(HashMap<String, Object> map) {
		likeDao.setDelete(map);
	}

	@Override
	public LikeVo getLikeChk(HashMap<String, Object> map) {
		LikeVo LVo = likeDao.getLikeChk(map);
		
		return LVo;
	}

	@Override
	public List<LikeVo> getGenreList(HashMap<String, Object> map) {
		List<LikeVo> getGenreList = likeDao.getGenreList(map);
		
		return getGenreList;
	}
}
