package com.spring.film.service;


import javax.servlet.http.HttpSession;

import com.spring.film.vo.MemberVo;


public interface MemberService {

	public boolean loginCheck(MemberVo vo, HttpSession session);

	public MemberVo viewMember(MemberVo vo);

}
