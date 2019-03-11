package com.kh.food.admin.model.dao;

import java.util.List;

import com.kh.food.owner.onevsone.model.vo.OwnerQna;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaReview;

public interface QnaMngDao {
	
	List<MemberQna> selectMemberQnaList();			// 회원 문의 리스트
	List<OwnerQna> selectOwnerQnaList();			// 사장 문의 리스트
	MemberQna selectMemberQna(int no);				// 회원 문의 보기
	MemberQnaReview selectMemberQnaReview(int no);	// 회원 문의 답변
}
