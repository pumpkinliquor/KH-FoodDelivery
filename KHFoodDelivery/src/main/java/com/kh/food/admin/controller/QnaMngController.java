package com.kh.food.admin.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.model.service.QnaMngService;
import com.kh.food.common.PagingFactory;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaReview;
import com.kh.food.qna.model.vo.OwnerQna;
import com.kh.food.qna.model.vo.OwnerQnaReview;

@Controller
/*@SessionAttributes({"keyword", "isRe", "category"})*/
public class QnaMngController {

	private Logger logger = LoggerFactory.getLogger(QnaMngController.class);
	
	@Autowired
	QnaMngService service;
	
	// 회원 문의 내역 리스트
	@RequestMapping("/admin/memberQnaList.do")
	public ModelAndView memberQnaList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		int count = service.selectMemberQnaCount();		
		// 회원 문의 리스트
		List<MemberQna> mqList = service.selectMemberQnaList(cPage, numPerPage);
		// 문의 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < mqList.size(); i++) {
			mqList.get(i).setFormatWriteDate(df.format(mqList.get(i).getWriteDate()));
		}
		
		mv.addObject("mqList", mqList);		
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/admin/memberQnaList.do"));
		mv.setViewName("admin/memberQnaList");
		return mv;
	}
	
	// 회원 문의 검색
	@RequestMapping("/admin/searchMemberQna.do")
	public ModelAndView searchMemberQna(@RequestParam(value="keyword", defaultValue="") String keyword,
										@RequestParam(value="isRe", defaultValue="3") String isRe,
										@RequestParam(value="category", defaultValue="전체") String category,
										@RequestParam(value="isFirst", defaultValue="0") int isFirst,
										@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,
										HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		
	
		
		
		/*List<String> categoryList = new ArrayList();
		for(int i = 0; i < category.length; i++) {
			categoryList.add(category[i]);		
		}*/
		
		Map map = new HashMap();
		if(isFirst == 1) {						// 처음 검색했을 때 map 객체 안에 조건 저장	
			map.put("keyword", keyword);
			map.put("isRe", isRe);
			map.put("category", category);
			session.setAttribute("map", map);	// 맵을 세션에 저장
		} else {								
			map = (Map)session.getAttribute("map");		// 검색 후 페이징 했을 땐 세션에서 조건을 가져옴
		}
		
		List<MemberQna> mqList = service.searchMemberQna(map, cPage, numPerPage);
		int count = service.selectSearchMemberQnaCount((Map)session.getAttribute("map"));
		// 문의 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < mqList.size(); i++) {
			mqList.get(i).setFormatWriteDate(df.format(mqList.get(i).getWriteDate()));
		}

		for(MemberQna q : mqList) {
			logger.debug("" + q);
		}
		
		logger.debug(keyword);
		logger.debug(isRe);
		logger.debug(category);
		logger.debug(""+isFirst);
		
		mv.addObject("mqList", mqList);		
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/admin/searchMemberQna.do"));
		mv.setViewName("admin/memberQnaList");				
		return mv;
	}
	
	// 회원 문의 보기
	@RequestMapping("/admin/memberQnaView.do")
	public ModelAndView memberQnaView(@RequestParam("no") int no) {
		ModelAndView mv = new ModelAndView();
		
		// 문의 글 
		MemberQna mq = service.selectMemberQna(no);
		// 문의 날짜 포맷
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		mq.setFormatWriteDate(df.format(mq.getWriteDate()));
		
		// 문의 답변
		try {
			MemberQnaReview mqr = service.selectMemberQnaReview(no);
			// 답변 날짜 포맷
			mqr.setFormatWriteDate(df.format(mqr.getWriteDate()));
			mv.addObject("mqr", mqr);
		} catch(NullPointerException e) {
			e.printStackTrace();
		}
		
		mv.addObject("mq", mq);
		mv.setViewName("admin/memberQnaView");
		return mv;
	}
	
	// 회원 문의 댓글 등록
	@RequestMapping("/admin/insertMemberQnaRe.do")
	public ModelAndView insertMemberQnaRe(@RequestParam("context") String context,
										  @RequestParam("qnaNo") int no,
			HttpServletRequest request, HttpServletResponse response) {
		// 한글 인코딩
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		map.put("context", context);
		map.put("no", no);
		
		int result = service.insertMemberQnaReview(map);		
		
		mv.setViewName("redirect:/admin/memberQnaView.do?no=" + no);	
		
		return mv;
	}

	// 회원 문의 답변 삭제
	@RequestMapping("/admin/deleteMemberQnaReview.do")
	public ModelAndView deleteMemberQnaReview(@RequestParam("no") int no) {
		ModelAndView mv = new ModelAndView();		
		service.deleteMemberQnaReview(no);

		mv.setViewName("redirect:/admin/memberQnaView.do?no=" + no);
		return mv;
	}	
	
	// 회원 문의 답변 수정
	@RequestMapping("/admin/updateMemberQnaReview.do")
	public ModelAndView updateMemberQnaReview(@RequestParam("no") int no, @RequestParam("updateContext") String context) {
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		map.put("no", no);
		map.put("context", context);
		service.updateMemberQnaReview(map);		
		mv.setViewName("redirect:/admin/memberQnaView.do?no=" + no);
		return mv;
	}	
	
	// 회원 문의글 삭제
	@RequestMapping("/admin/deleteMemberQna.do")
	public ModelAndView deleteMemberQna(@RequestParam("no") int no) {
		ModelAndView mv = new ModelAndView();
		
		service.deleteMemberQna(no);
		mv.setViewName("redirect:/admin/memberQnaList.do");
		return mv;
	}
	
	// 사장 문의 내역 리스트
	@RequestMapping("/admin/ownerQnaList.do")
	public ModelAndView ownerQnaList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		int count = service.selectOwnerQnaCount();
		// 사장 문의 리스트
		List<OwnerQna> oqList = service.selectOwnerQnaList(cPage, numPerPage);
		// 문의 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < oqList.size(); i++) {
			oqList.get(i).setFormatWriteDate(df.format(oqList.get(i).getWriteDate()));
		}		
		
		mv.addObject("oqList", oqList);		
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/admin/ownerQnaList.do"));
		mv.setViewName("admin/ownerQnaList");
		return mv;
	}
	
	// 사장 문의 검색
	@RequestMapping("/admin/searchOwnerQna.do")
	public ModelAndView searchOwnerQna(@RequestParam(value="keyword", defaultValue="") String keyword,
										@RequestParam(value="isRe", defaultValue="3") String isRe,
										@RequestParam(value="category", defaultValue="전체") String category,
										@RequestParam(value="isFirst", defaultValue="0") int isFirst,
										@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,
										HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		// 한글 인코딩
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		
		
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		
		Map map1 = new HashMap();
		if(isFirst == 1) {						// 처음 검색했을 때 map 객체 안에 조건 저장	
			map1.put("keyword", keyword);
			map1.put("isRe", isRe);
			map1.put("category", category);
			session.setAttribute("map1", map1);	// 맵을 세션에 저장
		} else {								
			map1 = (Map)session.getAttribute("map1");		// 검색 후 페이징 했을 땐 세션에서 조건을 가져옴
		}
		
		List<OwnerQna> oqList = service.searchOwnerQna(map1, cPage, numPerPage);
		int count = service.selectSearchOwnerQnaCount(map1);
		// 문의 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < oqList.size(); i++) {
			oqList.get(i).setFormatWriteDate(df.format(oqList.get(i).getWriteDate()));
		}
		
		mv.addObject("oqList", oqList);		
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/admin/searchOwnerQna.do"));
		mv.setViewName("admin/ownerQnaList");				
		return mv;
	}
	
	// 사장 문의 보기
	@RequestMapping("/admin/ownerQnaView.do")
	public ModelAndView ownerQnaView(@RequestParam("no") int no) {
		ModelAndView mv = new ModelAndView();
		
		// 문의 글 
		OwnerQna oq = service.selectOwnerQna(no);
		// 문의 날짜 포맷
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		oq.setFormatWriteDate(df.format(oq.getWriteDate()));
		
		// 문의 답변
		try {
			OwnerQnaReview oqr = service.selectOwnerQnaReview(no);
			// 답변 날짜 포맷
			oqr.setFormatWriteDate(df.format(oqr.getWriteDate()));
			mv.addObject("oqr", oqr);
		} catch(NullPointerException e) {
			e.printStackTrace();
		}
		
		mv.addObject("oq", oq);
		mv.setViewName("admin/ownerQnaView");
		return mv;
	}
	
	// 사장 문의 댓글 등록
	@RequestMapping("/admin/insertOwnerQnaRe.do")
	public ModelAndView insertOwnerQnaRe(@RequestParam("context") String context,
										  @RequestParam("qnaNo") int no,
			HttpServletRequest request, HttpServletResponse response) {
		// 한글 인코딩
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		map.put("context", context);
		map.put("no", no);
		
		int result = service.insertOwnerQnaReview(map);		
		
		mv.setViewName("redirect:/admin/ownerQnaView.do?no=" + no);	
		
		return mv;
	}

	// 사장 문의 답변 삭제
	@RequestMapping("/admin/deleteOwnerQnaReview.do")
	public ModelAndView deleteOwnerQnaReview(@RequestParam("no") int no) {
		ModelAndView mv = new ModelAndView();		
		service.deleteOwnerQnaReview(no);

		mv.setViewName("redirect:/admin/ownerQnaView.do?no=" + no);
		return mv;
	}	
	
	// 사장 문의 답변 수정
	@RequestMapping("/admin/updateOwnerQnaReview.do")
	public ModelAndView updateOwnerQnaReview(@RequestParam("no") int no, @RequestParam("updateContext") String context) {
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		map.put("no", no);
		map.put("context", context);
		service.updateOwnerQnaReview(map);		
		mv.setViewName("redirect:/admin/ownerQnaView.do?no=" + no);
		return mv;
	}	
	
	// 사장 문의글 삭제
	@RequestMapping("/admin/deleteOwnerQna.do")
	public ModelAndView deleteOwnerQna(@RequestParam("no") int no) {
		ModelAndView mv = new ModelAndView();
		
		service.deleteOwnerQna(no);
		mv.setViewName("redirect:/admin/ownerQnaList.do");
		return mv;
	}
}
