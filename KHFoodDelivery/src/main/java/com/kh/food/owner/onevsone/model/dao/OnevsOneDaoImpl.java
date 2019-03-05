package com.kh.food.owner.onevsone.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.onevsone.model.vo.OwnerQnaReview;

@Repository
public class OnevsOneDaoImpl implements OnevsOneDao {

	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> oneVSoneList() {
		return session.selectList("oneVSone.oneVSoneList");
	}

	@Override
	public List<Map<String, String>> myQnaList(String ownerId) {
		return session.selectList("oneVSone.myQnaList", ownerId);
	}

	@Override
	public Map<String, String> oneVSoneView(int qnaCode) {
		return session.selectOne("oneVSone.oneVSoneView", qnaCode);
	}

	@Override
	public int selectOwnerForm(String ownerId) {
		return session.selectOne("oneVSone.selectOwnerForm", ownerId);
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
		return session.delete("oneVSone.qnaDelete", qnaReviewCode);
	}

//	@Override
//	public int qnaFormEnd(Map<String,Object> qna) {
//		return session.insert("oneVSone.insertQna", qna);
//	}
//	
//	

}
