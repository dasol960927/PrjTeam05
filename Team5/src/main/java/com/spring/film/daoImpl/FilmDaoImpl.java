package com.spring.film.daoImpl;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.film.dao.FilmDao;

@Repository("filmDao")
public class FilmDaoImpl implements FilmDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void setFilm(HashMap<String, Object> map) {
		sqlSession.insert("FILM.FilmInsert", map);
		
	}
}
