package com.kh.food.owner.store.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.kh.food.owner.custom.model.service.CustomerService;

@Controller
public class StoreController {

	@Autowired
	CustomerService service;

	@RequestMapping("/owner/storeForm.do")
	public String storeForm() {
		return "owner/storeForm";
	}
	
	@RequestMapping("/owner/storeFormEnd.do")
	public ModelAndView storeFormEnd(HttpServletRequest request, HttpServletResponse response, ModelAndView mv, String businessName, String businessPhone, String businessNum, 
			String storeCategory, String storeName, String storePhone, String frontAddress, String backAddress, int minPrice, String storeProfile,String deliveryPrice ,MultipartFile storeImage,
			String lat, String lng) {
			Map<String,Object> store=new HashMap<String,Object>();
			String ownerId=(String) request.getSession().getAttribute("ownerId");
			String storeAddress=frontAddress+" "+backAddress;
			BigDecimal lat1 = new BigDecimal(lat);
			BigDecimal lng1 = new BigDecimal(lng);
			System.out.println("" + lat1);
			System.out.println("" + lng1);
			store.put("ownerId", ownerId);
			store.put("businessNum", businessNum);
			store.put("businessName", businessName);
			store.put("businessPhone", businessPhone);
			store.put("storeName", storeName);
			store.put("storePhone", storePhone);
			store.put("storeAddress", storeAddress);
			store.put("storeCategory", storeCategory);
			store.put("minPrice", minPrice);
			store.put("storeProfile", storeProfile);
			store.put("deliveryPrice", deliveryPrice);
			store.put("lat", lat1);
			store.put("lng", lng1);
//			System.out.println(storeAddress);
			String saveDir=request.getSession().getServletContext().getRealPath("resources/upload/owner/storeMainImage");
			
			
			if(!storeImage.isEmpty()) {
				//파일명을 생성
				String oriFileName=storeImage.getOriginalFilename();
				String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
				//rename 규칙 설정
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rdv = (int)(Math.random()*1000);
				String reName = sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				try {
					storeImage.transferTo(new File(saveDir+"/"+reName));
				}
				catch(IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				store.put("reName",reName);
			}
			else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = null;
				try {
					out=response.getWriter();
				}
				catch (NullPointerException e) {
					e.printStackTrace();
				}
				catch (FileNotFoundException e) {
					e.printStackTrace();
				}
				catch (IOException e) {
					e.printStackTrace();
				}
				out.println("<script>alert('이미지를 넣지 않으셨습니다! 이미지를 넣어주세요.'); history.go(-1);</script>");
			}
			
			int result=service.storeFormEnd(store);
			
			String msg="";
			String loc="/owner/storeForm.do";
			
			if(result>0) {
				msg="업체 등록 신청을 완료하였습니다.";
			}
			else {
				msg="업체 등록 신청을 실패하였습니다.";
			}
			
			mv.addObject("msg", msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			
		return mv;
	}

	// 가게 즐겨찾기 추가 / 삭제
	@RequestMapping("/store/markStore.do")
	public ModelAndView markStore(@RequestParam("isMark") int isMark, @RequestParam("bsCode") int bsCode,
									HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		String memberId=(String) request.getSession().getAttribute("logined");
		
		Map<String, Object> map = new HashMap();
		map.put("businessCode", bsCode);
		map.put("memberId", memberId);
		
		if(isMark == 0) {	// 찜 등록
			service.insertMark(map);
		} else {			// 찜 삭제
			service.deleteMark(map);
		}
		
		mv.setView(new RedirectView("/food/customer/menuInfo.do?businessCode="+bsCode));
		return mv;
	}	
}
