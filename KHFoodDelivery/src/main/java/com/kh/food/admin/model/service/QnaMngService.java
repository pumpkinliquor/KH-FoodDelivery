package com.kh.food.admin.model.service;

import java.util.List;

import com.kh.food.owner.onevsone.model.vo.OwnerQna;
import com.kh.food.qna.model.vo.MemberQna;

public interface QnaMngService {
	
	List<MemberQna> selectMemberQnaList();
	List<OwnerQna> selectOwnerQnaList();
	MemberQna selectMemberQna(int no);
}
