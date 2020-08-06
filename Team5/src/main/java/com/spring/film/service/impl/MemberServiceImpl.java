package com.spring.film.service.impl;

import java.util.HashMap;

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
	public MemberVo viewMember(MemberVo vo) {
		return memberDao.viewMember(vo);
	}


	@Override
	public MemberVo login(HashMap<String, Object> map) {
		MemberVo memberVo = memberDao.login(map);
		//System.out.println("서비스" + memberVo);
		System.out.println("서비스 맵" + map);
		return memberVo;
	}


 


}
