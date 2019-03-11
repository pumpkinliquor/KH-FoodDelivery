package com.kh.food.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.admin.model.dao.QnaMngDao;
import com.kh.food.owner.onevsone.model.vo.OwnerQna;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaReview;

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

	// 회원 문의 보기
	@Override
	public MemberQna selectMemberQna(int no) {
		return dao.selectMemberQna(no);
	}

	// 회원 문의 답변
	@Override
	public MemberQnaReview selectMemberQnaReview(int no) {
		return dao.selectMemberQnaReview(no);
	}

}
