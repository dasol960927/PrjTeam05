package com.spring.member.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.member.vo.MemberVo;

public interface MemberDao {

		
		public MemberVo login(HashMap<String, Object> map);

		public void register(HashMap<String, Object> map);

		public MemberVo getMemberView(HashMap<String, Object> map);

		public void memberUpdate(HashMap<String, Object> map);
		
		public MemberVo getMemberInfo(HashMap<String, Object> map);

		public void find_id(HashMap<String, Object> map);

		public int mIdCheck(String mId);

		public void MemberDelete(String mId);


}
