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

}
