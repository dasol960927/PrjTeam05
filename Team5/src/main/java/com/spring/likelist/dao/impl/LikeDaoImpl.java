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
	public void setDelete(HashMap<String, Object> map) {
		
		sqlSession.delete("LIKE.Delete", map);

		
	}

	@Override
	public LikeVo getLikeChk(HashMap<String, Object> map) {
		System.out.println("asdasdasd"+map);
		LikeVo LVo = sqlSession.selectOne("LIKE.getLikeChk", map);
		System.out.println("라이크다오임플에서 getLikeChk " + LVo);
		return LVo;
	}

	
}
