package com.kh.food.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.onevsone.model.vo.OwnerQna;
import com.kh.food.qna.model.vo.MemberQna;

@Repository
public class QnaMngDaoImpl implements QnaMngDao {

	@Autowired
	SqlSessionTemplate session;
	
	// 회원 문의 리스트
	@Override
	public List<MemberQna> selectMemberQnaList() {
		return session.selectList("qna.selectMemberQnaList");
	}

	// 사장 문의 리스트
	@Override
	public List<OwnerQna> selectOwnerQnaList() {
		return null;
	}

	// 회원 문의 보기
	@Override
	public MemberQna selectMemberQna(int no) {
		return session.selectOne("qna.selectMemberQna", no);
	}
	
}
