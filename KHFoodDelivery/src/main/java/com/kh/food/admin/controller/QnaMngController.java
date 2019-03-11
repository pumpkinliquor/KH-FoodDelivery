package com.kh.food.admin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.model.service.QnaMngService;
import com.kh.food.qna.model.vo.MemberQna;

@Controller	
public class QnaMngController {

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
		
		// 답변 여부
		
		
		mv.setViewName("admin/memberQnaList");
		return mv;
	}
	
	// 사장님 문의 내역 리스트
	@RequestMapping("/admin/ownerQnaList.do")
	public String ownerQnaList() {
		return "admin/ownerQnaList";
	}
	
	// 회원 문의 보기
	@RequestMapping("/admin/memberQnaView.do")
	public String memberQnaView() {
		return "admin/memberQnaView";
	}
}
