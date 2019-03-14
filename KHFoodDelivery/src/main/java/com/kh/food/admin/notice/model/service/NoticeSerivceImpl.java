package com.kh.food.admin.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.admin.notice.attachment.vo.NoticeAttachment;
import com.kh.food.admin.notice.model.dao.NoticeDao;

@Service
public class NoticeSerivceImpl implements NoticeService {

	
	@Autowired
	NoticeDao dao;
	
	//회원공지사항 리스트
	@Override
	public List<Map<String, String>> selectMemberNoticeList() {
		// TODO Auto-generated method stub
		return dao.selectMemberNoticeList();
	}

	@Override
	public int notCount() {
		// TODO Auto-generated method stub
		return dao.notCount();
	}

	//회원공지사항 뷰
	@Override
	public Map<String, String> selectMemberNotice(int noticeNum) {
		// TODO Auto-generated method stub
		return dao.selectMemberNotice(noticeNum);
	}

	//회원공지사항 사진뷰
	@Override
	public List<Map<String, String>> selectAttach(int noticeNum) {
		// TODO Auto-generated method stub
		return dao.selectAttach(noticeNum);
	}

	//회원공지사항 삭제
	@Override
	public int deleteMemberNotice(int noticeNum) {
		// TODO Auto-generated method stub
		return dao.deleteMemberNotice(noticeNum);
	}

	@Override
	public int insertMemberNotice(Map<String, String> notice,List<NoticeAttachment> files) {
		// TODO Auto-generated method stub
		
		//dao세번이동해야함
		int result=0;
		try {
			result=dao.insertMemberNotice(notice);
			if(result==0)
			{
				throw new Exception();
			}
			for(NoticeAttachment a : files)
			{
				a.setNoticeNum(Integer.parseInt( notice.get("noticeNum").toString()));
				result=dao.insertMemberNoticeAttach(a);
				if(result==0) throw new Exception();
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
					
		
		return result;
	}

	
	//회원공지사항 수정
	@Override
	public int memberNoticeUpdateEnd(Map<String, Object> map, List<NoticeAttachment> files) {
		// TODO Auto-generated method stub
		int result=0;
		try {
			result=dao.memberNoticeUpdateEnd(map);
			if(result==0)
			{
				throw new Exception();
			}
			for(NoticeAttachment a : files)
			{
				a.setNoticeNum(Integer.parseInt(map.get("noticeNum").toString()));
				result=dao.memberNoticeAUpdateEnd(a);
				if(result==0) throw new Exception();
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
					
		
		return result;
	}

	
}
