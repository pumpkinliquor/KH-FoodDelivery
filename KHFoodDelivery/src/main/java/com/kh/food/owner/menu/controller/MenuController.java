package com.kh.food.owner.menu.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.menu.model.service.MenuService;
import com.kh.food.owner.menu.model.vo.Menu;
import com.kh.food.owner.order.model.service.OrderService;

@Controller
public class MenuController {

	private Logger logger = LoggerFactory.getLogger(MenuController.class);
	@Autowired
	MenuService service;
	
	@Autowired
	OrderService orderService;
	
	//메뉴관리 가게 선택 화면진입
	@RequestMapping("owner/menuStoreChoice.do")
	public ModelAndView menuStoreChoice(String ownerId)
	{
		List<Map<String,String>> storeList = orderService.selectStoreList(ownerId);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("storeList",storeList);
		mv.setViewName("owner/menuStoreChoice1");
		return mv;
	}
	
	//메뉴 등록 화면 진입
	@RequestMapping("/owner/menuEnroll.do")
	public ModelAndView menuEnroll(String businessCode)
	{	
		
		ModelAndView mv = new ModelAndView();
		List<Map<String,String>> category = service.selectMenuCategory(businessCode);
		logger.debug("category"+category);
		mv.addObject("businessCode",businessCode);
		mv.addObject("category",category);
		mv.setViewName("owner/menuEnroll");
		return mv;
	}
	
	//메뉴 관리 화면 진입
	@RequestMapping("/owner/menuManage.do")
	public ModelAndView menuManage(String businessCode)
	{
		logger.debug("진입했니?");
		ModelAndView mv = new ModelAndView();
		List<Map<String,String>> category = service.selectMenuCategory(businessCode);
		List<Map<String,String>> menuList = service.selectMenuList(businessCode);
//		logger.debug("카테고리리스트"+category);
//		logger.debug("메뉴리스트"+menuList);
		mv.addObject("businessCode",businessCode);
		mv.addObject("menuList",menuList);
		mv.addObject("category",category);
		mv.setViewName("owner/menuManage");
		return mv;
		
	}
	
	//메뉴 품절 화면 진입
	@RequestMapping("/owner/menuSoldOut.do")
	public ModelAndView menuSoldOut(String businessCode)
	{
		ModelAndView mv = new ModelAndView();
		List<Map<String,String>> category = service.selectMenuCategory(businessCode);
		List<Map<String,String>> menuList = service.selectMenuList(businessCode);
		
		/*logger.debug("메뉴리스트"+menuList);*/
		mv.addObject("businessCode",businessCode);
		mv.addObject("menuList",menuList);
		mv.addObject("category",category);
		mv.setViewName("owner/menuSoldOut");
		return mv;
	}
	
	//카테고리 등록
	@RequestMapping("/owner/enrollCategory.do")
	public ModelAndView enrollCategory(String menuCategory)
	{
		/*logger.debug("메뉴카테고리"+menuCategory);*/
		Map<String,String> map = new HashMap();
		map.put("menuCategory", menuCategory);
		ModelAndView mv = new ModelAndView();
		int result = service.enrollCategory(map);
		String msg = "";
		String loc = "/owner/menuEnroll.do";
		if(result > 0)
		{
			msg = "카테고리 등록 성공!";
		}
		else
		{
			msg = "카테고리 등록 실패!";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	//메뉴 등록
	@RequestMapping("/owner/enrollMenu1.do")
	public ModelAndView insertMenu1(String menuName,String menuCategoryCode, String menuPrice, String menuContent,MultipartFile menuImage,HttpServletRequest request)
	{
		
		ModelAndView mv = new ModelAndView();
		String saveDir = request.getSession().getServletContext().getRealPath("/resources/upload/owner/menu");
		logger.debug("파일이름"+menuImage.getOriginalFilename());
		
		Map<String,String> map = new HashMap<>();
		map.put("menuName", menuName);
		map.put("menuCategoryCode", menuCategoryCode);
		map.put("menuPrice", menuPrice);
		map.put("menuContent", menuContent);
		
		String orifileName = menuImage.getOriginalFilename();
		if(!menuImage.isEmpty())
		{
			//파일명을 생성
			String ext = orifileName.substring(orifileName.lastIndexOf("."));
			//rename 규칙 설정
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdv = (int)(Math.random()*1000);
			String reName = sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
			
			//파일저장하기
			try
			{
				menuImage.transferTo(new File(saveDir+"/"+reName));
				logger.debug("들어왔냐?");
			}catch(IllegalStateException | IOException e)
			{
				e.printStackTrace();
			}
				
			map.put("menuImage", reName);
		}
		
		String msg="";
		String loc="/owner/menuEnroll.do";
		
		int result = service.insertMenu(map);
		if(result > 0)
		{
			msg = "메뉴 등록 성공!";
		}
		else
		{
			msg = "메뉴 등록 실패!";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//카테고리삭제
	@RequestMapping("/menu/deleteCategory.do")
	public ModelAndView deleteCategory(String menuCategory)
	{	
		/*logger.debug("카테고리삭제");*/
//		logger.debug("메뉴카테고리명"+menuCategory);
		ModelAndView mv = new ModelAndView();
		String msg ="";
		String loc = "/owner/menuManage.do";
		
		int result = service.deleteCategory(menuCategory);
		if(result>0)
		{
			msg = " 삭제성공";
		}
		else
		{
			msg = "삭제 실패";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	//메뉴 가격 수정
	@RequestMapping("menu/updateMenuPrice.do")
	public ModelAndView updateMenuPrice(int menuPrice,int menuCode)
	{
//		logger.debug("메뉴가격"+menuPrice);
		ModelAndView mv = new ModelAndView();
		String msg = "";
		String loc = "/owner/menuManage.do";
		Map<String,String> map = new HashMap<>();
		map.put("menuPrice", String.valueOf(menuPrice));
		map.put("menuCode",String.valueOf(menuCode));
				
		int result = service.updateMenuPrice(map);
		if(result >0)
		{
			msg="수정 성공";
		}
		else
		{
			msg="수정 실패";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
		
	}
	
	//메뉴삭제
	@RequestMapping("menu/deleteMenu.do")
	public ModelAndView deleteMenu(String menuCode)
	{
		ModelAndView mv = new ModelAndView();
		logger.debug("삭제할메뉴코드"+menuCode);
		String msg = "";
		String loc = "/owner/menuManage.do";
		int result = service.deleteMenu(menuCode);
		if(result > 0 )
		{
			msg = "삭제 성공";
		}
		else
		{
			msg = "삭제 실패";
		}
		
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//메뉴 하나 가져오기
	@RequestMapping("owner/selectOneMenu.do")
	@ResponseBody
	public Map selectOneMenu(String menuCode)
	{
//		logger.debug("메뉴하나 가져왔니?" + menuCode);
		Map menu = service.selectOneMenu(menuCode);
//		logger.debug("menu"+menu);
		return menu;
	}
	
	//메뉴 수정 하기
	@RequestMapping("owner/updateMenu.do")
	public ModelAndView updateMenu(Menu m)
	{
		ModelAndView mv = new ModelAndView();
		logger.debug("메뉴수정" + m);
		String msg = "";
		String loc = "/owner/menuManage.do";
		
		
		int result = service.updateMenu(m);
		if(result > 0)
		{
			msg = "수정 성공";
		}
		else
		{
			msg = "수정 실패";
		}
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		return mv;
	}
	
	//메뉴 품절 시키기
	@RequestMapping("menu/updateMenuSoldOut.do")
	public void updateMenuSoldOut(String menuCode,HttpServletResponse response) throws IOException
	{
		int result = service.updateMenuSoldOut(menuCode);
		response.getWriter().print(result);
	}
	
	//메뉴 품절 취소 시키기
	@RequestMapping("menu/updateCancelSoldOut.do")
	public void updateCancleSoldOut(String menuCode ,HttpServletResponse response) throws IOException 
	{
		int result = service.updateCancleSoldOut(menuCode);
		response.getWriter().print(result);
	}
}
