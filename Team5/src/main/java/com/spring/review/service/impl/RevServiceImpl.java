package com.spring.review.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.review.dao.RevDao;
import com.spring.review.service.RevService;
import com.spring.review.vo.RevVo;

@Service("revService")
public class RevServiceImpl implements RevService {

	@Autowired
	private RevDao revDao;

	@Override
	public List<RevVo> getGrdList(HashMap<String, Object> map) {
		
		List<RevVo> grdList = revDao.getGrdList(map);
		
		return grdList;
	}

	@Override
	public List<RevVo> getRevList(HashMap<String, Object> map) {
		
		List<RevVo> revList = revDao.getRevList(map);
		
		return revList;
	}

	@Override
	public void insertGrd(HashMap<String, Object> map) {
		
		revDao.insertGrd(map);
		
	}
	
}
