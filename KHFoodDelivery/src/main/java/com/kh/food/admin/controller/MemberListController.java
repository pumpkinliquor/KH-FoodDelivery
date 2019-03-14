package com.kh.food.admin.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.model.service.MemberListService;
import com.kh.food.common.PagingFactory;

@Controller
public class MemberListController {
	
	  private Logger logger=LoggerFactory.getLogger(MemberListController.class);
	  
	  
	  @Autowired
	  MemberListService service;
	  
	  
	  //회원리스트
	  @RequestMapping("/admin/memberList.do")
	  public ModelAndView memberList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
	  ModelAndView mv=new ModelAndView();
	  int numPerPage=10;
		
		int count = service.memCount();
	  List<Map<String,String>> list=service.selectListMember();
	  mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/admin/memberList.do"));
	  mv.addObject("list",list);
	  mv.setViewName("admin/memberList"); 
	  return mv; 
	  }
	 
	
	  //회원 삭제
	  @RequestMapping("/admin/memDel.do")
	  public String memberDel(HttpServletRequest request) {
		  String[] rowCheck=request.getParameterValues("rowCheck");
		  service.memberDel(rowCheck);
		/* int result=service.memberDel(memberNum); */
		  return "redirect:/admin/memberList.do";
	  }
	  
	  //회원 상세 정보
	  @RequestMapping("/admin/memberOne.do")
	  @ResponseBody
	  public Map memberListModal(int memberNum) {
		 ModelAndView mv=new ModelAndView();
		 Map<String,String> memMo=service.memberOne(memberNum);	
		 SimpleDateFormat sdf=new SimpleDateFormat();
		 
		 String memberEnrollDate=String.valueOf(memMo.get("MEMBERENROLLDATE"));
		 String memberEnrollDateSubStr=memberEnrollDate.substring(0, 10);
		 memMo.put("MEMBERENROLLDATE",memberEnrollDateSubStr);
		 
		 return memMo;
		 }
	  
	  
	  
	  
	  //사장님리스트
	  @RequestMapping("/admin/ownerList.do")
	  public ModelAndView ownerList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		int numPerPage=10;
		int count = service.ownCount();
		ModelAndView mv=new ModelAndView();
		List<Map<String,String>> list=service.selectListOwner();
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/admin/ownerList.do"));
		mv.addObject("list",list);
		mv.setViewName("admin/ownerList");
		return mv;
	  }
	  
	//사장 상세 정보
	  @RequestMapping("admin/ownerOne.do")
	  @ResponseBody
	  public Map ownerListModal(int businessCode){
		  ModelAndView mv=new ModelAndView();
		  Map<String,String> ownMo=service.ownerOne(businessCode);
		  return ownMo;
	  }
	  
	  //사장 삭제
	  @RequestMapping("/admin/ownDel.do")
	  public String ownerDel(HttpServletRequest request) {
		  String[] rowCheck= request.getParameterValues("rowCheck");
		  service.ownerDel(rowCheck);
		  return "redirect:/admin/ownerList.do";
	  }
}
