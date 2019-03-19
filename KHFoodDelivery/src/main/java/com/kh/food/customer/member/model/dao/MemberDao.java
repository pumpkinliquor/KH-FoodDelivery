package com.kh.food.customer.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.food.admin.notice.model.vo.MemberNotice;
import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.customer.member.model.vo.WishList;
import com.kh.food.owner.menu.model.vo.Menu;
import com.kh.food.owner.store.model.vo.Store;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.review.model.vo.Review;

public interface MemberDao {
	Map<String,String> orderOne(Map<String,String> orList);
	int selectOrderCount(int memberNum);
	List<Member> selectMemberOrder(int memberNum,int cPage,int numPerPage);
	int updateMemberQna(MemberQna mq);
	int deleteMemberQna(int no);
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
	int insertWishList(Map<String,Object> menuMap);
	List<WishList> selectWishList(Map<String,Object> maps);
	int plusMenuCount(Map<String,Object> upCount);
	int minusMenuCount(Map<String,Object> upCount);
	int menuCounts(int menuCode);
	int deleteMenuCount(int menuCode);
	
//	List<Map<String,String>> selectMenuList(int menuCategoryCode, int businessCode);
	Map<String,String> selectSearchId(Map<String,String> map); //아이디찾기
	Map<String,String> selectConfirmEmail(Map<String,String>map);
	int updatePw(Map<String,String>map);

	List<Map<String,String>> selectMenuList(int menuCategoryCode, int businessCode);
	Menu menuSelect(int menuCode);
	List<Store> selectAllStore(int cPage,int numPerPage);
	int kakaoEnrollEnd(Member m);
	List<Review> selectReview(int businessCode);
	// 회원공지사항
	List<MemberNotice> selectMemberNotice(int cPage,int numPerPage);
	// 찜 목록
	List<Store> selectMarkList(String memberId);
}
