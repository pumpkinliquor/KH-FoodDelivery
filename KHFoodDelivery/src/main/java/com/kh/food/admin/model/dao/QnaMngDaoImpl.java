package com.kh.food.admin.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.food.owner.onevsone.model.vo.MemberQna;
import com.kh.food.owner.onevsone.model.vo.OwnerQna;

@Repository
public class QnaMngDaoImpl implements QnaMngDao {

	// 회원 문의 리스트
	@Override
	public List<MemberQna> selectMemberQnaList() {
		return null;
	}

	// 사장 문의 리스트
	@Override
	public List<OwnerQna> selectOwnerQnaList() {
		return null;
	}
}
