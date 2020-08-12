package com.spring.likelist.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.likelist.dao.LlistDao;
import com.spring.likelist.service.LlistService;
import com.spring.likelist.vo.LlistVo;

@Service("llistService")
public class LlistServiceImpl implements LlistService {

	@Autowired
	private LlistDao llistDao;

	@Override
	public List<LlistVo> getLlist(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
