package com.kh.food.owner.onevsone.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.food.owner.onevsone.model.dao.OnevsOneDao;
import com.kh.food.owner.onevsone.model.vo.OwnerQnaAttachment;
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

	@Override
	public int qnaReviewUpdate(Map<String,Object> reviewUp) {
		return dao.qnaReviewUpdate(reviewUp);
	}

	@Override
	public int qnaReviewDelete(int qnaReviewCode) {
		return dao.qnaReviewDelete(qnaReviewCode);
	}

	@Override
	public int qnaFormEnd(Map<String, Object> qna, List<OwnerQnaAttachment> files){
		int result=0;
		try {
			result=dao.insertQna(qna);
			if(result==0) {
				throw new Exception();
			}
			for(OwnerQnaAttachment a : files) {
				a.setQnaCode(Integer.parseInt((String) qna.get("qnaCode")));
				result=dao.insertAttach(a);
				if(result==0) {
					throw new Exception("업로드 실패");
				}
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Map<String, String>> ownerAttach(int qnaCode) {
		return dao.ownerAttach(qnaCode);
	}


}
