package com.kh.food.owner.custom.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.mark.model.vo.Mark;
import com.kh.food.owner.custom.model.dao.CustomerDao;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDao dao;
	
	@Override
	public List<Map<String, String>> selectQnaList() {
		return dao.selectQnaList();
	}

	@Override
	public List<Map<String, String>> selectNoticeList() {
		return dao.selectNoticeList();
	}

	@Override
	public int storeFormEnd(Map<String, Object> store) {
		return dao.storeFormEnd(store);
	}

	@Override
	public int insertMark(Map<String, Object> maps) {
		return dao.insertMark(maps);
	}
	
	@Override
	public int updateMark(Map<String, Object> maps) {
		return dao.updateMark(maps);
	}

	@Override
	public Mark selectMark(Map<String, Object> maps) {
		return dao.selectMark(maps);
	}

}
