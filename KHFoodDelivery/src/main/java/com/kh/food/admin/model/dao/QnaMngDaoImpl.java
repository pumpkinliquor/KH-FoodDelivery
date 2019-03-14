package com.kh.food.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.onevsone.model.vo.OwnerQna;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaReview;

@Repository
public class QnaMngDaoImpl implements QnaMngDao {

	@Autowired
	SqlSessionTemplate session;
	
	// 회원 문의 리스트
	@Override
	public List<MemberQna> selectMemberQnaList(int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("qna.selectMemberQnaList", rb);
	}

	// 사장 문의 리스트
	@Override
	public List<OwnerQna> selectOwnerQnaList(int cPage, int numPerPage) {
		RowBounds rb = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		return session.selectList("qna.selectOwnerQnaList", rb);
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
}
