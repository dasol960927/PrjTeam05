package com.spring.deposit.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.deposit.dao.DpsDao;
import com.spring.deposit.service.DpsService;
import com.spring.deposit.vo.DpsVo;

@Service("dpsService")
public class DpsServiceImpl implements DpsService {
	
	@Autowired
	private DpsDao dpsDao;


	@Override
	public List<DpsVo> getDpsList(HashMap<String, Object> map) {
		
		List<DpsVo> dpsList = dpsDao.getDpsList(map);
		
		System.out.println(dpsList);
		
		return dpsList;
		
	}


	@Override
	public void insertDps(HashMap<String, Object> map) {
		dpsDao.insertDps(map);
		
	}


	
	
	
}
