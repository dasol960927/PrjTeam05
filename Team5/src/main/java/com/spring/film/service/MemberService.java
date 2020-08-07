package com.spring.film.service;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.spring.film.vo.MemberVo;


public interface MemberService {


	public MemberVo login(HashMap<String, Object> map);

	public void register(HashMap<String, Object> map);

	public MemberVo getMemberView(HashMap<String, Object> map);

	public void memberUpdate(HashMap<String, Object> map);


}
