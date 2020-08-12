package com.spring.likelist.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.spring.likelist.service.LlistService;

@Controller
public class LlistController {
	
	@Autowired
	private LlistService llistService;
	
}
