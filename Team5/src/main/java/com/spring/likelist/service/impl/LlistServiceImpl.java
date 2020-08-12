package com.spring.likelist.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.likelist.dao.LlistDao;
import com.spring.likelist.service.LlistService;

@Service("llistService")
public class LlistServiceImpl implements LlistService {

	@Autowired
	private LlistDao llistDao;
	
	
}
