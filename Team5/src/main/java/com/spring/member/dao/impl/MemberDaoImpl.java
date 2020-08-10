package com.spring.member.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.member.dao.MemberDao;
import com.spring.member.vo.MemberVo;

@Repository("memberDao")
public class MemberDaoImpl implements MemberDao {

	@Autowired
	private SqlSession sqlSession;


	@Override
	public MemberVo login(HashMap<String, Object> map) {
		MemberVo memberVo = sqlSession.selectOne("Member.loginCheck", map);
		return memberVo;
	}

	@Override
	public void register(HashMap<String, Object> map) {
		sqlSession.insert("Member.MemberRegister", map);
	}

	@Override
	public MemberVo getMemberView(HashMap<String, Object> map) {
		System.out.println("다오임플의 맵출력" + map);
		sqlSession.selectOne("Member.MemberView", map);
		
		List<MemberVo> memberList = (List<MemberVo>) map.get("result");
		
		MemberVo memberVo = memberList.get(0);
		
		return memberVo;
	}

	@Override
	public void memberUpdate(HashMap<String, Object> map) {
		sqlSession.update("Member.MemberUpdate", map);
	}


	@Override
	public MemberVo find_id(HashMap<String, Object> map) throws Exception {
		MemberVo memberVo = sqlSession.selectOne("Member.find_id", map);
		System.out.println("memberVo=" + memberVo);
		return memberVo;
	}


}
