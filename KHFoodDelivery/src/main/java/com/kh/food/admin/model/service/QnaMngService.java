package com.kh.food.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.onevsone.model.vo.OwnerQna;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaReview;

public interface QnaMngService {
	
	List<MemberQna> selectMemberQnaList();			// 회원 문의 리스트
	List<OwnerQna> selectOwnerQnaList();			// 사장 문의 리스트
	MemberQna selectMemberQna(int no);				// 회원 문의 보기
	MemberQnaReview selectMemberQnaReview(int no);	// 회원 문의 답변 보기
	int insertMemberQnaRe(Map map);					// 회원 문의 답변 등록
}
