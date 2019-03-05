package com.kh.food.owner.onevsone.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.owner.onevsone.model.dao.OnevsOneDao;
import com.kh.food.owner.onevsone.model.vo.OwnerQnaReview;

@Service
public class OnevsOneServiceImpl implements OnevsOneService {
	
	@Autowired
	OnevsOneDao dao;

	@Override
	public List<Map<String, String>> oneVSoneList() {
		return dao.oneVSoneList();
	}

	@Override
	public List<Map<String, String>> myQnaList(String ownerId) {
		return dao.myQnaList(ownerId);
	}

	@Override
	public Map<String, String> oneVSoneView(int qnaCode) {
		return dao.oneVSoneView(qnaCode);
	}

	@Override
	public int selectOwnerForm(String ownerId) {
		return dao.selectOwnerForm(ownerId);
	}

	@Override
	public List<Map<String, String>> qnaSearch(Map<String, String> map) {
		return dao.qnaSearch(map);
	}

	@Override
	public int qnaReviewForm(OwnerQnaReview oqr) {
		return dao.qnaReviewForm(oqr);
	}

	@Override
	public List<Map<String, String>> commentList(int qnaCode) {
		return dao.commentList(qnaCode);
	}

//	@Override
//	public int qnaFormEnd(Map<String,Object> qna) throws Exception {
//		int result=0;
//		try {
//			result=dao.qnaFormEnd(qna);
//			if(result==0) {
//				throw new Exception();
//			}
//		}
//		return result;
//	}

}
