package com.spring.film.controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.film.service.MemberService;
import com.spring.film.vo.MemberVo;
import com.spring.naverfilm.service.NaverFilmService;
import com.spring.naverfilm.vo.NaverFilmVo;
import com.spring.reqboard.service.ReqBoardService;
import com.spring.reqboard.vo.ReqBoardVo;

@Controller
public class FilmController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReqBoardService reqBoardService;
	
	@Autowired
	private NaverFilmService service;
	
	@RequestMapping("/")
	public String main() {
		return "gallery"; 
	}

	@RequestMapping("/{value}")
	public String login(
		@PathVariable("value") String val) {
		String link = "";
		switch(val) {
		case "registerForm": 
			link = "/signUp/register";
			break;
		case "forgotPassword": 
			link = "/signUp/forgot-password";
			break;
		case "filmReview": 
			link = "/reviews/filmReview";
			break;
		case "table": 
			link = "/table/table";
			break;
		case "boardTable": 
			link = "/table/boardTable";
			break;
		case "depositTable": 
			link = "/table/depositTable";
			break;
		case "modifyMem": 
			link = "/members/modifyMem";
			break;
					
		//ReqBoardController 에서 안넘어가서 여기에 추가 by박다솔
		case "reqBoardWriter": 
			link = "/reqBoard/reqBoard";
			break;	
		case "apiTest": 
			link = "/apiTest";
			break;
			
		// appiTest css 추가
		case "apiTestAddCss": 
			link = "/apiTestAddCss";
			break;
		}
		return link;
	}
	
	
	

	// 회원가입
	@RequestMapping("/registerMember")
	public ModelAndView registerMember(@RequestParam HashMap<String,Object> map) {
		
		System.out.println("회원등록하으자" + map);
		memberService.register(map);
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/login");
		return mv;
	}
	
	

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		return "/signUp/login";
	}
	
	// 로그인 처리
	@RequestMapping(value="/loginCheck", method=RequestMethod.POST)
	public String loginProcess(
			HttpSession session,
			@RequestParam HashMap<String, Object> map) {
	
		String returnURL = "";
		if( session.getAttribute("login") != null ) {
			session.removeAttribute("login");
		}
		
		MemberVo vo = memberService.login(map);

		if(vo != null) {
			session.setAttribute("login", vo );
			returnURL = "redirect:/?mId=" + map.get("mId");
		} else {
			returnURL = "redirect:/login";
		}
		
		return returnURL;
	}
	
	// 로그아웃 처리
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login");
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/UpdateForm")
	public ModelAndView updateForm(MemberVo vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", vo.getmId());
		
		MemberVo memberVo = memberService.getMemberView(map);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/members/modifyMem");
		mv.addObject("memberVo", memberVo);
		
		return mv;
	}
	
	@RequestMapping("/Update")
	public String update(MemberVo vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId",     vo.getmId());
		map.put("mPass",   vo.getmPass());
		map.put("mName",   vo.getmName());
		map.put("mGender", vo.getmGender());
		map.put("mBdate",  vo.getmBdate());
		
		memberService.memberUpdate(map);
		
		return "redirect:/members/modifyMem";
		
	}

	
	//ReqBoardController 에서 안넘어가서 여기에 추가 by박다솔
	@RequestMapping("/reqBoard")
	public String reqBoard(ReqBoardVo vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", vo.getmId());
		map.put("email", vo.getEmail());
		map.put("reqConts", vo.getReqConts());
		
		System.out.println("hash : "+map.put("mId", vo.getmId()));
		System.out.println("hash : "+map.put("email", vo.getEmail()));
		System.out.println("hash : "+map.put("reqConts", vo.getReqConts()));
		reqBoardService.addReqBoard(map);
		
		return "/reqBoard/reqBoardCheck";
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public void bookList(String keyword, HttpServletResponse response) {
		String json = service.searchFilm(keyword, 10, 1);
		//System.out.println(json); 
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

}
