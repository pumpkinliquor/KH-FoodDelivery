package com.kh.food.customer.member.model.service;

import java.util.List;
import java.util.Map;

import com.kh.food.admin.notice.model.vo.MemberNotice;
import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.customer.member.model.vo.WishList;
import com.kh.food.owner.menu.model.vo.Menu;
import com.kh.food.owner.store.model.vo.Store;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.review.model.vo.Review;

public interface MemberService {
	//상세 주문내역
	Map<String,String> orderOne(Map<String,String> orList);
	//고객 문의 수정
	int updateMemberQna(MemberQna mq);
	//고객 문의 삭제
	int deleteMemberQna(int no);
	//고객 문의상세내용
	MemberQna memberDetailQna(int no);
	//고객 문의 보기
	List<MemberQna> selectmemberQna(String memberId);
	//회원가입
	int memberEnroll(Member m);
	//주문내역
	List<Member> selectMemberOrder(int memberNum,int cPage,int numPerPage);
	//주문내역 페이징 카운트
	int selectOrderCount(int memberNum);
	int checkId(String memberId);
	Map<String,Object> login(Map<String,String> map);
	int checkNick(String nickName);
	Member selectMember(String memberId);
	int update(Member m);
	List<Store> selectStore(String category,int cPage,int numPerPage);
	int selectMenuCount();
	int drop(String memberId);
	List<Store> menuInfo(int businessCode);
	List<Map<String,String>> selectCategoryList(int businessCode);
//	List<Map<String,String>> selectMenuList(int menuCategoryCode,int businessCode);
	int insertWishList(Map<String,Object> menuMap);
	List<WishList> selectWishList(Map<String,Object> maps);
	int plusMenuCount(Map<String,Object> upCount);
	int minusMenuCount(Map<String,Object> upCount);
	int menuCounts(int menuCode);
	int deleteMenuCount(int menuCode);
	
	Map<String,String>selectSearchId(Map<String,String> map); //아이디찾기
	Map<String,String>selectConfirmEmail(Map<String,String>map);
	int updatePw(Map<String, String> map);

	List<Map<String,String>> selectMenuList(int menuCategoryCode,int businessCode);
	Menu menuSelect(int menuCode);
	List<Store> selectAllStore(int cPage,int numPerPage);
	int kakaoEnrollEnd(Member m);
	
	// 회원 공지사항
	List<MemberNotice> selectMemberNotice(int cPage,int numPerPage);
	// 찜 목록
	List<Store> selectMarkList(String memberId);
	List<Review> selectReview(int businessCode);
}
