package com.kh.food.owner.onevsone.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.member.model.vo.Owner;
import com.kh.food.owner.onevsone.model.vo.OwnerQnaAttachment;
import com.kh.food.owner.onevsone.model.vo.OwnerQnaReview;

@Repository
public class OnevsOneDaoImpl implements OnevsOneDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> oneVSoneList(int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("oneVSone.oneVSoneList", null, rows);
	}

	@Override
	public int qnaCount() {
		return session.selectOne("oneVSone.qnaCount");
	}

	@Override
	public List<Map<String, String>> myQnaList(String ownerId, int cPage, int numPerPage) {
		RowBounds rows=new RowBounds((cPage-1)*numPerPage, numPerPage);
		return session.selectList("oneVSone.myQnaList", ownerId, rows);
	}
	
	@Override
	public int myQnaCount(int ownerNum) {
		return session.selectOne("oneVSone.myQnaCount", ownerNum);
	}

	@Override
	public Map<String, String> oneVSoneView(int qnaCode) {
		return session.selectOne("oneVSone.oneVSoneView", qnaCode);
	}

	@Override
	public List<Map<String, String>> qnaSearch(Map<String, String> map) {
		return session.selectList("oneVSone.qnaSearch", map);
	}

	@Override
	public int qnaReviewForm(OwnerQnaReview oqr) {
		return session.insert("oneVSone.qnaReview", oqr);
	}

	@Override
	public List<Map<String, String>> commentList(int qnaCode) {
		return session.selectList("oneVSone.commentList", qnaCode);
	}

	@Override
	public int qnaReviewUpdate(Map<String,Object> reviewUp) {
		return session.update("oneVSone.qnaUpdate", reviewUp);
	}

	@Override
	public int qnaReviewDelete(int qnaReviewCode) {
		return session.delete("oneVSone.qnaReviewDelete", qnaReviewCode);
	}

	@Override
	public int insertQna(Map<String,Object> qna) {
		return session.insert("oneVSone.insertQna", qna);
	}
	
	@Override
	public int insertAttach(OwnerQnaAttachment a) {
		return session.insert("oneVSone.insertAttach", a);
	}
	
	@Override
	public List<Map<String,String>> ownerAttach(int qnaCode) {
		return session.selectList("oneVSone.ownerAttach", qnaCode);
	}

	@Override
	public int qnaDelete(int qnaCode) {
		return session.delete("oneVSone.qnaDelete", qnaCode);
	}

	@Override
	public Owner selectMyPage(int ownerNum) {
		return session.selectOne("oneVSone.selectMyPage", ownerNum);
	}

	@Override
	public int updateMyPage(Map<String, Object> owner) {
		return session.update("oneVSone.updateMyPage", owner);
	}

	@Override
	public int selectQnaCount(int ownerNum) {
		return session.selectOne("oneVSone.selectQnaCount", ownerNum);
	}
	
	@Override
	public int selectReCount(int ownerNum) {
		return session.selectOne("oneVSone.selectReCount", ownerNum);
	}

	@Override
	public int selectOwnerReCount(int ownerNum) {
		return session.selectOne("oneVSone.selectOwnerReCount", ownerNum);
	}

}
