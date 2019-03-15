package com.kh.food.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.model.service.AppStoreService;
import com.kh.food.admin.model.service.QnaMngService;
import com.kh.food.owner.store.model.vo.Store;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.OwnerQna;

@Controller
public class AdminController {

	@Autowired
	AppStoreService storeService;
	@Autowired
	QnaMngService qnaService;
	
	@RequestMapping("/admin/adminMain.do")
	public ModelAndView admainMainView() {
		ModelAndView mv = new ModelAndView();		
		
		List<Store> storeList = storeService.selectAppStoreList();
		List<MemberQna> mqList = qnaService.selectMemberQnaList();
		List<OwnerQna> oqList = qnaService.selectOwnerQnaList();
		
		mv.addObject("storeList", storeList);
		mv.addObject("mqList", mqList);
		mv.addObject("oqList", oqList);
		mv.setViewName("admin/adminMain");
		return mv;
	}
}
