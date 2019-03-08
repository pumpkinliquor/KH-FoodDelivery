package com.kh.food.owner.onevsone.controller;

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

import org.apache.tomcat.websocket.Transformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.food.common.PagingFactory;
import com.kh.food.owner.onevsone.model.service.OnevsOneService;
import com.kh.food.owner.onevsone.model.vo.OwnerQnaAttachment;
import com.kh.food.owner.onevsone.model.vo.OwnerQnaReview;

@Controller
public class OnevsOneController {

	@Autowired
	OnevsOneService service;
	
	@RequestMapping("/owner/oneVSoneList.do")
	public ModelAndView oneVSoneList(ModelAndView mv, @RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		
		int numPerPage=5;
		
		int count=service.qnaCount();
		
		List<Map<String,String>> oneVSoneList=service.oneVSoneList(cPage, numPerPage);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
//		for(int i = 0; i<oneVSoneList.size(); i++) {
//			oneVSoneList.get(i).set(df.format(oneVSoneList.get(i).get("WRITEDATE")));
//		}


		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/owner/oneVSoneList.do"));
		mv.addObject("qnaCount", count);
		mv.addObject("oneVSoneList", oneVSoneList);
		mv.setViewName("owner/oneVSoneList");
		return mv;
	}
	
	@RequestMapping("/owner/oneVSoneForm.do")
	public ModelAndView oneVSoneQ() {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("owner/oneVSoneForm");
		return mv;
	}
	
	@RequestMapping("/owner/oneVSoneFormEnd.do")
	public ModelAndView oneVSoneFormEnd(HttpServletRequest request, 
			 String qnaCategory, String qnaTitle, String qnaContent, MultipartFile[] upFile) {
		
		ModelAndView mv=new ModelAndView();

		int ownerNum=(int) request.getSession().getAttribute("ownerNum");
		
		Map<String,Object> qna=new HashMap<String,Object>();
		
		qna.put("ownerNum", ownerNum);
		qna.put("qnaCategory", qnaCategory);
		qna.put("qnaTitle", qnaTitle);
		qna.put("qnaContent", qnaContent);
		
		ArrayList<OwnerQnaAttachment> files=new ArrayList<OwnerQnaAttachment>();
		
		//저장경료
		String saveDir=request.getSession().getServletContext().getRealPath("resources/upload/owner/qnaAttach");
		
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				String oriFileName=f.getOriginalFilename();
				String ext=oriFileName.substring(oriFileName.lastIndexOf("."));
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int randomV=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+randomV+ext;
				try {
					f.transferTo(new File(saveDir+"/"+reName));
				}
				catch(IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				OwnerQnaAttachment att=new OwnerQnaAttachment();
				att.setReNamedFileName(reName);
				att.setOriginalFileName(oriFileName);
				files.add(att);
			}
		}
		
		int result=service.qnaFormEnd(qna, files);
		
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
	public ModelAndView myOneVSone(HttpServletRequest request, ModelAndView mv, @RequestParam(value="cPage", required=false, defaultValue="0") int cPage) {
		
//		System.out.println(ownerId);
		
		int numPerPage=5;
		String ownerId=(String) request.getSession().getAttribute("ownerId");
		int ownerNum=(int) request.getSession().getAttribute("ownerNum");
		
		int count=service.myQnaCount(ownerNum);
		List<Map<String,String>> myQnaList=service.myQnaList(ownerId, cPage, numPerPage);
		
//		System.out.println(myQnaList);
		mv.addObject("pageBar", PagingFactory.getPageBar(count, cPage, numPerPage, "/food/owner/myOneVSone.do"));
		mv.addObject("myQnaCount", count);
		mv.addObject("myQnaList", myQnaList);
		mv.setViewName("owner/myQna");
		return mv;
	}
	
	@RequestMapping("/owner/oneVSoneView.do")
	public ModelAndView oneVSoneView(int qnaCode, ModelAndView mv) {
		
		Map<String,String> views=service.oneVSoneView(qnaCode);
		List<Map<String,String>> attach=service.ownerAttach(qnaCode);
		List<Map<String,String>> commentList=service.commentList(qnaCode);
		
		mv.addObject("views", views);
		mv.addObject("attach", attach);
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
		
//		System.out.println(qnaCode+ownerNum+reviewContext);
		
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
	
	@RequestMapping("/owner/fileDownLoad.do")
	public void fileDownLoad(String oriName, String reName, HttpServletRequest request, HttpServletResponse response) {
//		System.out.println(oriName+reName);
		BufferedInputStream bis=null;
		ServletOutputStream sos=null;
		boolean fileCheck=true;
		String dir=request.getSession().getServletContext().getRealPath("resources/upload/owner/qnaAttach");
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
