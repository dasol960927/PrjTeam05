package com.spring.film.service;

import java.util.HashMap;

import com.spring.film.vo.FilmVo;

public interface FilmService {

	void setFilm(HashMap<String, Object> map);

	FilmVo getPrice(HashMap<String, Object> map);

}
