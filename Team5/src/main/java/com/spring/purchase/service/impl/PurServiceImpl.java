package com.spring.purchase.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.purchase.dao.PurDao;
import com.spring.purchase.service.PurService;
import com.spring.purchase.vo.PurVo;

@Service("purService")
public class PurServiceImpl implements PurService {

	@Autowired
	private PurDao purDao;

	@Override
	public List<PurVo> getPurList(HashMap<String, Object> map) {
		
		List<PurVo> purList = purDao.getPurList(map);
		
		return purList;
	}

	@Override
	public void insertPur(HashMap<String, Object> map) {
		
		purDao.insertPur(map);
		
	}


	
	
}
