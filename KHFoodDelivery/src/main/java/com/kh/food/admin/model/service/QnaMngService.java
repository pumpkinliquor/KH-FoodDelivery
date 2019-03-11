package com.kh.food.admin.model.service;

import java.util.List;

import com.kh.food.owner.onevsone.model.vo.MemberQna;
import com.kh.food.owner.onevsone.model.vo.OwnerQna;

public interface QnaMngService {
	
	List<MemberQna> selectMemberQnaList();
	List<OwnerQna> selectOwnerQnaList();
}
