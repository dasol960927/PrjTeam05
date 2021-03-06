package com.spring.member.service;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.spring.member.vo.MemberVo;


public interface MemberService {


	public MemberVo login(HashMap<String, Object> map);

	public void register(HashMap<String, Object> map);

	public MemberVo getMemberView(HashMap<String, Object> map);

	public void memberUpdate(HashMap<String, Object> map);

	public MemberVo find_id(HashMap<String, Object> map);

	public MemberVo find_pass(HashMap<String, Object> map);
	
	public int mIdCheck(String mId);

	public void MemberDelete(String mId);
	
	public MemberVo getMemberInfo(HashMap<String, Object> map);

	public void newPassword(MemberVo memberVO);

	public void openChkUpdate(HashMap<String, Object> map);



}
