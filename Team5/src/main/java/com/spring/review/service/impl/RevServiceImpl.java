package com.spring.review.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.review.dao.RevDao;
import com.spring.review.service.RevService;
import com.spring.review.vo.RevVo;

@Service("revService")
public class RevServiceImpl implements RevService {

	@Autowired
	private RevDao revDao;

	@Override
	public List<RevVo> getGrdList(HashMap<String, Object> map) {
		
		List<RevVo> grdList = revDao.getGrdList(map);
		
		return grdList;
	}

	@Override
	public List<RevVo> getRevList(HashMap<String, Object> map) {
		
		List<RevVo> revList = revDao.getRevList(map);
		
		return revList;
	}

	
	@Override
	public List<RevVo> getRevList2(HashMap<String, Object> map) {
		
		List<RevVo> revList = revDao.getRevList2(map);
		
		return revList;
	}
	
	
	@Override
	public void insertGrd(HashMap<String, Object> map) {
		
		revDao.insertGrd(map);
		
	}
	
	@Override
	public void insertRev(HashMap<String, Object> map) {
		
		revDao.insertRev(map);
		
	}	

	
	@Override
	public RevVo getGrdConts(HashMap<String, Object> map) {
		RevVo revVo = revDao.getGrdConts(map);
		return revVo;
	}
	
	@Override
	public RevVo getRevConts(HashMap<String, Object> map) {
		
		RevVo revVo = revDao.getRevConts(map);
		return revVo;
	}

	@Override
	public void insRevLvl1(HashMap<String, Object> map) {
		
		revDao.insRevLvl1(map);
		
	}

	@Override
	public void insRevLvl2(HashMap<String, Object> map) {
		
		revDao.insRevLvl2(map);
		
	}

	@Override
	public void insertSym(HashMap<String, Object> map) {
		
		revDao.insertSym(map);
		
	}

	@Override
	public List<RevVo> myGrdList(HashMap<String, Object> map) {
		
		List<RevVo> grdList = revDao.myGrdList(map);
		
		return grdList;
	}
	
	@Override
	public void updateGrd(HashMap<String, Object> map) {
		
		revDao.updateGrd(map);
		
	}
	
	@Override
	public void deleteGrd(HashMap<String, Object> map) {
		
		revDao.deleteGrd(map);
		
	}
	

	@Override
	public List<RevVo> myRevList(HashMap<String, Object> map) {
		
		List<RevVo> revList = revDao.myRevList(map);
		
		return revList;
	}

	@Override
	public void updateRev(HashMap<String, Object> map) {
		revDao.updateRev(map);		
	}
	
}
