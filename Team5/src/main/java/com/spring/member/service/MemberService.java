package com.spring.member.service;


import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import com.spring.member.vo.MemberVo;


public interface MemberService {


	public MemberVo login(HashMap<String, Object> map);

	public void register(HashMap<String, Object> map);

	public MemberVo getMemberView(HashMap<String, Object> map);

	public void memberUpdate(HashMap<String, Object> map);

	String find_id(HttpServletResponse response, String mPhone) throws Exception;



}
