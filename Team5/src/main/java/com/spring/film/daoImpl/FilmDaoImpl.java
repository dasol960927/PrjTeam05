package com.spring.film.daoImpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.film.dao.FilmDao;
import com.spring.film.vo.FilmVo;

@Repository("filmDao")
public class FilmDaoImpl implements FilmDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void setFilm(HashMap<String, Object> map) {
		sqlSession.insert("FILM.FilmInsert", map);
		
	}

	@Override
	public FilmVo getPrice(HashMap<String, Object> map) {
		sqlSession.selectOne("FILM.FilmPrice", map);
		List<FilmVo> fVoList = (List<FilmVo>) map.get("result");
		FilmVo fVo = fVoList.get(0);
		
		return fVo;
	}
}
