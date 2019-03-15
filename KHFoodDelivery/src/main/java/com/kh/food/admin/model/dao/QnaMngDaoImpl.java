package com.kh.food.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaReview;
import com.kh.food.qna.model.vo.OwnerQna;
import com.kh.food.qna.model.vo.OwnerQnaReview;

@Repository
public class QnaMngDaoImpl implements QnaMngDao {

	@Autowired
	SqlSessionTemplate session;
	
	private Logger logger = LoggerFactory.getLogger(QnaMngDaoImpl.class);
	
	/* 회원 문의 관련 dao */
	
	// 회원 문의 리스트
	@Override
	public List<MemberQna> selectMemberQnaList(int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		logger.debug(cPage + " : " + numPerPage);
		return session.selectList("qna.selectMemberQnaList", null, rb);
	}

	// 회원 문의 보기
	@Override
	public MemberQna selectMemberQna(int no) {
		return session.selectOne("qna.selectMemberQna", no);
	}

	// 회원 문의 답변 보기
	@Override
	public MemberQnaReview selectMemberQnaReview(int no) {
		return session.selectOne("qna.selectMemberQnaReview", no);
	}

	// 회원 문의 답변 등록
	@Override
	public int insertMemberQnaReview(Map map) {
		return session.insert("qna.insertMemberQnaReview", map);
	}

	// 회원 문의 답변 삭제
	@Override
	public int deleteMemberQnaReview(int no) {
		return session.delete("qna.deleteMemberQnaReview", no);
	}

	// 회원 문의 답변 수정
	@Override
	public int updateMemberQnaReview(Map map) {
		return session.update("qna.updateMemberQnaReview", map);
	}

	// 회원 문의 검색
	@Override
	public List<MemberQna> searchMemberQna(Map map, int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("qna.searchMemberQna", map, rb);
	}

	// 회원 문의글 삭제
	@Override
	public int deleteMemberQna(int no) {
		return session.delete("qna.deleteMemberQna", no);
	}

	// 문의 count
	@Override
	public int selectMemberQnaCount() {
		return session.selectOne("qna.selectMemberQnaCount");
	}

	// 검색 문의 count
	@Override
	public int selectSearchMemberQnaCount(Map map) {
		return session.selectOne("qna.selectSearchMemberQnaCount", map);
	}	
	
	
	
	/* 사장 문의 관련 dao */
	
	// 사장 문의 리스트
	@Override
	public List<OwnerQna> selectOwnerQnaList(int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("qna.selectOwnerQnaList", null, rb);
	}

	// 사장 문의 보기
	@Override
	public OwnerQna selectOwnerQna(int no) {
		return session.selectOne("qna.selectOwnerQna", no);
	}

	// 사장 문의 답변 보기
	@Override
	public OwnerQnaReview selectOwnerQnaReview(int no) {
		return session.selectOne("qna.selectOwnerQnaReview", no);
	}

	// 사장 문의 답변 등록
	@Override
	public int insertOwnerQnaReview(Map map) {
		return session.insert("qna.insertOwnerQnaReview", map);
	}

	// 사장 문의 답변 삭제
	@Override
	public int deleteOwnerQnaReview(int no) {
		return session.delete("qna.deleteOwnerQnaReview", no);
	}

	// 사장 문의 답변 수정
	@Override
	public int updateOwnerQnaReview(Map map) {
		return session.update("qna.updateOwnerQnaReview", map);
	}

	// 사장 문의 검색
	@Override
	public List<OwnerQna> searchOwnerQna(Map map, int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("qna.searchOwnerQna", map, rb);
	}

	// 사장 문의글 삭제
	@Override
	public int deleteOwnerQna(int no) {
		return session.delete("qna.deleteOwnerQna", no);
	}

	// 문의 count
	@Override
	public int selectOwnerQnaCount() {
		return session.selectOne("qna.selectOwnerQnaCount");
	}

	// 검색 문의 count
	@Override
	public int selectSearchOwnerQnaCount(Map map) {
		return session.selectOne("qna.selectSearchOwnerQnaCount", map);
	}
	
}
