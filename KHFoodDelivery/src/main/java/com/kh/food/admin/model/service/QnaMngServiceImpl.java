package com.kh.food.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.admin.model.dao.QnaMngDao;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaReview;
import com.kh.food.qna.model.vo.OwnerQna;
import com.kh.food.qna.model.vo.OwnerQnaReview;

@Service
public class QnaMngServiceImpl implements QnaMngService {

	@Autowired
	QnaMngDao dao;
	
	
	/* 회원 문의 관련 service*/
	
	
	// 회원 문의 리스트
	@Override
	public List<MemberQna> selectMemberQnaList(int cPage, int numPerPage) {
		return dao.selectMemberQnaList(cPage, numPerPage);
	}

	// 회원 문의 보기
	@Override
	public MemberQna selectMemberQna(int no) {
		return dao.selectMemberQna(no);
	}

	// 회원 문의 답변 보기
	@Override
	public MemberQnaReview selectMemberQnaReview(int no) {
		return dao.selectMemberQnaReview(no);
	}

	// 회원 문의 답변 등록
	@Override
	public int insertMemberQnaReview(Map map) {
		return dao.insertMemberQnaReview(map);
	}

	// 회원 문의 답변 삭제
	@Override
	public int deleteMemberQnaReview(int no) {
		return dao.deleteMemberQnaReview(no);
	}

	// 회원 문의 답변 수정
	@Override
	public int updateMemberQnaReview(Map map) {
		return dao.updateMemberQnaReview(map);
	}

	// 회원 문의 검색
	@Override
	public List<MemberQna> searchMemberQna(Map map, int cPage, int numPerPage) {
		return dao.searchMemberQna(map, cPage, numPerPage);
	}

	// 회원 문의글 삭제
	@Override
	public int deleteMemberQna(int no) {
		return dao.deleteMemberQna(no);
	}

	// 회원 문의 count
	@Override
	public int selectMemberQnaCount() {
		return dao.selectMemberQnaCount();
	}

	// 회원 검색 문의 count
	@Override
	public int selectSearchMemberQnaCount(Map map) {
		return dao.selectSearchMemberQnaCount(map);
	}
	
	
	
	
	/* 사장 문의 관련 service*/
	
	
	// 사장 문의 리스트
	@Override
	public List<OwnerQna> selectOwnerQnaList(int cPage, int numPerPage) {
		return dao.selectOwnerQnaList(cPage, numPerPage);
	}

	// 사장 문의 보기
	@Override
	public OwnerQna selectOwnerQna(int no) {
		return dao.selectOwnerQna(no);
	}

	// 사장 문의 답변 보기
	@Override
	public OwnerQnaReview selectOwnerQnaReview(int no) {
		return dao.selectOwnerQnaReview(no);
	}

	// 사장 문의 답변 등록
	@Override
	public int insertOwnerQnaReview(Map map) {
		return dao.insertOwnerQnaReview(map);
	}

	// 사장 문의 답변 삭제
	@Override
	public int deleteOwnerQnaReview(int no) {
		return dao.deleteOwnerQnaReview(no);
	}

	// 사장 문의 답변 수정
	@Override
	public int updateOwnerQnaReview(Map map) {
		return dao.updateOwnerQnaReview(map);
	}

	// 사장 문의 검색
	@Override
	public List<OwnerQna> searchOwnerQna(Map map, int cPage, int numPerPage) {
		return dao.searchOwnerQna(map, cPage, numPerPage);
	}

	// 사장 문의글 삭제
	@Override
	public int deleteOwnerQna(int no) {
		return dao.deleteOwnerQna(no);
	}

	// 사장 문의 count
	@Override
	public int selectOwnerQnaCount() {
		return dao.selectOwnerQnaCount();
	}

	// 사장 검색 문의 count
	@Override
	public int selectSearchOwnerQnaCount(Map map) {
		return dao.selectSearchOwnerQnaCount(map);
	}
	
	
	/* 관리자 메인용 */
	@Override
	public List<MemberQna> selectMemberQnaList() {
		return dao.selectMemberQnaList();
	}
	
	@Override
	public List<OwnerQna> selectOwnerQnaList() {
		return dao.selectOwnerQnaList();
	}	
	
}
