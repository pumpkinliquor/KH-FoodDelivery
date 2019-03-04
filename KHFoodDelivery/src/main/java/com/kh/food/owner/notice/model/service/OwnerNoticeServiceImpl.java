package com.kh.food.owner.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.admin.notice.model.dao.NoticeDao;


@Service
public class OwnerNoticeServiceImpl implements OwnerNoticeService {

	@Autowired
	NoticeDao dao;
	
	@Override
	public List<Map<String, String>> ownerNoticeList() {
		return dao.ownerNoticeList();
	}

}
