package com.kh.food.customer.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.kh.food.customer.member.model.service.MemberService;
import com.kh.food.customer.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	BCryptPasswordEncoder pwEncoder;
	@Autowired
	MemberService service;
	
	
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll()
	{
		return "customer/memberEnroll";
	}
	
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m,Model model)
	{
		System.out.println(m);
		String rawPw=m.getMemberPw();
		
		m.setMemberPw(pwEncoder.encode(rawPw));
		int result=service.memberEnroll(m);
		String msg="";
		String loc="/";
		if(result>0)
		{
			msg="회원가입을 성공하였습니다.";
		}
		else {
			msg="회원가입 실패하였습니다.";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);
		return "common/msg";
	}
	
}
