package com.kh.food.customer.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.owner.store.model.vo.Store;

public interface MemberService {

	int memberEnroll(Member m);
	int checkId(String memberId);
	Map<String,String> login(Map<String,String> map);
	int checkNick(String nickName);
	Member selectMember(String memberId);
	int update(Member m);
	List<Store> selectStore(String category,int cPage,int numPerPage);
	int selectMenuCount();
	int drop(String memberId);
	List<Store> menuInfo(int businessCode);
}
