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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.admin.notice.attachment.vo.NoticeAttachment;
import com.kh.food.common.PagingFactory;
import com.kh.food.owner.notice.attachment.vo.OwnerNoticeAttachment;
import com.kh.food.owner.notice.model.service.OwnerNoticeService;


@Controller
public class OwnerNoticeController {
	

	@Autowired
	OwnerNoticeService service;
	
	//사장 공지사항 리스트
	@RequestMapping("/owner/ownerNoticeList.do")
	public ModelAndView noticeList(ModelAndView mv, @RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		int numPerPage=10;
		
		int count = service.ownNotCount();
		List<Map<String, String>> list=service.ownerNoticeList(cPage,numPerPage);
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/owner/ownerNoticeList.do"));
		mv.addObject("list", list);	
		mv.setViewName("owner/ownerNoticeList");
		return mv;
	}
	
	//사장 공지사항 리스트 (사장뷰)
		@RequestMapping("/owner/ownerNoticeListOwnerView.do")
		public ModelAndView ownerNoticeList(ModelAndView mv, @RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
			int numPerPage=10;
			
			int count = service.ownNotCount();
			List<Map<String, String>> list=service.ownerNoticeListOwnerView(cPage,numPerPage);
			mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/owner/ownerNoticeListOwnerView.do"));
			mv.addObject("list", list);	
			mv.setViewName("owner/ownerNoticeListOwnerView");
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
	
	//사장공지사항 사장뷰
	@RequestMapping("/owner/ownerNoticeViewOwnerView.do")
	public ModelAndView ownerNoticeView(int ownerNoticeNum) {
		ModelAndView mv=new ModelAndView();
		Map<String,String> map=service.selectOwnerNotice(ownerNoticeNum);
		List<Map<String,String>> attach=service.selectOwnerAttach(ownerNoticeNum);
		mv.addObject("notice",map);
		mv.addObject("attach",attach);
		mv.setViewName("owner/ownerNoticeViewOwnerView");
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
		@RequestMapping("/owner/noticefileDownLoad.do")
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
		
		
		
		//사장 공지사항 수정폼 이동
		@RequestMapping("/owner/ownerNoticeUpdate.do")
		public ModelAndView ownerNoticeUpdate(int ownerNoticeNum) {
			ModelAndView mv=new ModelAndView();
			Map<String,String> map=service.selectOwnerNotice(ownerNoticeNum);
			List<Map<String,String>> attach=service.selectOwnerAttach(ownerNoticeNum);
			mv.addObject("notice",map);
			mv.addObject("attach",attach);
			mv.setViewName("owner/ownerNoticeUpdateForm");
			return mv;
		}
		
		//사장 공지사항 수정 완료
		@RequestMapping("/owner/ownerNoticeUpdateEnd.do")
		public String noticeUpdateEnd(String noticeTitle,String noticeContent,int ownerNoticeNum, MultipartFile upFile1,MultipartFile upFile2, HttpServletRequest request) {
		
		System.out.println(upFile1.getOriginalFilename() + " : 1오리");
		System.out.println(upFile2.getOriginalFilename() + " : 2오리");
		List<OwnerNoticeAttachment> attach=service.selectAttachModify(ownerNoticeNum);//어태치먼트 가져온 녀석
		Map<String,Object> map=new HashMap();
		System.out.println(ownerNoticeNum);
		service.modifyFore(ownerNoticeNum);
		map.put("noticeTitle", noticeTitle);
		map.put("noticeContent", noticeContent);
		map.put("ownerNoticeNum",ownerNoticeNum);
		ArrayList<OwnerNoticeAttachment> files=new ArrayList();
		String savDir=request.getSession().getServletContext().getRealPath("/resources/upload/owner/notAttach");
		if(!upFile1.isEmpty())
		{
			System.out.println("업파일1이 들어있을때");
			MultipartFile f1=upFile1;
			
			String orifileName=f1.getOriginalFilename();
			String ext=orifileName.substring(orifileName.lastIndexOf("."));
			//rename 규칙설정
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdv=(int)(Math.random()*1000);
			String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
			
			//파일저장하기
			try {
				f1.transferTo(new File(savDir+"/"+reName));
				
			}catch(IllegalStateException | IOException e)
			{
				e.printStackTrace();
			}
			OwnerNoticeAttachment att=new OwnerNoticeAttachment();
			att.setOwnerRenamedFileName(reName);
			att.setOwnerOriginalFileName(orifileName);
			files.add(0,att);
		}
		else
		{
			System.out.println("업파일1이 비어있을때");
			if(!attach.isEmpty())
			{
				System.out.println("업파일1이 비어있고 어태치가 비어있지 않을때");
				files.add(0,attach.get(0));
			}
		}
		
		if(!upFile2.isEmpty())
		{			
			System.out.println("업파일2가 비어있지 않을때");
			MultipartFile f2=upFile2;
			
			String orifileName=f2.getOriginalFilename();
			String ext=orifileName.substring(orifileName.lastIndexOf("."));
			//rename 규칙설정
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rdv=(int)(Math.random()*1000);
			String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
			
			//파일저장하기
			try {
				f2.transferTo(new File(savDir+"/"+reName));
				
			}catch(IllegalStateException | IOException e)
			{
				e.printStackTrace();
			}
			OwnerNoticeAttachment att=new OwnerNoticeAttachment();
			att.setOwnerRenamedFileName(reName);
			att.setOwnerOriginalFileName(orifileName);
			if(attach.isEmpty())
			{
				System.out.println("업파일 2가 비어있지 않고 어태치가 비어있을때");
				files.add(0,att);
			}
			else
			{
				System.out.println("업파일 2가 비어있지 않고 어태치가 비어있지 않을때");
				files.add(1,att);
			}			
		}
		else
		{
			System.out.println("업파일 2가 비어있을때");
			if(attach.size()==2)
			{
				System.out.println("업파일 2가 비어있고 어태치가 22이 비어있지 않을때");
				files.add(1,attach.get(1));
			}
		}
		System.out.println(files.get(0));
		System.out.println(files.get(1));
		int result = service.ownerNoticeUpdateEnd(map,files); 
		return "redirect:ownerNoticeList.do";
	}
}