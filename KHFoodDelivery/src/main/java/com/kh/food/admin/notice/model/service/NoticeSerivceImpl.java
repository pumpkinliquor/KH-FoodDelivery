package com.kh.food.admin.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	//회원공지사항 뷰
	@Override
	public Map<String, String> selectMemberNotice(int noticeNum) {
		// TODO Auto-generated method stub
		return dao.selectMemberNotice(noticeNum);
	}

	//회원공지사항 삭제
	@Override
	public int deleteMemberNotice(int noticeNum) {
		// TODO Auto-generated method stub
		return dao.deleteMemberNotice(noticeNum);
	}

	@Override
	public int insertMemberNotice(Map<String, String> notice) {
		// TODO Auto-generated method stub
		int result=0;
		int noticeNum=0;
	
		result=dao.insertMemberNotice(notice);			
		
		return 0;
	}


	


	
	
	
	

	
	
}
