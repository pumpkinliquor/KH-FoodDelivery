package com.kh.food.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.admin.model.dao.QnaMngDao;
import com.kh.food.owner.onevsone.model.vo.MemberQna;
import com.kh.food.owner.onevsone.model.vo.OwnerQna;

@Service
public class QnaMngServiceImpl implements QnaMngService {

	@Autowired
	QnaMngDao dao;
	
	// 회원 문의 리스트
	@Override
	public List<MemberQna> selectMemberQnaList() {
		return dao.selectMemberQnaList();
	}

	// 사장 문의 리스트
	@Override
	public List<OwnerQna> selectOwnerQnaList() {
		return dao.selectOwnerQnaList();
	}

	
}
