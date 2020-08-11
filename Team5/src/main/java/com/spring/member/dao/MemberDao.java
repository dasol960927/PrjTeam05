package com.spring.member.dao;

import java.util.HashMap;

import com.spring.member.vo.MemberVo;

public interface MemberDao {

		
		public MemberVo login(HashMap<String, Object> map);

		public void register(HashMap<String, Object> map);

		public MemberVo getMemberView(HashMap<String, Object> map);

		public void memberUpdate(HashMap<String, Object> map);

		String find_id(String mPhone) throws Exception;

		public void MemberDelete(String mId);


}
