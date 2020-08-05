package com.spring.reqboard.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.reqboard.dao.ReqBoardDao;
import com.spring.reqboard.service.ReqBoardService;
import com.spring.reqboard.vo.ReqBoardVo;

@Service("reqBoardService")
public class ReqBoardServiceImpl implements ReqBoardService {

	@Autowired
	private ReqBoardDao reqBoardDao;
	
	@Override
	public void addReqBoard(HashMap<String, Object> map) {
		reqBoardDao.addReqBoard(map);
	}
}
