package com.spring.film.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.film.vo.MemberVo;

public interface MemberDao {

		public MemberVo viewMember(MemberVo vo);

		public boolean loginCheck(MemberVo vo);


}
