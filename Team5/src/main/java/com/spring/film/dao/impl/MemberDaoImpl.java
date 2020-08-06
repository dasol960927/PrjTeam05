package com.spring.film.dao.impl;

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
	public boolean loginCheck(MemberVo vo) {
		String name = sqlSession.selectOne("Member.loginCheck", vo);
		return (name == null) ? false : true;
	}
	




}
