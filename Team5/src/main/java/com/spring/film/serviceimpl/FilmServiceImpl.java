package com.spring.film.serviceimpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.film.dao.FilmDao;
import com.spring.film.service.FilmService;
import com.spring.film.vo.FilmVo;

@Service("filmService")
public class FilmServiceImpl implements FilmService{
	
	@Autowired
	private FilmDao filmDao;

	@Override
	public void setFilm(HashMap<String, Object> map) {
		filmDao.setFilm(map);
		
	}

	@Override
	public FilmVo getPrice(HashMap<String, Object> map) {
		FilmVo fVo = filmDao.getPrice(map);
		return fVo;
	}

}
