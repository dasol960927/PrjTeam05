package com.spring.likelist.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.likelist.dao.LikeDao;



@Repository("likeDao")
public class LikeDaoImpl implements LikeDao {
	
	@Autowired
	private SqlSession sqlSession;

	
}
