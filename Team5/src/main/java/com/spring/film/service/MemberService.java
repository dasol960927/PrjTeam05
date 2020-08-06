package com.spring.film.service;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.spring.film.vo.MemberVo;


public interface MemberService {

	MemberVo login(HashMap<String, Object> map);


}
