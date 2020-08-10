package com.spring.member.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.member.vo.MemberVo;

public interface MemberDao {

		
		public MemberVo login(HashMap<String, Object> map);

		public void register(HashMap<String, Object> map);

		public MemberVo getMemberView(HashMap<String, Object> map);

		public void memberUpdate(HashMap<String, Object> map);

		public MemberVo find_id(HashMap<String, Object> map) throws Exception;

		public int mIdCheck(String mId);


}
