package com.spring.film.dao.impl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.film.dao.MemberDao;
import com.spring.film.vo.MemberVo;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberVo viewMember(MemberVo vo) {
		return sqlSession.selectOne("Member.viewMember", vo);
	}

	@Override
	public MemberVo login(HashMap<String, Object> map) {
		MemberVo memberVo = sqlSession.selectOne("Member.loginCheck", map);
		//System.out.println("다오" + memberVo);
		System.out.println("다오맵" + map);
		return memberVo;
	}




}
