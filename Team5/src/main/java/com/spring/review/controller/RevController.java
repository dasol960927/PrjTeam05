package com.spring.review.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.film.service.FilmService;
import com.spring.film.vo.FilmVo;
import com.spring.likelist.service.LikeService;
import com.spring.likelist.vo.LikeVo;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;
import com.spring.review.service.RevService;
import com.spring.review.vo.RevVo;

@Controller
public class RevController {

	@Autowired
	private RevService revService;

	@Autowired
	private FilmService filmService;

	@Autowired
	private LikeService likeService;

	@Autowired
	private MemberService memberService;

	@RequestMapping("/REVIEW/grdList")
	public ModelAndView grdList(@RequestParam HashMap<String, Object> map) {

		//System.out.println("리뷰 맵" + map);
		// map : filmId 하나, 무조건 들어와야됨
		List<RevVo> grdList = revService.getGrdList(map);

		FilmVo fVo = filmService.getPrice(map);
		LikeVo LVo = likeService.getLikeChk(map);
		MemberVo mVo = memberService.getMemberInfo(map);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/filmReview1");

		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));
		mv.addObject("oCnt", map.get("oCnt"));
		mv.addObject("oAvg", map.get("oAvg"));
		mv.addObject("mId", map.get("mId"));
		mv.addObject("grdList", grdList);

		mv.addObject("fVo", fVo);
		mv.addObject("mVo", mVo);

		//System.out.println("리뷰컨트롤러의" + map);
		//System.out.println(grdList);

		return mv;
	}

	@RequestMapping("/REVIEW/revList")
	public ModelAndView revList1(@RequestParam HashMap<String, Object> map) {

		// map : filmId 하나, 무조건 들어와야됨
		List<RevVo> revList = revService.getRevList(map);

		FilmVo fVo = filmService.getPrice(map);
		LikeVo LVo = likeService.getLikeChk(map);
		MemberVo mVo = memberService.getMemberInfo(map);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/filmReview2");

		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));
		mv.addObject("oCnt", map.get("oCnt"));
		mv.addObject("revList", revList);

		mv.addObject("fVo", fVo);
		mv.addObject("mVo", mVo);

		// 테스트
		mv.addObject("mId", map.get("mId"));

		//System.out.println(map);

		return mv;
	}

	@RequestMapping("/REVIEW/reviewRead")
	public ModelAndView reviewRead(@RequestParam HashMap<String, Object> map) {

		// map : revIdx
		//System.out.println("reviewRead map : " + map);

		RevVo revVo = revService.getRevConts(map);
		List<RevVo> revList1 = revService.getRevList(map);
		List<RevVo> revList2 = revService.getRevList2(map);

		FilmVo fVo = filmService.getPrice(map);
		LikeVo LVo = likeService.getLikeChk(map);
		MemberVo mVo = memberService.getMemberInfo(map);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/filmReviewConts");

		mv.addObject("revIdx", map.get("revIdx"));
		mv.addObject("revLvl", map.get("revLvl"));
		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));
		mv.addObject("oCnt", map.get("oCnt"));
		mv.addObject("revVo", revVo);
		mv.addObject("revList1", revList1);
		mv.addObject("revList2", revList2);

		mv.addObject("fVo", fVo);
		mv.addObject("mVo", mVo);

		// 테스트
		mv.addObject("mId", map.get("mId"));

		//System.out.println("reviewRead list1 : " + revList1);
		//System.out.println("reviewRead list2 : " + revList2);

		return mv;
	}

	@RequestMapping("/REVIEW/insertGrdForm")
	public ModelAndView insertGrdForm(@RequestParam HashMap<String, Object> map) {

		//System.out.println(map);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/insertGrdForm");

		return mv;
	}

	@RequestMapping("/REVIEW/insertGrd")

	@ResponseBody
	public ModelAndView insertGrd(@RequestParam HashMap<String, Object> map) {

		// map : {mId=A@naver.com, filmId=F00004, grdScore=4, grdConts=가나다라}
		//System.out.println("맵제발" + map);
		revService.insertGrd(map);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/REVIEW/grdList");
		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));
		mv.addObject("mId", map.get("mId"));

		return mv;
	}
	

	@RequestMapping("/REVIEW/insertRevForm")
	public ModelAndView insertRevForm(@RequestParam HashMap<String, Object> map) {

		//System.out.println(map);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/insertRevForm");

		return mv;
	}

	@RequestMapping("/REVIEW/insertRev")
	public ModelAndView insertRev(@RequestParam HashMap<String, Object> map) {

		// map : {mId=A@naver.com, filmId=F00004, grdScore=4, grdConts=가나다라}
		//System.out.println("맵제발" + map);
		revService.insertRev(map);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/REVIEW/revList");
		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));
		mv.addObject("mId", map.get("mId"));

		return mv;
	}

	@RequestMapping("/REVIEW/insRevLvl1")
	public ModelAndView insRevLvl1(@RequestParam HashMap<String, Object> map) {

		//System.out.println("form1 map : " + map);

		revService.insRevLvl1(map);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/REVIEW/reviewRead");

		mv.addObject("revIdx", map.get("revIdx"));
		mv.addObject("revLvl", map.get("revLvl"));

		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));

		mv.addObject("mId", map.get("mId"));

		return mv;
	}

	@RequestMapping("/REVIEW/insRevLvl2")
	public ModelAndView insRevLvl2(@RequestParam HashMap<String, Object> map) {

		//System.out.println("form2 map : " + map);

		revService.insRevLvl2(map);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/REVIEW/reviewRead");

		mv.addObject("revIdx", map.get("lvl0Idx"));
		mv.addObject("revLvl", map.get("revLvl"));

		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));

		mv.addObject("mId", map.get("mId"));

		return mv;
	}

	@RequestMapping("/REVIEW/insRev12Cnt")
	public ModelAndView insRev12Cnt(@RequestParam HashMap<String, Object> map) {

		//System.out.println("좋아요싫어요 map : " + map);

		revService.insertSym(map);
		ModelAndView mv = new ModelAndView();

		mv.setViewName("redirect:/REVIEW/reviewRead");

		mv.addObject("revIdx", map.get("lvl0Idx"));
		mv.addObject("revLvl", map.get("revLvl"));

		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));
		//
		mv.addObject("mId", map.get("mId"));

		return mv;
	}

	/*
	@RequestMapping("/REVIEW/insGrdCnt")
	public ModelAndView insGrdCnt(@RequestParam HashMap<String, Object> map) {

		System.out.println("좋아요싫어요 map : " + map);

		revService.insertSym(map);
		ModelAndView mv = new ModelAndView();

		mv.setViewName("redirect:/REVIEW/grdList");

		mv.addObject("docId", map.get("docId"));
		mv.addObject("filmId", map.get("filmId"));
		mv.addObject("filmSeq", map.get("filmSeq"));
		mv.addObject("filmYear", map.get("filmYear"));
		//
		mv.addObject("mId", map.get("mId"));

		return mv;
	}
	*/
	
	@RequestMapping("/REVIEW/insGrdCnt")
	@ResponseBody
	public HashMap<String, Object> insGrdCnt(@RequestParam HashMap<String, Object> map) {

		//System.out.println("좋아요싫어요 map : " + map);
		revService.insertSym(map);
		//List<RevVo> grdList = revService.getGrdList(map);

		HashMap<String, Object> newMap = new HashMap<String, Object>();
		newMap.put("docId", map.get("docId"));
		newMap.put("filmId", map.get("filmId"));
		newMap.put("filmSeq", map.get("filmSeq"));
		newMap.put("filmYear", map.get("filmYear"));
		newMap.put("mId", map.get("mId"));
		
		//newMap.put("grdList", grdList);
		
		return newMap;
	}

	
	@RequestMapping("/REVIEW/MyGrdList")
	public ModelAndView MyGrdList(@RequestParam HashMap<String, Object> map) {

		//System.out.println("내 한줄평목록 map : " + map);

		List<RevVo> grdList = revService.myGrdList(map);
		MemberVo memberVo = memberService.getMemberInfo(map);
		ModelAndView mv = new ModelAndView();

		mv.setViewName("reviews/myGrdList");

		mv.addObject("grdList", grdList);
		mv.addObject("memberVo", memberVo);
		
		mv.addObject("mId", map.get("mId"));

		return mv;
	}
	
	@RequestMapping("/REVIEW/updateGrdForm")
	public ModelAndView updateGrdForm(@RequestParam HashMap<String, Object> map) {
		
		System.out.println("업데이트폼 맵(idx가지고 와야됨) : " + map);
		// getGrdConts 만들어서 가져올거임 ㄱㄷ
		RevVo revVo = revService.getGrdConts(map);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/updateGrdForm");
		mv.addObject("revVo", revVo);
		
		System.out.println(revVo);

		return mv;
	}	
	
	@RequestMapping("/REVIEW/updateGrd")
	public ModelAndView updateGrd(@RequestParam HashMap<String, Object> map) {
		
		System.out.println("업데이트평점 맵" + map);

		revService.updateGrd(map);

		ModelAndView mv = new ModelAndView();
		mv.addObject("mId", map.get("mId"));
		mv.setViewName("redirect:/REVIEW/MyGrdList");
		
		return mv;
	}
	
	@RequestMapping("/REVIEW/deleteGrd")
	public ModelAndView deleteGrd(@RequestParam HashMap<String, Object> map) {
		
		System.out.println("딜리트평점 맵" + map);
		revService.deleteGrd(map);

		ModelAndView mv = new ModelAndView();
		mv.addObject("mId", map.get("mId"));
		mv.setViewName("redirect:/REVIEW/MyGrdList");			
		return mv;
	}		
	
	@RequestMapping("/REVIEW/MyRevList")
	public ModelAndView MyRevList(@RequestParam HashMap<String, Object> map) {

		//System.out.println("내 리뷰목록 map : " + map);

		List<RevVo> revList = revService.myRevList(map);
		MemberVo memberVo = memberService.getMemberInfo(map);
		ModelAndView mv = new ModelAndView();

		mv.setViewName("reviews/myRevList");

		mv.addObject("revList", revList);
		mv.addObject("memberVo", memberVo);
		
		mv.addObject("mId", map.get("mId"));
		
		System.out.println("revList  : " + revList);

		return mv;
	}
	
	@RequestMapping("/REVIEW/updateRevForm")
	public ModelAndView updateRevForm(@RequestParam HashMap<String, Object> map) {
		
		System.out.println("업데이트리뷰폼 맵(idx가지고 와야됨) : " + map);
		// getGrdConts 만들어서 가져올거임 ㄱㄷ
		RevVo revVo = revService.getRevConts(map);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("reviews/updateRevForm");
		mv.addObject("revVo", revVo);
		
		System.out.println(revVo);

		return mv;
	}	
	
	@RequestMapping("/REVIEW/updateRev")
	public ModelAndView updateRev(@RequestParam HashMap<String, Object> map) {

		System.out.println("업데이트리뷰 맵" + map);
		revService.updateRev(map);

		ModelAndView mv = new ModelAndView();
		mv.addObject("mId", map.get("mId"));
		mv.setViewName("redirect:/REVIEW/MyRevList");
		
		return mv;
	}	
	
	@RequestMapping("/REVIEW/deleteRev")
	public ModelAndView deleteRev(@RequestParam HashMap<String, Object> map) {
		
		System.out.println("딜리트리뷰 맵" + map);
		revService.deleteGrd(map);

		ModelAndView mv = new ModelAndView();
		mv.addObject("mId", map.get("mId"));
		mv.setViewName("redirect:/REVIEW/MyRevList");			
		return mv;
	}		

}
