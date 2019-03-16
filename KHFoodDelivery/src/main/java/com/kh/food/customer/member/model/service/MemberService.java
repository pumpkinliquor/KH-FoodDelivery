package com.kh.food.customer.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.owner.menu.model.vo.Menu;
import com.kh.food.owner.store.model.vo.Store;
import com.kh.food.qna.model.vo.MemberQna;

public interface MemberService {
	
	MemberQna memberDetailQna(int no);
	List<MemberQna> selectmemberQna(String memberId);
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
	List<Map<String,String>> selectCategoryList(int businessCode);
//	List<Map<String,String>> selectMenuList(int menuCategoryCode,int businessCode);
	
	Map<String,String>selectSearchId(Map<String,String> map); //아이디찾기
	Map<String,String>selectConfirmEmail(Map<String,String>map);
	int updatePw(Map<String, String> map);

	List<Map<String,String>> selectMenuList(int menuCategoryCode,int businessCode);
	Menu menuSelect(int menuCode);
	List<Store> selectAllStore();
}
