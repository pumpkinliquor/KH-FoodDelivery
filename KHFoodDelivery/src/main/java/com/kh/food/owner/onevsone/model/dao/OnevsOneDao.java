package com.kh.food.owner.onevsone.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.owner.member.model.vo.Owner;
import com.kh.food.owner.onevsone.model.vo.OwnerQnaAttachment;

public interface OnevsOneDao {
	List<Map<String,String>> oneVSoneList(int cPage, int numPerPage);
	int qnaCount();
	List<Map<String,String>> myQnaList(String ownerId, int cPage, int numPerPage);
	int myQnaCount(int ownerNum);
	Map<String,String> oneVSoneView(int qnaCode);
	List<Map<String,String>> qnaSearch(Map<String,String> map);
	List<Map<String,String>> commentList(int qnaCode);
	int insertQna(Map<String,Object> qna);
	int insertAttach(OwnerQnaAttachment a);
	List<Map<String,String>> ownerAttach(int qnaCode);
	int qnaDelete(int qnaCode);
	Owner selectMyPage(int ownerNum);
	int updateMyPage(Map<String,Object> owner);
	int selectQnaCount(int ownerNum);
	int businessReviewCount(int businessCode);
}
