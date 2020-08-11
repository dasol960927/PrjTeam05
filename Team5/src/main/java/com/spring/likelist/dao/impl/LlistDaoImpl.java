package com.spring.likelist.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.likelist.dao.LlistDao;

@Repository("llistDao")
public class LlistDaoImpl implements LlistDao {
	
	@Autowired
	private SqlSession sqlSession;
	
}
