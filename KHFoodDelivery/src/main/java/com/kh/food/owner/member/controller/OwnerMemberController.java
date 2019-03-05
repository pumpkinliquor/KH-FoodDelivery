package com.kh.food.owner.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

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
	public ModelAndView ownerSearchPwEnd(String ownerId,String ownerEmail)
	{
		ModelAndView mv = new ModelAndView();
		logger.debug("오너이메일"+ownerEmail);
		
		Map<String,String> map = new HashMap<>();
		map.put("ownerId", ownerId);
		map.put("ownerEmail", ownerEmail);
		
		String msg = "";
		String loc = "";
		//아이디 또는 이메일이 일치 하지 않는다.
		Map<String,String> idEmail = service.selectConfirmIdEmail(map);
		logger.debug("아이디와 이메일" + idEmail);
		
		char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
        StringBuilder sb = new StringBuilder("");
        Random rn = new Random();
        
		if(idEmail == null)
		{
			msg = "아이디 또는 이메일이 일치 하지 않습니다";
			loc = "owner/ownerlogin";
		}		
		else
		{
			
			//랜덤비밀번호 생성
			
	        for( int i = 0 ; i < 8 ; i++ ){
	            sb.append( charaters[ rn.nextInt( charaters.length ) ] );
	        }
			
	        logger.debug("랜덤비밀번호:"+sb);
			String newPw = pwEncoder.encode(sb);
			map.put("ownerPw", newPw);
			int result = service.updateTempPw(map);
			//임시비밀번호로 디비 업데이트
			if(result > 0 )
			{
			
				msg = "메일 전송";
				loc = "/owner/ownerMain.do";
					
				String setfrom = "admin";
				String tomail = ownerEmail; // 받는 사람 이메일
				String title = "배달의민족 사장님 사이트 임시 비밀번호 입니다."; // 제목
				String content = "비밀번호는"+ sb + " 입니다 ."; // 내용
				
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
			
			}
			else
				{
					msg = "비밀번호 변경 실패";
					loc = "/owner/ownerMain.do";
				}
		}
		
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
			/*if(ownerPw.equals(o.getOwnerPw()))*/
			if(pwEncoder.matches(ownerPw, o.getOwnerPw()))
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
	
	//아이디 중복체크
	@RequestMapping("/owner/ownerCheckId.do")
	public void ownerCheckId(String ownerId,HttpServletResponse response) throws IOException 
	{
		logger.debug("아이디중복체크");
		boolean isId = service.ownerCheckId(ownerId)==0?false:true;
		logger.debug(String.valueOf(isId));
		response.getWriter().print(isId);
	}
}
