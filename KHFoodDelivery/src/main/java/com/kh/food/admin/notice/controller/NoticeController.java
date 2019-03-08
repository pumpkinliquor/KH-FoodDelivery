package com.kh.food.admin.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.controller.MemberListController;
import com.kh.food.admin.notice.attachment.vo.NoticeAttachment;
import com.kh.food.admin.notice.model.service.NoticeService;

@Controller
public class NoticeController {

	private Logger logger=LoggerFactory.getLogger(NoticeController.class);
	@Autowired
	NoticeService service;
	
	//회원 공지사항리스트
	@RequestMapping("/admin/memberNoticeList.do")
	public ModelAndView memberNoticeList()
	{
		ModelAndView mv=new ModelAndView();
		List<Map<String,String>>list=service.selectMemberNoticeList();
		mv.addObject("list",list);
		mv.setViewName("admin/memberNoticeList");
		return mv;
	}
	
	//회원공지사항 뷰
		@RequestMapping("/admin/noticeView.do")
		public ModelAndView noticeView(int noticeNum) {
			ModelAndView mv=new ModelAndView();
			Map<String,String> map=service.selectMemberNotice(noticeNum);
			mv.addObject("notice",map);
			mv.setViewName("admin/noticeView");
			return mv;
		}
	
	
		
	
	//회원공지사항 글쓰기페이지 이동
	@RequestMapping("/admin/noticeForm.do")
	public String noticeInsert() {
		return "admin/noticeForm";
	}
	
	//회원공지사항 글쓰기 완료
	@RequestMapping("/admin/noticeFormEnd.do")
	public String noticeFormEnd(String noticeTitle, String noticeContent, MultipartFile[] upFile, HttpServletRequest request) {
		Map<String,String> notice=new HashMap();
		notice.put("noticeTitle", noticeTitle);
		notice.put("noticeContent", noticeContent);
		ArrayList<NoticeAttachment> files= new ArrayList();
		String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/notice");
		for(MultipartFile f:upFile)
		{
			if(!f.isEmpty()) {
				//파일명 생성하기(rename)
				String orifileName=f.getOriginalFilename();
				String ext=orifileName.substring(orifileName.lastIndexOf("."));
				//rename 규칙설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rdv=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				
				//파일저장하기
				try {
					f.transferTo(new File(savDir+"/"+reName));
					
				}catch(IllegalStateException | IOException e)
				{
					e.printStackTrace();
				}
				NoticeAttachment att=new NoticeAttachment();
				att.setRenamedFileName(reName);
				att.setOriginalFileName(orifileName);
				files.add(att);
			}
		}
		int result=service.insertMemberNotice(notice,files);
		String msg="";
		if(result>0) {
			msg="성공";
			
		}else {
			msg="실패";
		}
		System.out.println(result);
		return "redirect:/admin/memberNoticeList.do";
	}
	
	
	//회원공지사항 수정폼이동
		@RequestMapping("/admin/memNoticeUpdate.do")
		public String noticeUpdate(int noticeNum) {
			int result=service.updateNotice(noticeNum);
			return "admin/noticeForm";
		}
		
		
		//회원공지사항 삭제
		@RequestMapping("/admin/memberNoticeDel.do")
		public String noticeDel(int noticeNum) {
			int result=service.deleteMemberNotice(noticeNum);
			return "redirect:memberNoticeList.do";
		}
	
	
	
	
	
	
	
	
	
	
	
	
	//사장님 공지사항 리스트
	
	
	
	/*@RequestMapping("/admin/ownerNoticeList.do")
	public String ownerNoticeList() {
		return "admin/ownerNoticeList";
	}*/
	
}
