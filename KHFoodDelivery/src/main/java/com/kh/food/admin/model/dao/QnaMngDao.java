package com.kh.food.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaReview;
import com.kh.food.qna.model.vo.OwnerQna;
import com.kh.food.qna.model.vo.OwnerQnaReview;

public interface QnaMngDao {
	
	/* 회원 문의 관련 service */
	List<MemberQna> selectMemberQnaList(int cPage, int numPerPage);				// 회원 문의 리스트
	MemberQna selectMemberQna(int no);											// 회원 문의 보기
	MemberQnaReview selectMemberQnaReview(int no);								// 회원 문의 답변 보기
	int insertMemberQnaReview(Map map);											// 회원 문의 답변 등록
	int deleteMemberQnaReview(int no);											// 회원 문의 답변 삭제
	int updateMemberQnaReview(Map map);											// 회원 문의 답변 삭제
	List<MemberQna> searchMemberQna(Map map, int cPage, int numPerPage);		// 회원 문의 검색
	int deleteMemberQna(int no);												// 회원 문의글 삭제
	int selectMemberQnaCount();													// 회원 문의 count
	int selectSearchMemberQnaCount(Map map);									// 회원 검색 문의 count
	
	
	/* 사장 문의 관련 service */
	List<OwnerQna> selectOwnerQnaList(int cPage, int numPerPage);				// 회원 문의 리스트
	OwnerQna selectOwnerQna(int no);											// 사장 문의 보기
	OwnerQnaReview selectOwnerQnaReview(int no);								// 사장 문의 답변 보기
	int insertOwnerQnaReview(Map map);											// 사장 문의 답변 등록
	int deleteOwnerQnaReview(int no);											// 사장 문의 답변 삭제
	int updateOwnerQnaReview(Map map);											// 사장 문의 답변 삭제
	List<OwnerQna> searchOwnerQna(Map map, int cPage, int numPerPage);			// 사장 문의 검색
	int deleteOwnerQna(int no);													// 사장 문의글 삭제
	int selectOwnerQnaCount();													// 사장 문의 count
	int selectSearchOwnerQnaCount(Map map);										// 사장 검색 문의 count


	
	/* 관리자 메인용 */
	List<MemberQna> selectMemberQnaList();										// 회원 문의 리스트
	List<OwnerQna> selectOwnerQnaList();										// 사장 문의 리스트
}