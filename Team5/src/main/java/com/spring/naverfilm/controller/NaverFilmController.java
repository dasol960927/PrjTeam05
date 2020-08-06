package com.spring.naverfilm.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.naverfilm.service.NaverFilmService;

public class NaverFilmController {
	@Autowired
	private NaverFilmService service;
	
	@RequestMapping("/search")
	@ResponseBody
	public void bookList(String keyword, HttpServletResponse response) {
		String json = service.searchFilm(keyword, 10, 1);
		System.out.println(json); 
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
}
