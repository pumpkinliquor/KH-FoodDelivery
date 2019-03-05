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
	
	
	@Override
	public List<Map<String, String>> selectMemberNoticeList() {
		// TODO Auto-generated method stub
		return dao.selectMemberNoticeList();
	}


	@Override
	public Map<String, String> selectMemberNotice(int noticeNum) {
		// TODO Auto-generated method stub
		return dao.selectMemberNotice(noticeNum);
	}


	@Override
	public int deleteMemberNotice(int noticeNum) {
		// TODO Auto-generated method stub
		return dao.deleteMemberNotice(noticeNum);
	}


	


	
	
	
	

	
	
}
