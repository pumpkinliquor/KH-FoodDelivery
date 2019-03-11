package com.kh.food.owner.notice.controller;

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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.owner.notice.attachment.vo.OwnerNoticeAttachment;
import com.kh.food.owner.notice.model.service.OwnerNoticeService;


@Controller
public class OwnerNoticeController {
	

	@Autowired
	OwnerNoticeService service;
	
	//사장 공지사항 리스트
	@RequestMapping("/owner/ownerNoticeList.do")
	public ModelAndView noticeList(ModelAndView mv) {
		
		List<Map<String, String>> list=service.ownerNoticeList();
		mv.addObject("list", list);	
		mv.setViewName("owner/ownerNoticeList");
		return mv;
	}
	
	//사장 공지사항 뷰
	@RequestMapping("/owner/ownerNoticeView.do")
	public ModelAndView noticeView(int ownerNoticeNum) {
		ModelAndView mv=new ModelAndView();
		Map<String,String> map=service.selectOwnerNotice(ownerNoticeNum);
		List<Map<String,String>> attach=service.selectOwnerAttach(ownerNoticeNum);
		mv.addObject("notice",map);
		mv.addObject("attach",attach);
		mv.setViewName("owner/ownerNoticeView");
		return mv;
	}
	
	//사장 공지사항 삭제
	@RequestMapping("/owner/ownerNoticeDel.do")
	public String noticeDel(int ownerNoticeNum) {
		int result=service.deleteOwnerNotice(ownerNoticeNum);
		return "redirect:ownerNoticeList.do";
	}
	
	//사장 공지사항 등록폼
	@RequestMapping("/owner/ownerNoticeForm.do")
	public String noticeInsert() {
		return "owner/ownerNoticeForm";
	}
	
	
	  //사장 공지사항 등록완료  
	  @RequestMapping("/owner/ownerNoticeFormEnd.do") 
	  public ModelAndView noticeFormEnd(String noticeTitle, String noticeContent, MultipartFile[] upFile, HttpServletRequest request) {
			ModelAndView mv=new ModelAndView();
			Map<String,String> notice=new HashMap();
			notice.put("noticeTitle", noticeTitle);
			notice.put("noticeContent", noticeContent);
			ArrayList<OwnerNoticeAttachment> files=new ArrayList();
			String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/owner/notAttach");
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
					OwnerNoticeAttachment att=new OwnerNoticeAttachment();
					att.setOwnerRenamedFileName(reName);
					att.setOwnerOriginalFileName(orifileName);
					files.add(att);
				}
			}
			int result=service.insertOwnerNotice(notice,files);
			String loc="/owner/ownerNoticeList.do";
			String msg="";
			if(result>0) {
				msg="성공적으로 등록하였습니다.";
				
			}else {
				msg="실패";
			}
			mv.addObject("loc", loc);
			mv.addObject("msg", msg);
			
			mv.setViewName("common/msg");
			return mv;
	  }
	  
	 
	
	//파일다운로드
		@RequestMapping("/owner/noticeFileDownLoad.do")
		public void fileDownLoad(String oriName, String reName, HttpServletRequest request, HttpServletResponse response) {
			BufferedInputStream bis=null;
			ServletOutputStream sos=null;
			boolean fileCheck=true;
			String dir=request.getSession().getServletContext().getRealPath("resources/upload/owner/notAttach");
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
}
