package com.kh.food.owner.onevsone.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.owner.onevsone.model.dao.OnevsOneDao;

@Service
public class OnevsOneServiceImpl implements OnevsOneService {
	
	@Autowired
	OnevsOneDao dao;

	@Override
	public List<Map<String, String>> oneVSoneList() {
		return dao.oneVSoneList();
	}

	@Override
	public List<Map<String, String>> myQnaList(String ownerId) {
		return dao.myQnaList(ownerId);
	}

	@Override
	public Map<String, String> oneVSoneView(int qnaCode) {
		return dao.oneVSoneView(qnaCode);
	}

	@Override
	public int selectOwnerForm(String ownerId) {
		return dao.selectOwnerForm(ownerId);
	}

	@Override
	public int qnaFormEnd(Map<String,Object> qna) {
		
		return dao.qnaFormEnd(qna);
	}

}
