package com.spring.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.member.email.Email;
import com.spring.member.email.EmailSender;
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
	
	@Autowired
	private EmailSender emailSender;

	@Autowired
	private Email email;
	
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
		case "find_idForm": 
			link = "members/find_id";
			break;
		case "find_id_result": 
			link = "members/find_id_result";
			break;
			
		//ReqBoardController 에서 안넘어가서 여기에 추가 by박다솔
		case "reqBoardWriter": 
			link = "reqBoard/reqBoard";
			break;	
		case "apiTest": 
			link = "apiTest";
			break;
		case "apiMain": 
			link = "apiMain";
			break;	
		// appiTest css 추가
		case "FilmSearch": 
			link = "reviews/FilmSearch";
			break;
		
		// 찜 테이블 likelist.jsp
		case "Likelist": 
			link = "table/likelist";
			break;
			
		//에러 페이지
		case "ErrorPage":
			link = "errorPage/500Page";
			break;
			
		}
	
		
		return link;
	}
	
	// 회원가입
	@RequestMapping("/registerMember")
	public ModelAndView registerMember(@RequestParam HashMap<String,Object> map) {
		
		memberService.register(map);
		ModelAndView mv = new ModelAndView();
		System.out.println("회원가입" + map);
		String errCode = (String) map.get("outErrCode");
		if(errCode.equals("8282")) {
			mv.setViewName("redirect:/registerForm");
		}else
			mv.setViewName("redirect:/login");
		return mv;
	}
	
	// 아이디 중복확인
	@RequestMapping(value = "/mIdCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("mId") String mId) {

		return memberService.mIdCheck(mId);
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
	
	//회원정보 수정
	@RequestMapping("/updateForm")
	public ModelAndView updateForm(@RequestParam HashMap<String, Object> map) {

		MemberVo memberVo = memberService.getMemberInfo(map);
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("members/modifyMem");
		mv.addObject("memberVo", memberVo);
		
		return mv;
	}
	
	
	@RequestMapping("/update")
	public String update(@RequestParam HashMap<String, Object> map) {
		memberService.memberUpdate(map);
		System.out.println("제발되라" + map);
		return "redirect:/test?mId=" + (String)map.get("mId");
		
	}
	
	 // 테스트(개인정보 조회)
	 @RequestMapping("/test") 
	 public ModelAndView Test(@RequestParam  HashMap<String, Object> map) { 
	 
		 MemberVo memberVo = memberService.getMemberInfo(map);

		 ModelAndView mv = new ModelAndView();
	 
		 mv.setViewName("table/depositTable"); 
		 mv.addObject("memberVo", memberVo);
	 
	 	 return mv;
	 
	 }
	
	
	
	
	//회원탈퇴
	@RequestMapping("/delete")
	public String delete(String mId) {
		System.out.println(mId);
		memberService.MemberDelete(mId);
		System.out.println("hi");
		return "table/depositTable";
	}

	// 아이디 찾기
	@RequestMapping(value="/find_Id", method=RequestMethod.POST)
	public ModelAndView find_id( @RequestParam HashMap<String, Object> map) {
		
		ModelAndView mv = new ModelAndView();
		
		MemberVo memberVo = memberService.find_id(map);
		System.out.println("memberVo=" + memberVo);
		String returnURL = "";
		mv.setViewName("members/find_id_result");
		mv.addObject("memberVo", memberVo);
		returnURL = "redirect:/find_id_result";
		return mv;
	}	
	
	// 새로운 비밀번호 생성
	@RequestMapping("/newPassword")
	public String newPassword(@Valid MemberVo memberVO, HttpSession session) throws Exception {
		Random r = new Random();
		int num = r.nextInt(89999) + 10000;
		String npassword = "bapsi" + Integer.toString(num);// 새로운 비밀번호 변경
		
		memberVO.setmPass(npassword);
		session.setAttribute("memberVO", memberVO);

		memberService.newPassword(memberVO);

		return "/findPassword";
	}
	
	// 이메일로 비밀번호가 전송이된다.
		@RequestMapping("/findPassword")
		public String findPasswordOK(MemberVo memberVO, HttpSession session) throws Exception {
			memberVO = (MemberVo) session.getAttribute("memberVO");
			email.setContent("새로운 비밀번호 " + memberVO.getmPass() + " 입니다." );
			email.setReceiver(memberVO.getmId());
			email.setSubject("안녕하세요" +memberVO.getmId() +"님  재설정된 비밀번호를 확인해주세요");
			emailSender.SendEmail(email);
			
			System.out.println(email);
			session.invalidate();
			return "signUp/login";
		}
	
	@RequestMapping("/reqBoard")
	public String reqBoard(@RequestParam HashMap<String, Object> map) {

		reqBoardService.addReqBoard(map);
		return "reqBoard/reqBoardCheck";
	}
	
	
	@RequestMapping("/search")
	@ResponseBody
	public void FlimList(String keyword, HttpServletResponse response) {
		String json = service.searchFilm(keyword, 10, 1);
		//System.out.println(json); 
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

}
