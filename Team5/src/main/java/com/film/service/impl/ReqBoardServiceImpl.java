package com.film.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.film.dao.ReqBoardDao;
import com.film.service.ReqBoardService;

@Service("reqBoardService")
public class ReqBoardServiceImpl implements ReqBoardService {

	@Autowired
	private ReqBoardDao reqBoardDao;
	
	@Override
	public void addReqBoard(HashMap<String, Object> map) {
		reqBoardDao.addReqBoard(map);
		
	}

}
