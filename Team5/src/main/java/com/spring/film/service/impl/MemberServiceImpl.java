package com.spring.film.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.film.dao.MemberDao;
import com.spring.film.service.MemberService;
import com.spring.film.vo.MemberVo;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;


	@Override
	public boolean loginCheck(MemberVo vo, HttpSession session) {
		boolean result = memberDao.loginCheck(vo);
		if(result) {
			MemberVo vo2 = viewMember(vo);
			
			session.setAttribute("mId", vo2.getmId());
			session.setAttribute("mPass", vo2.getmPass());
		}
		return result;
	}


	@Override
	public MemberVo viewMember(MemberVo vo) {
		return memberDao.viewMember(vo);
	}


 


}
