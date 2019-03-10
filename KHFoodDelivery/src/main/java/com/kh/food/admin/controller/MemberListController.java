package com.kh.food.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.model.service.MemberListService;

@Controller
public class MemberListController {
	
	  private Logger logger=LoggerFactory.getLogger(MemberListController.class);
	  
	  
	  @Autowired
	  MemberListService service;
	  
	  
	  //회원리스트
	  @RequestMapping("/admin/memberList.do")
	  public ModelAndView memberList() {
	  ModelAndView mv=new ModelAndView();
	  List<Map<String,String>> list=service.selectListMember();
	  mv.addObject("list",list);
	  mv.setViewName("admin/memberList"); 
	  return mv; 
	  }
	 
	
	  /*//회원 삭제
	  @RequestMapping("/admin/memberList.do")
	  public String memberDel(int memberNum) {
		  int result=service.memberDel(memberNum);
		  return "redirect:/admin/memberList.do";
	  }*/
	  
	  //회원 상세 정보
	  @RequestMapping("/admin/memberOne.do")
	  @ResponseBody
	  public Map memberListModal(int memberNum) {
		 ModelAndView mv=new ModelAndView();
		 Map<String,String> memMo=service.memberOne(memberNum);	
		 return memMo;
		 }
	  
	  
	  
	  
	  //사장님리스트
	  @RequestMapping("/admin/ownerList.do")
	  public ModelAndView ownerList() {
		 ModelAndView mv=new ModelAndView();
		 List<Map<String,String>> list=service.selectListOwner();
		 mv.addObject("list",list);
		 mv.setViewName("admin/ownerList");
		 return mv;
	  }
	  
	//사장 상세 정보
	  @RequestMapping("admin/ownerOne.do")
	  @ResponseBody
	  public Map ownerListModal(String ownerId){
		  ModelAndView mv=new ModelAndView();
		  Map<String,String> ownMo=service.ownerOne(ownerId);
		  return ownMo;
	  }
	  
}
