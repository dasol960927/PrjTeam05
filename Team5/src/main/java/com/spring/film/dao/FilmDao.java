package com.spring.film.dao;

import java.util.HashMap;

import com.spring.film.vo.FilmVo;

public interface FilmDao {

	void setFilm(HashMap<String, Object> map);

	FilmVo getPrice(HashMap<String, Object> map);

}
