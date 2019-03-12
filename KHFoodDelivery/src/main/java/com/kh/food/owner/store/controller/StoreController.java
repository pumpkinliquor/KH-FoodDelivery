package com.kh.food.owner.store.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
	public ModelAndView storeFormEnd(HttpServletRequest request, ModelAndView mv, String businessName, String businessPhone, String businessNum, 
			String storeCategory, String storeName, String storePhone, String frontAddress, String backAddress, int minPrice, String storeProfile, MultipartFile storeImage) {
			Map<String,Object> store=new HashMap<String,Object>();
			String ownerId=(String) request.getSession().getAttribute("ownerId");
			String storeAddress=frontAddress+" "+backAddress;
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
//			System.out.println(storeAddress);
			String saveDir=request.getSession().getServletContext().getRealPath("resources/upload/owner/storeMainImage");
			
			if(!storeImage.isEmpty()) {
				String oriFileName=storeImage.getOriginalFilename();
				try {
					storeImage.transferTo(new File(saveDir+"/"+oriFileName));
				}
				catch(IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				String oriImageName=oriFileName;
				store.put("oriImageName",oriImageName);
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

	
}
