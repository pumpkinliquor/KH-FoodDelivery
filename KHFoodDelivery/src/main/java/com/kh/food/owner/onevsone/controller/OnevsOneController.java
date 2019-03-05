package com.kh.food.owner.onevsone.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.onevsone.model.service.OnevsOneService;
import com.kh.food.owner.onevsone.model.vo.OwnerQnaReview;

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
	
//	@RequestMapping("/owner/oneVSoneFormEnd.do")
//	public ModelAndView oneVSoneFormEnd(HttpServletRequest request, String ownerId, String qnaCategory, String qnaTitle, String qnaContent, MultipartFile[] upFile) {
//		
//		ModelAndView mv=new ModelAndView();
//		
//		Map<String,Object> qna=new HashMap<String,Object>();
//		int ownerNum=2;
//		ArrayList<OwnerQna> files=new ArrayList<OwnerQna>();
//		
//		
//		String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/ownerQna");
//		
//		for(MultipartFile f : upFile) {
//			if(!f.isEmpty()) { //파일이 비어있지 않을때
//				//파일명을 생성(rename)
//				String originalFileName=f.getOriginalFilename();
//				String ext=originalFileName.substring(originalFileName.lastIndexOf(".")); //확장자까지
//				//rename규칙을 설정
//				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
//				int randomV=(int)(Math.random()*1000);
//				String reNamedFileName=sdf.format(System.currentTimeMillis())+"_"+randomV+ext;
//				try {
//					f.transferTo(new File(saveDir+"/"+reNamedFileName));
//				}
//				catch(IllegalStateException | IOException e) {
//					e.printStackTrace();
//				}
//				OwnerQna oq=new OwnerQna();
//				oq.setReNamedFileName(reNamedFileName);
//				oq.setOriginalFileName(originalFileName);
//				files.add(oq);
//			}
//		}
//		
//		qna.put("id", ownerId);
//		qna.put("num", ownerNum);
//		qna.put("category", qnaCategory);
//		qna.put("title", qnaTitle);
//		qna.put("content", qnaContent);
//		qna.put("files", files);
//		
//		System.out.println(qna);
//		
//		int result=service.qnaFormEnd(qna);
//		
//		String msg="";
//		String loc="/owner/oneVSoneList.do";
//		
//		if(result>0) {
//			msg="성공";
//		}
//		else {
//			msg="실패";
//		}
//		
//		mv.addObject("msg", msg);
//		mv.addObject("loc", loc);
//		
//		mv.setViewName("common/msg");
//		
//		return mv;
//		
//	}
	
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
		List<Map<String,String>> commentList=service.commentList(qnaCode);
		
		mv.addObject("views", views);
		mv.addObject("commentList", commentList);
		
		mv.setViewName("owner/oneVSoneView");
		return mv;
	}
	
	@RequestMapping("/owner/qnaSearch.do")
	public ModelAndView qnaSearch(HttpServletRequest request, ModelAndView mv, String qnaCategory, String keyword) {
		
		Map<String,String> map=new HashMap<String,String>();
		map.put("qnaCategory", qnaCategory);
		map.put("keyword", keyword);
		
		List<Map<String,String>> oneVSoneList=service.qnaSearch(map);
		
		mv.addObject("oneVSoneList", oneVSoneList);
		mv.setViewName("owner/oneVSoneList");
		
		return mv;
	}
	
	@RequestMapping("/owner/qnaReviewForm.do")
	public ModelAndView qnaReviewForm(ModelAndView mv, int qnaCode, int ownerNum, String reviewContext) throws Exception{
		System.out.println(qnaCode+ownerNum+reviewContext);
		
		
		OwnerQnaReview oqr=new OwnerQnaReview(0,qnaCode,ownerNum,null,reviewContext);
		
		int result=service.qnaReviewForm(oqr);
		
		String msg="";
		String loc="/owner/oneVSoneView.do?qnaCode="+qnaCode;
		
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
	
	@RequestMapping("/owner/reviewUpdate.do")
	public ModelAndView qnaReviewUpdate(ModelAndView mv,int qnaCode, int reQnaReviewCode, String updateContext) {
		Map<String,Object> reviewUp=new HashMap<String, Object>();
		reviewUp.put("reQnaReviewCode", reQnaReviewCode);
		reviewUp.put("updateContext", updateContext);
		
//		System.out.println(qnaCode);
//		System.out.println(reviewUp);
		
		int result=service.qnaReviewUpdate(reviewUp);
		
		String msg="";
		String loc="/owner/oneVSoneView.do?qnaCode="+qnaCode;
		
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
	
	@RequestMapping("/owner/reviewDelete.do")
	public ModelAndView qnaReviewDelete(ModelAndView mv, int qnaCode, int qnaReviewCode) {

		int result=service.qnaReviewDelete(qnaReviewCode);
		
		String msg="";
		String loc="/owner/oneVSoneView.do?qnaCode="+qnaCode;
		
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
}
