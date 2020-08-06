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
		case "login": 
			link = "/signUp/login";
			break;
		case "forgotPassword": 
			link = "/signUp/forgot-password";
			break;
		case "register": 
			link = "/signUp/register";
			break;
		case "loginFinish": 
			link = "redirect:/";
			break;
		case "chart": 
			link = "/reviews/doughnutChar";
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
			
		//ReqBoardController 에서 안넘어가서 여기에 추가 by박다솔
		case "reqBoardWriter": 
			link = "/reqBoard/reqBoard";
			break;	
		case "apiTest": 
			link = "/apiTest";
			break;
		}
		return link;
	}
	
	@RequestMapping("/MemberRegister")
	public ModelAndView register() {
		
		
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

	
	//-------------------------------------------------
	// @ResponseBody : java 객체 -> json 문자열로 변경
	/*
	@RequestMapping(value="/getMovieJson")
	@ResponseBody
	public String getMovieJson() throws IOException {
		BufferedInputStream reader = null;
		try {
		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=63cf4f6d11769736dfab7c760fd0686d&targetDt=20200801");
		reader  = new BufferedInputStream(url.openStream());
		StringBuffer buffer = new StringBuffer();
		int i;
		byte [] b = new byte[4096];
		while( (i = reader.read(b)) != -1 ) {
			buffer.append(new String(b, 0, i));
		}
		return buffer.toString();
		} finally{
			if(reader != null)
				reader.close();
		}
	}
	
	@RequestMapping(value="/getMovieXml"
		,produces = "application/xml; charset=utf-8")
	@ResponseBody
	public String getMovieXml() throws IOException {
		BufferedInputStream reader = null;
		try {
		URL url = new URL("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=63cf4f6d11769736dfab7c760fd0686d&targetDt=20200801");
		reader  = new BufferedInputStream(url.openStream());
		StringBuffer buffer = new StringBuffer();
		int i;
		byte [] b = new byte[4096];
		while( (i = reader.read(b)) != -1 ) {
			buffer.append(new String(b, 0, i));
		}
		return buffer.toString();
		} finally{
			if(reader != null)
				reader.close();
		}
	}
	
	   //네이버
	   @RequestMapping(value="/getNaver")
	   @ResponseBody
	   public String ApiExamSearchFilm() {
	        String clientId = "dcjDMlfu6_wvXIDQGKGu"; //애플리케이션 클라이언트 아이디값"
	        String clientSecret = "xWsN0mQliO"; //애플리케이션 클라이언트 시크릿값"

	        String text = null;
	        try {
	            text = URLEncoder.encode("강철비2", "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }

	        String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + text;

	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String responseBody = get(apiURL,requestHeaders);

	        System.out.println(responseBody);
	        
	        return responseBody;
	   }
	   
	   private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }

	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }

	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }

	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);

	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();

	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }

	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }
	    */
	
}
