package com.kh.food.owner.onevsone.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.onevsone.model.service.OnevsOneService;
import com.kh.food.owner.onevsone.model.vo.OwnerQna;

@Controller
public class OnevsOneController {

	@Autowired
	OnevsOneService service;
	
	@RequestMapping("/owner/oneVSoneList.do")
	public ModelAndView oneVSoneList(ModelAndView mv) {
		
		List<Map<String,String>> oneVSoneList=service.oneVSoneList();
		
		mv.addObject("oneVSoneList", oneVSoneList);
		mv.setViewName("owner/oneVSoneList");
		return mv;
	}
	
	@RequestMapping("/owner/oneVSoneQ.do")
	public ModelAndView oneVSoneQ(String ownerId) {
		ModelAndView mv=new ModelAndView();
		
		int ownerNum=service.selectOwnerForm(ownerId);
		
		mv.addObject("ownerNum", ownerNum);
		
//		System.out.println(ownerNum);
		
		mv.setViewName("owner/oneVSoneForm");
		
		return mv;
	}
	
	@RequestMapping("/owner/oneVSoneFormEnd.do")
	public ModelAndView oneVSoneFormEnd(HttpServletRequest request, String ownerId, int ownerNum, String qnaCategory, String qnaTitle, String qnaContent, MultipartFile[] upFile) {
		
		ModelAndView mv=new ModelAndView();
		
		Map<String,Object> qna=new HashMap<String,Object>();
		qna.put("ownerId", ownerId);
		qna.put("ownerNum", ownerNum);
		qna.put("qnaCategory", qnaCategory);
		qna.put("qnaTitle", qnaTitle);
		qna.put("qnaContent", qnaContent);
		ArrayList<OwnerQna> files=new ArrayList<OwnerQna>();
		
		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/ownerQna");
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) { //파일이 비어있지 않을때
				//파일명을 생성(rename)
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf(".")); //확장자까지
				//rename규칙을 설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int randomV=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+randomV+ext;
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}
				catch(IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				OwnerQna oq=new OwnerQna();
				oq.setReNamedFileName(reName);
				oq.setOriginalFileName(oriFileName);
				files.add(oq);
			}
			qna.put("files", files);
		}
		
		int result=service.qnaFormEnd(qna);
		
		String msg="";
		String loc="/owner/oneVSoneList.do";
		
		if(result>0) {
			msg="성공";
		}
		else {
			msg="실패";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc", loc);
		
		mv.setViewName("common/msg");
		
		return mv;
		
	}
	
	@RequestMapping("/owner/myOneVSone.do")
	public ModelAndView myOneVSone(String ownerId, ModelAndView mv) {
		
//		System.out.println(ownerId);
		
		List<Map<String,String>> myQnaList=service.myQnaList(ownerId);
		
//		System.out.println(myQnaList);
		
		mv.addObject("myQnaList", myQnaList);
		mv.setViewName("owner/myQna");
		return mv;
	}
	
	@RequestMapping("/owner/oneVSoneView.do")
	public ModelAndView oneVSoneView(int qnaCode, ModelAndView mv) {
		
		Map<String,String> views=service.oneVSoneView(qnaCode);
		
		mv.addObject("views", views);
		
		mv.setViewName("owner/oneVSoneView");
		return mv;
	}
	
}
