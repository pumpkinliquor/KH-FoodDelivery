package com.kh.food.admin.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.model.service.AppStoreService;
import com.kh.food.common.PagingFactory;
import com.kh.food.owner.member.controller.OwnerMemberController;
import com.kh.food.owner.store.model.vo.Store;


@Controller
public class AppStoreController {

	private Logger logger = LoggerFactory.getLogger(AppStoreController.class);
	
	@Autowired
	AppStoreService service;

	// 입점 신청 리스트
	@RequestMapping("/admin/appStoreList.do")
	public ModelAndView appStoreList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		
		ModelAndView mv = new ModelAndView();
		int numPerPage=10;
		int count = service.appStoreCount();
		
		List<Store> appStoreList = service.selectAppStoreList(cPage,numPerPage);
		
		// 입점 신청 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i = 0; i < appStoreList.size(); i++) {
			appStoreList.get(i).setFormatAppDate(df.format(appStoreList.get(i).getAppDate()));
		}
		
		mv.addObject("appStoreList", appStoreList);
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/admin/appStoreList.do"));
		mv.setViewName("admin/appStoreList");		
		return mv;
		
	}
	
	
	// 입점 신청 정보 JSON 반환
	@RequestMapping("/admin/selectAppStore.do")
	@ResponseBody
	public Store selectAppStore(@RequestParam("no") int no) {	
		
		Store store = service.selectAppStore(no);				
		
		// 입점 신청 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");		
		store.setFormatAppDate(df.format(store.getAppDate()));
			
		return store;
	}
	
	// 입점 승인
	@RequestMapping("/admin/confirmApp.do")
	public ModelAndView updateStoreConfirm(@RequestParam("no") int no) {
		ModelAndView mv = new ModelAndView();
		int result = service.updateStoreConfirm(no);
		String msg = "";
		String loc = "/admin/appStoreList.do";
		if (result > 0) {
			msg = "승인 완료!";
		}
		else {
			msg = "승인 실패...";
		}
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	// 전체 입점 리스트
	@RequestMapping("/admin/storeList.do")
	public ModelAndView storeList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		int numPerPage=10;
		int count = service.appStoreCount();
		List<Store> list = service.selectStoreList(cPage, numPerPage);
		
		// 입점 신청 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setFormatAppDate(df.format(list.get(i).getAppDate()));
		}
		
		mv.addObject("list", list);
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/admin/appStoreList.do"));
		mv.setViewName("/admin/storeList");
		return mv;
	}
	
	// 입점 검색
	@RequestMapping("/admin/searchStore.do")
	public ModelAndView searchStore(@RequestParam(value="keyword", defaultValue="") String keyword,
									@RequestParam(value="category", defaultValue="전체") String category,
									@RequestParam(value="isFirst", defaultValue="0") int isFirst,
									@RequestParam(value="cPage", required=false, defaultValue="0") int cPage,
									HttpSession session) {
		ModelAndView mv = new ModelAndView();
		int numPerPage = 5;
		
		Map map = new HashMap();
		if(isFirst == 1) {						// 처음 검색했을 때 map 객체 안에 조건 저장	
			map.put("keyword", keyword);
			map.put("category", category);
			session.setAttribute("map", map);	// 맵을 세션에 저장
		} else {								
			map = (Map)session.getAttribute("map");		// 검색 후 페이징 했을 땐 세션에서 조건을 가져옴
		}
		
		List<Store> list = service.selectSearchStore(map, cPage, numPerPage);
		int count = service.selectSearchStoreCount((Map)session.getAttribute("map"));
		// 날짜 포맷 (패턴 : yyyy-MM-dd)
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < list.size(); i++) {
			list.get(i).setFormatAppDate(df.format(list.get(i).getAppDate()));
		}
		
		mv.addObject("list", list);
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/admin/searchStore.do"));
		mv.setViewName("/admin/storeList");
		return mv;
	}
}