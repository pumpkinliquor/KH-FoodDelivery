package com.kh.food.customer.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.notice.model.service.NoticeService;
import com.kh.food.admin.notice.model.vo.MemberNotice;
import com.kh.food.common.PagingFactory;
import com.kh.food.customer.member.model.service.MemberService;
import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.mark.model.vo.Mark;
import com.kh.food.owner.menu.model.vo.Menu;
import com.kh.food.owner.store.model.vo.Store;
import com.kh.food.qna.model.vo.MemberQna;

@Controller
public class MemberController {

	private Logger logger = LoggerFactory.getLogger(MemberController.class);

	
	@Autowired
	BCryptPasswordEncoder pwEncoder;
	@Autowired
	MemberService service;
	@Autowired
	NoticeService ns;
	@Autowired
	private JavaMailSender mailSender;
	
	//문의글 수정
	@RequestMapping("/customer/memberQnaUpdate.do")
	public ModelAndView updateMemberQna(MemberQna mq) {
		ModelAndView mv = new ModelAndView();
		
		int result = service.updateMemberQna(mq);

		String msg="";
		String loc="/";
		if(result > 0) {
			msg="수정 성공";
			loc="/member/qnaList.do?memberId="+mq.getMemberId();
		}else {
			msg="수정실패";
			loc="/member/qnaList.do?memberId="+mq.getMemberId();
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		
		return mv;
		
		
		
	}
	
	
	
	//문의글 삭제
	@RequestMapping("/customer/deletememberQna.do")
	public ModelAndView deleteMemberQna(int no,String memberId) {
		ModelAndView mv = new ModelAndView();
		
		int result=service.deleteMemberQna(no);
		
		String msg="";
		String loc="/";
		if(result >0) {
			msg="삭제성공";
			loc="/member/qnaList.do?memberId="+memberId;
		}else {
			msg="삭제실패";
			loc="/member/qnaList.do?memberId="+memberId;
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		
		return mv;
	}
	//고객 메인페이지
	@RequestMapping("/cutomer/main")
	public String mainPage() {
		return "/food";
	}
	//나의 문의내역
	@RequestMapping("/member/qnaList.do")
	public ModelAndView memberQna(String memberId) {
		ModelAndView mv = new ModelAndView();
		

		//문의 리스트
		List<MemberQna> qnaList=service.selectmemberQna(memberId);
		// 문의 날짜 포맷 (패턴 : yyyy-MM-dd)
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				for(int i = 0; i < qnaList.size(); i++) {
					qnaList.get(i).setFormatWriteDate(df.format(qnaList.get(i).getWriteDate()));
				}		
				
		
		
		mv.addObject("qnaList",qnaList);
		mv.setViewName("customer/qnaList");
		return mv;
		
		
	}
	
	//문의내역 상세보기
	@RequestMapping("/customer/memberQnaView.do")
	public ModelAndView memberDetailQna(int no) {
		ModelAndView mv= new ModelAndView();
		
	
		MemberQna mq = service.memberDetailQna(no);
				
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		mq.setFormatWriteDate(df.format(mq.getWriteDate()));
		
		mv.addObject("mq",mq);
		mv.setViewName("customer/detailQna");
		return mv;
		
	}
	//나의주문내역
	@RequestMapping("/member/orderList.do")
	public ModelAndView memberOrderList(String memberId)
	{
		ModelAndView mv=new ModelAndView();
		
		Member member = service.selectMember(memberId);
		
		mv.addObject("member",member);
		mv.setViewName("customer/orderList");
		return mv;
	}
	
	

	
	
	//마이페이지
	@RequestMapping("/customer/mypage.do")
	public ModelAndView myPage(String memberId) {
		ModelAndView mv =new ModelAndView();

		Member member = service.selectMember(memberId);
		
		System.out.println(member);
		mv.addObject("member",member);
		mv.setViewName("customer/mypage");
		return mv;
		
	}
	
	//회원탈퇴
	@RequestMapping("/member/drop.do")
	public ModelAndView drop(String memberId,HttpSession session) {
		int result= service.drop(memberId);
		String msg="";
		String loc="";
		
		if(result>0) {
			msg="탈퇴하였습니다.";
			loc="/";
			if(session!=null)
			{
				session.invalidate();}
		}else {
			msg="탈퇴실패";
			loc="${path }";
		}
		ModelAndView mv= new ModelAndView();
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//회원정보 수정
	@RequestMapping("/member/update.do")
	public ModelAndView update(Member m, HttpServletRequest request, MultipartFile profileImg) {
		
		System.out.println(m);
		logger.debug(""+profileImg);
		//파일 업데이트
		String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/member/profile");
		
		if(!profileImg.isEmpty()) {
			//파일명 생성
			String oriFileName=profileImg.getOriginalFilename();
			
			//파일 저장하기
			try {
				profileImg.transferTo(new File(savDir+"/"+oriFileName));
			}catch(IllegalStateException |IOException e) {
				e.printStackTrace();
			}
			
			String filename=oriFileName;
			m.setProfileImage(filename);
		}
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

		
		mv.addAllObjects(map); 
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
				loc="/customer/login.do";
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
	public String memberEnrollEnd(Member m,Model mo)
	{
		
		
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
		mo.addAttribute("msg",msg);
		mo.addAttribute("loc",loc);
		return "common/msg"; 
	}
	
	
	//테스트
	
	@RequestMapping("/customer/test.do")
	public String test()
	{
		return "customer/test";
	}
	
	
	
	
	@RequestMapping("/customer/test1.do")
	public ModelAndView test1(ModelAndView mv, int businessCode)
	{
//		System.out.println(businessCode);
		List<Map<String,String>> menuCategory=service.selectCategoryList(businessCode);
		mv.addObject("businessCode", businessCode);
		mv.addObject("categoryList", menuCategory);
		mv.setViewName("customer/test1");
		return mv;
	}
	@RequestMapping("/customer/test1End.do")
	@ResponseBody
	public List test1End(ModelAndView mv, int menuCategoryCode, int businessCode) {
//		System.out.println("비즈니스코드"+businessCode);
//		System.out.println("메뉴카테고리코드"+menuCategoryCode);
		List<Map<String,String>> menuList=service.selectMenuList(menuCategoryCode, businessCode);
//		for(int i=0; i<menuList.size(); i++) {
//			System.out.println(menuList.get(i));
//		}
		return menuList;
	}
	
	
	@RequestMapping("/customer/test2.do")
	public String test2()
	{
		return "customer/test2";
	}
	
	@RequestMapping("/customer/menuSelect.do")
	@ResponseBody
	public Menu menuSelect(int menuCode) {
		
		Menu menu=service.menuSelect(menuCode);
		
		return menu;
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
	
	@RequestMapping("/customer/menuInfo.do")
	public ModelAndView infoMenu(ModelAndView mv,int businessCode)
	{
		
		List<Store> list=service.menuInfo(businessCode);
		
		mv.addObject("businessCode", businessCode);
		mv.addObject("list",list);
		mv.setViewName("customer/menuInfo");
		
		return mv;
	}
	//업체 전체보기
	@RequestMapping("/customer/selectallstore.do")
	public ModelAndView allStore(@RequestParam(value="cPage", required=false, defaultValue="0") int	cPage) {
		
		ModelAndView mv= new ModelAndView();
		int numPerPage=8;
		
		int count=service.selectMenuCount();
		
		List<Store> list =service.selectAllStore(cPage,numPerPage);
		
		mv.addObject("pageBar",PagingFactory.getPageBar(count, cPage, numPerPage, "/food/customer/selectallstore.do"));
		mv.addObject("list",list);
		mv.setViewName("customer/searchMenu");
		
		return mv;
	}
	
	@RequestMapping("/customer/menuInsert.do")
	@ResponseBody
	public Map<String, Object> menuInsert(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, 
			String menuTitle, int menuPrice, int menuCount, int plusMenuPrice, int businessCode) {
		
		System.out.println("메뉴이름 : "+menuTitle+", 가격 : "+menuPrice+", 수량 : "+menuCount+", 합계 : "+plusMenuPrice+", 사장님번호 : "+businessCode);
	    
		Map<String, Object> menuMaps=new HashMap<>();
		
		menuMaps.put("menuTitle", menuTitle);
		menuMaps.put("menuPrice", menuPrice);
		menuMaps.put("menuCount", menuCount);
		menuMaps.put("plusMenuPrice", plusMenuPrice);
		
		return menuMaps;
	}
	
	
	//아이디 찾기 이동
	@RequestMapping("customer/idSearch.do")
	public String idSearch() {
		return "customer/memberIdSearch";
	}
	
	//아이디 찾기완료
	@RequestMapping("customer/memberSearchIdEnd.do")
	public ModelAndView idSearchEnd(String memberName, String memberEmail) {
		ModelAndView mv= new ModelAndView();
		Map<String,String> map=new HashMap();
		map.put("memberName",memberName);
		map.put("memberEmail",memberEmail);
		map=service.selectSearchId(map);
		
		String msg="";
		if(map!=null)
		{
			String memberId=map.get("MEMBERID");
			msg="회원님의 아이디는 " + memberId+" 입니다." ;
		}
		else
		{
			msg="찾으시는 아이디가 없습니다";
		}
		String loc="/customer/idSearch.do";
		mv.addObject("loc",loc);
		mv.addObject("msg",msg);
		mv.setViewName("common/msg");
		return mv;
		
		
	}
	
	
	
	//비밀번호 찾기
	@RequestMapping("/customer/pwSearch.do")
	public String pwSearch() {
		return "customer/memberPwSearch";
	}

	//비밀번호 찾기완료
	@RequestMapping("customer/memberSearchPwEnd.do")
	public ModelAndView pwSearchEnd(String memberId, String memberEmail) {
		ModelAndView mv=new ModelAndView();
		Map<String,String> map=new HashMap();
		map.put("memberId",memberId);
		System.out.println("멤버이이디 받니 : "+memberId);
		map.put("memberEmail",memberEmail);
		System.out.println("멤버이메일받니 : "+memberEmail);
		Map<String,String> idAndEmail=service.selectConfirmEmail(map);
		
		
		String msg="";
		String loc="";
		char[] charSet= {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','0','1','2','3','4','5','6','7','8','9'};
		StringBuilder sb= new StringBuilder("");
		Random rn=new Random();
		
		if(idAndEmail == null)
		{
			msg="아이디 또는 이메일이 일치하지 않습니다.";
			loc="/customer/pwSearch.do";
		}
		else
		{
			//랜덤 비밀번호 생성
			for(int i=0; i<8; i++)
			{
				sb.append(charSet[rn.nextInt(charSet.length)]);
				
			}
			
			String newPw=pwEncoder.encode(sb);
			map.put("memberPw",newPw);
			System.out.println("랜덤" + newPw);
			int result=service.updatePw(map);
			
			//임시비밀번호 디비 업데이트
			if(result>0)
			{
				msg="입력하신 이메일로 임시 비밀번호가 전송되었습니다.";
				loc="/customer/login.do";
				
				String setfrom="admin";
				String tomail=memberEmail;
				String title="배달의민족 회원님의 임시 비밀번호입니다.";
				String content="임시 비밀번호는 "+sb+ " 입니다.";
				System.out.println("임시비번 : " +sb);
				try {
					MimeMessage message=mailSender.createMimeMessage();
					MimeMessageHelper messageHelper= new MimeMessageHelper(message, true, "UTF-8");
					
					messageHelper.setFrom(setfrom);
					messageHelper.setTo(tomail);
					messageHelper.setSubject(title);
					messageHelper.setText(content);
					
					mailSender.send(message);
				}

				catch(Exception e)
				{
					System.out.println(e);
				}
			}
				else
				{
					msg="비밀번호 변경 실패";
					loc="/customer/login.do";
				}
			}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//카카오 로그인
	@RequestMapping("member/kakaoMemberEnrollEnd.do")
	public ModelAndView kakaoLogin(Member m,HttpSession session)
	{
		logger.debug("카카오아이디"+m);
		
		//디비에 계정이 존재하는지 확인
		
		Map<String,String> map = new HashMap<>();
		map.put("id", m.getMemberId());
		Map<String,String> result=service.login(map);
		logger.debug("result"+result);
		String msg="";
		String loc="/";
		if(result == null)
		{
			int result1=service.memberEnroll(m);
			if(result1>0)
			{
				msg = "회원 가입 성공 로그인 성공";
			}
			else
			{
				msg = "로그인 실패";
			}
		}
		else
		{
			msg = "로그인 성공";
		}
		
		ModelAndView mv = new ModelAndView();
		session.setAttribute("logined", m.getMemberId());
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	//카카오 로그인
	@RequestMapping("member/kakaoLogin.do")
	public ModelAndView kakaoApiLogin(String memberId,String nickName,HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		logger.debug("id"+memberId);
		logger.debug("nickName"+nickName);
		String msg="";
		String loc="/";
		
		Map<String,String> map = new HashMap<>();
		map.put("id", memberId);
		map.put("nickName", nickName);
		Map<String,String> result=service.login(map);
		logger.debug("result"+result);
		//아이디가 디비에 없다? , 추가정보입력창으로 간다.
		if(result == null)
		{
			int result1 = service.kakaoLogin(map);
			if(result1>0)
			{
				Map<String,String> result2=service.login(map);
				mv.addObject("result",result2);
				mv.setViewName("customer/memberAddInfo");
				return mv;
			}

			
		}
		else
		{
			//처음에 로그인하고 추가정보 입력안하고 뒤로 가기를 누르면 ? 
			if(result.get("MEMBEREMAIL").equals(String.valueOf(0)))
			{
				//추가정보 입력 사이트로 가자.

				mv.addObject("result",result);
				mv.setViewName("customer/memberAddInfo");
				return mv;
			}
			else
			{
				session.setAttribute("logined", memberId);
				msg = "로그인 성공";
				loc = "/";
			// 있으면 바로 로그인 / 메인으로간다.
			}
		}
		mv.addObject("member",result);
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	// 카카오 로그인 추가정보 입력
	@RequestMapping("member/kakaoEnrollEnd.do")
	public ModelAndView kakaoEnrollEnd(Member m,HttpSession session)
	{
		logger.debug("m"+m);
		String msg = "";
		String loc ="/";
		
		int result = service.kakaoEnrollEnd(m);
		logger.debug("result"+result);
		if(result>0)
		{
			msg = "로그인 성공!";
			session.setAttribute("logined", m.getMemberId());
		}
		else
		{
			msg = "로그인 실패!";
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	// 회원 공지사항 리스트
	@RequestMapping("customer/memberNoticeList.do")
	public ModelAndView memberNoticeList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage=10;
		int count = ns.notCount();
		List<MemberNotice> mnList = service.selectMemberNotice(cPage,numPerPage);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < mnList.size(); i++) {
			mnList.get(i).setFormatWriteDate(df.format(mnList.get(i).getWriteDate()));
		}
		
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/customer/memberNoticeList.do"));
		mv.addObject("mnList", mnList);
		mv.setViewName("customer/memberNoticeList");
		return mv;		
	}
	
	// 회원 공지 보기
	@RequestMapping("customer/memberNoticeView.do")
	public ModelAndView memberNoticeView(int noticeNum) {
		ModelAndView mv = new ModelAndView();
		Map<String,String> map=ns.selectMemberNotice(noticeNum);
		List<Map<String,String>> attach=ns.selectAttach(noticeNum);
		mv.addObject("notice",map);
		mv.addObject("attach",attach);		
		mv.setViewName("customer/memberNoticeView");
		return mv;
	}
	
	// 찜 목록 (마이페이지)
	@RequestMapping("/member/markList.do")
	public ModelAndView markList(String memberId) {
		ModelAndView mv = new ModelAndView();		
		List<Mark> list = service.selectMarkList(memberId);
		for(Mark m : list) {
			logger.debug("" + m);
		}
		mv.addObject("list", list);
		mv.setViewName("customer/myMark");
		return mv;
	}
}
