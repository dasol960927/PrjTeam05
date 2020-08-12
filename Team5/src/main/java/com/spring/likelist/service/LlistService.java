package com.spring.likelist.service;

import java.util.HashMap;
import java.util.List;

import com.spring.likelist.vo.LlistVo;

public interface LlistService {

	List<LlistVo> getLlist(HashMap<String, Object> map);

}
