package com.kh.food.customer.member.controller;

import java.io.UnsupportedEncodingException;

import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.customer.member.model.service.MemberService;
import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.owner.store.model.vo.Store;
import com.kh.food.common.PagingFactory;

@Controller
public class MemberController {

	

	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	@Autowired
	MemberService service;
	
	
	
	//회원종보 수정 폼
	@RequestMapping("/member/memberInfoChange.do")
	public ModelAndView memberInfoChange(ModelAndView mv)
	{
	
		
		mv.setViewName("customer/memberInfoChange");
		return mv;
	}
	
	

	
	
	//마이페이지
	@RequestMapping("/customer/mypage.do")
	public ModelAndView myPage(String memberId) {
		ModelAndView mv =new ModelAndView();
		Member member = service.selectMember(memberId);
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		member.setFormatBirth(df.format(member.getMemberBirth()));
		System.out.println("객체"+member);
		
		mv.addObject("member",member);
		mv.setViewName("customer/memberInfoChange");
		return mv;
		
	}
	//회원정보 수정
	@RequestMapping("/member/update.do")
	public ModelAndView update(Member m) {
		
		System.out.println(m);
		int result=service.update(m);
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="회원정보 수정 완료.";
			loc="/";
		}else {
			msg="회원정보 수정 실패";
			loc="/customer/mypage.do?memberId="+m.getMemberId();
		}
		ModelAndView mv=new ModelAndView();
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
		
		
	}
	
	
	
	//아이디 체크
	@RequestMapping("/member/checkId.do")
	public ModelAndView checkId(String memberId,ModelAndView mv) throws UnsupportedEncodingException{
		
		Map map=new HashMap();
		boolean isId=service.checkId(memberId)==0?false:true;
		map.put("isId",isId);

		
		mv.addAllObjects(map); //map 으로 된거 통째로 넣어줌
		mv.addObject("char",URLEncoder.encode("문자열","UTF-8"));
		mv.addObject("num",1);
			
		mv.setViewName("jsonView");
		
		return mv;
		
		
	}
	//닉네임 체크
	@RequestMapping("/member/checkNick.do")
	public ModelAndView checkNick(String nickName,ModelAndView mv) throws UnsupportedEncodingException{
		
		Map map=new HashMap();
		boolean isNick=service.checkNick(nickName)==0?false:true;
		map.put("isNick",isNick);

		
		mv.addAllObjects(map); //map 으로 된거 통째로 넣어줌
		mv.addObject("char",URLEncoder.encode("문자열","UTF-8"));
		mv.addObject("num",1);
			
		mv.setViewName("jsonView");
		
		return mv;
		
		
	}
	
	//로그인 폼
	@RequestMapping("/customer/login.do")
	public String login()
	{
		return "customer/login";
	}
	
	//로그인
	@RequestMapping("/member/login.do")
	public ModelAndView login(String id,String pw,HttpSession session) {
		
		ModelAndView mv =new ModelAndView();
		
		Map<String,String> map=new HashMap();
		map.put("id",id);
		map.put("pw",pw);
		
		Map<String,String> result=service.login(map);
		
		String msg="";
		String loc="/";
		if(result!=null) {
			
			if(pwEncoder.matches(pw,result.get("MEMBERPW"))) {
				msg="로그인 성공";
				session.setAttribute("logined", result.get("MEMBERID"));
			
			
			}else {
				msg="패스워드가 일치하지 않습니다.";
			}
		}else {
			msg="아이디가 존재하지 않습니다.";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	//로그아웃
	@RequestMapping("/customer/logout.do")
	public ModelAndView logout(HttpSession session) {
		
		ModelAndView mv= new ModelAndView();
		String msg="";
		String loc="/";
		if(session!=null)
		{
			session.invalidate();
			msg="로그아웃 되었습니다.";
		}else {
			msg="로그아웃 실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
		
	
	//회원가입 폼
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll()
	{
		return "customer/memberEnroll";
	}
	
	
	//회원가입완료
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m,Model model)
	{
		System.out.println(m);
		String rawPw=m.getMemberPw();
		System.out.println("암호화전"+rawPw);
		
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
	
	//테스트용
	@RequestMapping("/map/test.do")
	public String map()
	{
		return "customer/test";
	}

	//가게 출력
	@RequestMapping("/customer/searchmenuView")
	public ModelAndView menuView(String category,@RequestParam(value="cPage", required=false, defaultValue="0") int	cPage) {
		
		ModelAndView mv=new ModelAndView();
		int numPerPage=8;
		int count=service.selectMenuCount();
		List<Store> list=service.selectStore(category,cPage,numPerPage);
		
		
		mv.addObject("pageBar",PagingFactory.getPageBar2(category,count, cPage, numPerPage, "/food/customer/searchmenuView"));
		mv.addObject("list",list);
		mv.setViewName("customer/searchMenu");
		
		
		return mv;
	}	
	
	@RequestMapping("/customer/menuInfo")
	public ModelAndView infoMenu(ModelAndView mv,String storeName)
	{
		mv.setViewName("customer/menuInfo");
		return mv;
	}
	
	
	
	
	
	
}
