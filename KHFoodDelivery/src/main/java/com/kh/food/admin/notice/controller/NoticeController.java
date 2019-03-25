package com.kh.food.admin.notice.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.kh.food.admin.notice.attachment.vo.NoticeAttachment;
import com.kh.food.admin.notice.model.service.NoticeService;
import com.kh.food.common.PagingFactory;

@Controller
public class NoticeController {

	private Logger logger=LoggerFactory.getLogger(NoticeController.class);
	@Autowired
	NoticeService service;
	
	//회원 공지사항리스트
	@RequestMapping("/admin/memberNoticeList.do")
	public ModelAndView memberNoticeList(@RequestParam(value="cPage", required=false, defaultValue="0") int cPage)
	{
		int numPerPage=10;
		ModelAndView mv=new ModelAndView();
		int count = service.notCount();
		List<Map<String,String>>list=service.selectMemberNoticeList(cPage,numPerPage);
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/admin/memberNoticeList.do"));
		mv.addObject("list",list);
		mv.setViewName("admin/memberNoticeList");
		return mv;
	}
	
	//회원공지사항 뷰
		@RequestMapping("/admin/memberNoticeView.do")
		public ModelAndView noticeView(int noticeNum) {
			ModelAndView mv=new ModelAndView();
			Map<String,String> map=service.selectMemberNotice(noticeNum);
			List<Map<String,String>> attach=service.selectAttach(noticeNum);
			mv.addObject("notice",map);
			mv.addObject("attach",attach);
			mv.setViewName("admin/memberNoticeView");
			return mv;
		}
	
	
		
	
	//회원공지사항 글쓰기페이지 이동
	@RequestMapping("/admin/memberNoticeForm.do")
	public String noticeInsert() {
		return "admin/memberNoticeForm";
	}
	
	//회원공지사항 글쓰기 완료
	@RequestMapping("/admin/memberNoticeFormEnd.do")
	public ModelAndView noticeFormEnd(String noticeTitle, String noticeContent, MultipartFile[] upFile, HttpServletRequest request) {
		ModelAndView mv=new ModelAndView();
		Map<String,String> notice=new HashMap();
		notice.put("noticeTitle", noticeTitle);
		notice.put("noticeContent", noticeContent);
		ArrayList<NoticeAttachment> files= new ArrayList();
		String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/member/notAttach");
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
		System.out.println(result+" : controllerresult");
		String loc="/admin/memberNoticeList.do";
		String msg="";
		if(result>0) {
			msg="글 등록이 완료되었습니다.";
			
		}else {
			msg="실패";
		}
		mv.addObject("loc", loc);
		mv.addObject("msg", msg);
		
		mv.setViewName("common/msg");
		return mv;
	}
	
	
	//파일다운로드
	@RequestMapping("/admin/memberfileDownLoad.do")
	public void fileDownLoad(String oriName, String reName, HttpServletRequest request, HttpServletResponse response) {
		BufferedInputStream bis=null;
		ServletOutputStream sos=null;
		boolean fileCheck=true;
		String dir=request.getSession().getServletContext().getRealPath("resources/upload/member/notAttach");
		File savedFile=new File(dir+"/"+reName); //경로
		try {
			FileInputStream fis=new FileInputStream(savedFile);
			bis=new BufferedInputStream(fis);
			sos=response.getOutputStream();
			String resFileName=""; //파일명처리하기 (인코딩)
			boolean isMSIE=request.getHeader("user-agent").indexOf("MSIE")!=-1||request.getHeader("user-agent").indexOf("Trident")!=-1;
			if(isMSIE) {
				resFileName=URLEncoder.encode(oriName, "UTF-8");
				resFileName=resFileName.replaceAll("\\+", "%20");
			}
			else {
				resFileName=new String(oriName.getBytes("UTF-8"), "ISO-8859-1"); //이렇게 해야 한글이 안깨짐
			}
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader("Content-Disposition", "attachment;filename=\""+resFileName+"\"");
			response.setContentLength((int)savedFile.length()); //파일길이설정
			
			int read=0;
			while((read=bis.read())!=-1) {
				sos.write(read);
			}
		}
		catch (FileNotFoundException e) {
			fileCheck=false;
			e.printStackTrace();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
		catch (NullPointerException e) {
			fileCheck=false;
			e.printStackTrace();
		}
		finally {
			try {
				sos.close();
				bis.close();
			}
			catch (FileNotFoundException e) {
				fileCheck=false;
				e.printStackTrace();
			}
			catch (IOException e) {
				e.printStackTrace();
			}
			catch (NullPointerException e) {
				fileCheck=false;
				e.printStackTrace();
			}
		}
		if(fileCheck==false) {
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
			out.println("<script>alert('선택 하신 파일을 찾을 수 없습니다.'); history.go(-1);</script>");
		}
	}
	
	
	
	
	
	
	
	
	//회원공지사항 수정폼이동
		@RequestMapping("/admin/memNoticeUpdate.do")
		public ModelAndView noticeUpdate(int noticeNum) {
			
			ModelAndView mv=new ModelAndView();
			Map<String,String> map=service.selectMemberNotice(noticeNum);
			List<Map<String,String>> attach=service.selectAttach(noticeNum);
			mv.addObject("notice",map);
			mv.addObject("attach",attach);
			mv.setViewName("admin/memberNoticeUpdateForm");
			
			return mv;
		}
		
		
		//회원공지사항 수정완료
	
	  @RequestMapping("/admin/memberNoticeUpdateEnd.do") 
	public String noticeUpdateEnd(String noticeTitle,String noticeContent, int noticeNum, MultipartFile[] upFile, HttpServletRequest request) {
		Map<String,Object> map=new HashMap();
		map.put("noticeTitle",noticeTitle);
		map.put("noticeContent", noticeContent);
		map.put("noticeNum", noticeNum);
		ArrayList<NoticeAttachment> files= new ArrayList();
		String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/member/notAttach");
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
		int result = service.memberNoticeUpdateEnd(map,files); 
		
		  String msg=""; String loc=""; if(result>0) {
		  msg="글을 수정하였습니다.";
		  loc="admin/memberNoticeList.do"; } 
		  else { 
		  msg="실패";
		  loc="admin/memberNoticeList.do"; }
		 
		return "redirect:memberNoticeList.do";
	}
	 
		
		
		//회원공지사항 삭제
		@RequestMapping("/admin/memberNoticeDel.do")
		public String noticeDel(int noticeNum) {
			int result=service.deleteMemberNotice(noticeNum);
			return "redirect:memberNoticeList.do";
		}
	
	

}
