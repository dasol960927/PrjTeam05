package com.spring.member.service.impl;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.member.dao.MemberDao;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;


	@Override
	public MemberVo login(HashMap<String, Object> map) {
		MemberVo memberVo = memberDao.login(map);
		return memberVo;
	}


	@Override
	public void register(HashMap<String, Object> map) {
			memberDao.register(map);
	}


	@Override
	public MemberVo getMemberView(HashMap<String, Object> map) {
		MemberVo memberVo = memberDao.getMemberView(map);
		return memberVo;
	}


	@Override
	public void memberUpdate(HashMap<String, Object> map) {
		memberDao.memberUpdate(map);
	}


	@Override
	public MemberVo find_id(HashMap<String, Object> map) throws Exception {
		MemberVo memberVo = memberDao.find_id(map);
		return memberVo;
	}


	@Override
	public int mIdCheck(String mId) {
		return memberDao.mIdCheck(mId);
	}


	@Override
	public void MemberDelete(String mId) {
		memberDao.MemberDelete(mId);
		
	}
 


}
