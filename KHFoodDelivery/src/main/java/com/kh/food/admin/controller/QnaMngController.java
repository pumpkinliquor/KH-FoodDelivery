package com.kh.food.admin.controller;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.model.service.QnaMngService;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaReview;

@Controller	
public class QnaMngController {

	private Logger logger = LoggerFactory.getLogger(QnaMngController.class);
	
	@Autowired
	QnaMngService service;
	
	// 회원 문의 내역 리스트
	@RequestMapping("/admin/memberQnaList.do")
	public ModelAndView memberQnaList() {
		ModelAndView mv = new ModelAndView();
		
		// 회원 문의 리스트
		List<MemberQna> mqList = service.selectMemberQnaList();
		// 문의 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < mqList.size(); i++) {
			mqList.get(i).setFormatWriteDate(df.format(mqList.get(i).getWriteDate()));
		}
		
		mv.addObject("mqList", mqList);		
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
		String msg = "";
		String loc = "/admin/memberQnaView.do?no="+no;
		
		if(result > 0) {
			msg = "답변 완료!";			
		} else {
			msg = "답변 등록 실패...";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		
		return mv;
	}

	// 회원 문의 답변 삭제
	@RequestMapping("/admin/deleteMemberQnaReview.do")
	public ModelAndView deleteMemberQnaReview(@RequestParam("no") int no) {
		ModelAndView mv = new ModelAndView();		
		int result = service.deleteMemberQnaReview(no);
		String msg = "";
		String loc = "/admin/memberQnaView.do?no="+no;
		
		if(result > 0) {
			msg = "답변 삭제 완료!";
		} else {
			msg = "답변 삭제 실패...";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}	
	
	// 회원 문의 답변 수정
	@RequestMapping("/admin/updateMemberQnaReview.do")
	public ModelAndView updateMemberQnaReview(@RequestParam("no") int no, @RequestParam("updateContext") String context) {
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		map.put("no", no);
		map.put("context", context);
		int result = service.updateMemberQnaReview(map);
		String msg = "";
		String loc = "/admin/memberQnaView.do?no="+no;
		
		if(result > 0) {
			msg = "답변 삭제 완료!";
		} else {
			msg = "답변 삭제 실패...";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}	
	
	// 사장님 문의 내역 리스트
	@RequestMapping("/admin/ownerQnaList.do")
	public ModelAndView ownerQnaList() {
		ModelAndView mv = new ModelAndView();
		
		// 회원 문의 리스트
		List<MemberQna> mqList = service.selectMemberQnaList();
		// 문의 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < mqList.size(); i++) {
			mqList.get(i).setFormatWriteDate(df.format(mqList.get(i).getWriteDate()));
		}
		
		mv.addObject("mqList", mqList);		
		mv.setViewName("admin/memberQnaList");
		return mv;
	}
}
