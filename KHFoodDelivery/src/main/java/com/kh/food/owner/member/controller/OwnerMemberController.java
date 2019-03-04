package com.kh.food.owner.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.member.model.service.OwnerMemberService;
import com.kh.food.owner.member.model.vo.Owner;

@SessionAttributes("ownerId")
@Controller
public class OwnerMemberController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	OwnerMemberService service;
		
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	
	
	private Logger logger = LoggerFactory.getLogger(OwnerMemberController.class);
	
	//사장님 회원가입
	@RequestMapping("/owner/ownerEnrollEnd.do")
	public ModelAndView InsertOwner(Owner o)
	{
		
		logger.debug("Owner"+o);
		String msg = "";
		String loc = "/owner/ownerMain.do";

		ModelAndView mv = new ModelAndView();
		//패스워드 암호화
		String oPassword = o.getOwnerPw();
		o.setOwnerPw(pwEncoder.encode(oPassword));
		int result = service.insertOwner(o);
		if(result >0)
		{
			msg="회원가입 성공";
		}
		else
		{
			msg="회원가입 실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	//아이디찾기
	@RequestMapping("/owner/ownerSearchIdEnd.do")
	public ModelAndView ownerSearchId(String ownerName , String ownerEmail)
	{
		ModelAndView mv = new ModelAndView();
		logger.debug("아이디찾기"+ownerName + " : " + ownerEmail);
		Map<String,String> map = new HashMap<>();
		map.put("ownerName", ownerName);
		map.put("ownerEmail", ownerEmail);
		map = service.selectSearchId(map);
		logger.debug("찾는 아이디 map"+map);
		
		String msg = "";
		//아이디가 있다 
		if(map != null)
		{
		String ownerId = map.get("OWNERID");		
		msg = "찾으시는 아이디는 " + ownerId + "입니다";
		}
		else
		{
			msg = "찾으시는 아이디가 없습니다";
		}
		String loc = "/owner/login.do";
		mv.addObject("loc",loc);
		mv.addObject("msg",msg);
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	//비밀번호 찾기페이지 들어감 
	@RequestMapping("/owner/ownerSearchPw.do")
	public String ownerSearchPw()
	{
		return "owner/ownerPwSearch";
	}
	
	//비밀번호찾기 
	@RequestMapping("/owner/ownerSearchPwEnd.do")
	public ModelAndView ownerSearchPwEnd(String ownerEmail)
	{
		ModelAndView mv = new ModelAndView();
		logger.debug("오너이메일"+ownerEmail);
		
		
		String setfrom = "wow";
		String tomail = ownerEmail; // 받는 사람 이메일
		String title = "배달의민족 사장님 사이트 비밀번호 입니다."; // 제목
		String content = "비밀번호는 1234 입니다 ."; // 내용
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		String msg="메일전송";
		String loc="/owner/ownerMain.do";
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//사장님 로그인
	@RequestMapping("/login/loginEnd.do")
	public ModelAndView selectLogin(String ownerId , String ownerPw)
	{
		ModelAndView mv = new ModelAndView();
		logger.debug("ownerId"+ownerId + "ownerPW" + ownerPw);
		
		Owner o = service.selectLogin(ownerId);
		String msg ="";
		String loc = "/owner/ownerMain.do";
		
		logger.debug("사장님객체"+o);
		if( o != null)
		{
			
			//로그인성공 
			if(ownerPw.equals(o.getOwnerPw()))
			{
				
			mv.addObject("ownerId",o.getOwnerId());
			msg =  ownerId + "님 환영합니다";
			
			}
			//비밀번호가 틀릴때
			else
			{
				msg = "비밀번호가 틀립니다.";
			}
		}
		else
		{
			// 존재하지 않는 아이디
			msg = "아이디가 존재하지 않습니다.";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//로그아웃
	@RequestMapping("/owner/logout.do")
	public String ownerLogout(SessionStatus status)
	{
		if(!status.isComplete())
		{
			status.setComplete();
		}
		
		return "redirect:/owner/ownerMain.do";
	}
}
