package com.spring.member.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;
import com.spring.naverfilm.service.NaverFilmService;
import com.spring.reqboard.service.ReqBoardService;
import com.spring.reqboard.vo.ReqBoardVo;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReqBoardService reqBoardService;
	
	@Autowired
	private NaverFilmService service;
	
	@RequestMapping("/")
	public String main() {
		return "main"; 
	}

	@RequestMapping("/{value}")
	public String login(
		@PathVariable("value") String val) {
		String link = "";
		switch(val) {
		case "registerForm": 
			link = "signUp/register";
			break;
		case "forgotPassword": 
			link = "signUp/forgot-password";
			break;
		case "filmReview": 
			link = "reviews/filmReview";
			break;
		case "table": 
			link = "table/table";
			break;
		case "boardTable": 
			link = "table/boardTable";
			break;
		case "depositTable": 
			link = "table/depositTable";
			break;
		case "simpleTable": 
			link = "table/simpleTable";
			break;
			
		//ReqBoardController 에서 안넘어가서 여기에 추가 by박다솔
		case "reqBoardWriter": 
			link = "reqBoard/reqBoard";
			break;	
		case "apiTest": 
			link = "apiTest";
			break;
		// appiTest css 추가
		case "FilmSearch": 
			link = "reviews/FilmSearch";
			break;
		}
		return link;
	}
	
	
	

	// 회원가입
	@RequestMapping("/registerMember")
	public ModelAndView registerMember(@RequestParam HashMap<String,Object> map) {
		
		memberService.register(map);
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("redirect:/login");
		return mv;
	}
	

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login() {
		return "signUp/login";
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
			returnURL = "redirect:/";
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
	
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(MemberVo vo) {
		String id = vo.getmId();
		System.out.println("로그인id" + id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", id);
		
		MemberVo memberVo = memberService.getMemberView(map);
		System.out.println("필름컨트롤러" + memberVo);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("members/modifyMem");
		mv.addObject("memberVo", memberVo);
		
		return mv;
	}
	
	@RequestMapping("/update")
	public String update(MemberVo vo) {
		System.out.println("필름컨트롤러에 update" + vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mId", vo.getmId());
		map.put("mPass", vo.getmPass());
		System.out.println(map);
		
		
		memberService.memberUpdate(map);
		return "table/depositTable";
		
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
		
		return "reqBoard/reqBoardCheck";
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