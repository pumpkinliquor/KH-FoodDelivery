package com.kh.food.owner.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.admin.notice.model.dao.NoticeDao;
import com.kh.food.owner.notice.model.dao.OwnerNoticeDao;


@Service
public class OwnerNoticeServiceImpl implements OwnerNoticeService {

	@Autowired
	OwnerNoticeDao dao;

	//사장 공지사항리스트
	@Override
	public List<Map<String, String>> ownerNoticeList() {
		// TODO Auto-generated method stub
		return dao.ownerNoticeList();
	}

	//사장공지사항 뷰
	@Override
	public Map<String, String> selectOwnerNotice(int ownerNoticeNum) {
		// TODO Auto-generated method stub
		return dao.selectOwnerNotice(ownerNoticeNum);
	}
	
	
	
}
