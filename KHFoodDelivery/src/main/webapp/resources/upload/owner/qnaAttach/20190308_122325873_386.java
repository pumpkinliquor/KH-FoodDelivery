package com.kh.spring.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.common.PageFactory;

@Controller
public class BoardController {
	private Logger logger=LoggerFactory.getLogger(BoardController.class);
	@Autowired
	BoardService service;
	
	
	@RequestMapping("/board/boardList")
	public ModelAndView boardList(
			@RequestParam(value="cPage", 
			required=false, defaultValue="0") int cPage
			)
	{
		int numPerPage=5;
		ModelAndView mv=new ModelAndView();
		int contentCount=service.selectBoardCount();
		List<Map<String,String>> list=service.selectBoardList(cPage,numPerPage);
		mv.addObject("pageBar",PageFactory.getPageBar(contentCount, cPage, numPerPage, "/spring/board/boardList"));
		mv.addObject("list",list);
		mv.setViewName("board/boardList");
		return mv;
	}
	
	@RequestMapping("/board/boardForm")
	public String boardForm()
	{
		return "board/boardForm";
	}
	
	@RequestMapping("board/boardFormEnd.do")
	public String boardFormEnd(String boardTitle,
					String boardWriter, 
					String boardContent,
					MultipartFile[] upFile,
					HttpServletRequest request)
	{
		//board에 대한 값 title, comment.... 
		//파일 두개~~
		String savDir=request.getSession()
							.getServletContext()
							.getRealPath("/resources/upload/board");
		for(MultipartFile f : upFile)
		{
			if(!f.isEmpty()) {
				//파일명을 생성(rename)
				String orifileName=f.getOriginalFilename();
				String ext=orifileName.substring(orifileName.lastIndexOf("."));
				//rename 규칙설정
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rdv=(int)(Math.random()*1000);
				String reName=sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
				//파일을 저장해보자
				try {
					f.transferTo(new File(savDir+"/"+reName));
				}catch(IllegalStateException | IOException e)
				{
					e.printStackTrace();
				}
			}
			
		}
		
		
		return "redirect:/board/boardList";
	}
	
	
	
	
	
	
	
	
	
	
}
