package com.kh.food.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.onevsone.model.vo.OwnerQna;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaReview;

public interface QnaMngDao {
	
	List<MemberQna> selectMemberQnaList(int cPage, int numPerPage);				// 회원 문의 리스트
	List<OwnerQna> selectOwnerQnaList(int cPage, int numPerPage);				// 사장 문의 리스트
	MemberQna selectMemberQna(int no);											// 회원 문의 보기
	MemberQnaReview selectMemberQnaReview(int no);								// 회원 문의 답변 보기
	int insertMemberQnaReview(Map map);											// 회원 문의 답변 등록
	int deleteMemberQnaReview(int no);											// 회원 문의 답변 삭제
	int updateMemberQnaReview(Map map);											// 회원 문의 답변 삭제
	List<MemberQna> searchMemberQna(Map map, int cPage, int numPerPage);		// 회원 문의 검색
	int deleteMemberQna(int no);												// 회원 문의글 삭제
	int selectMemberQnaCount();													// 문의 count
	int selectSearchMemberQnaCount(Map map);									// 검색 문의 count
}
