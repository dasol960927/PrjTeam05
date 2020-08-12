package com.spring.likelist.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.likelist.dao.LikeDao;
import com.spring.likelist.vo.LikeVo;



@Repository("likeDao")
public class LikeDaoImpl implements LikeDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<LikeVo> getList(HashMap<String, Object> map) {
		
		sqlSession.selectList("LIKE.LikeList", map);
		List<LikeVo> likeList = (List<LikeVo>) map.get("result");
				
		
		return likeList;
	}

	@Override
	public void setLike(HashMap<String, Object> map) {
		sqlSession.insert("LIKE.LikeInsert", map);
		
	}

	
}
