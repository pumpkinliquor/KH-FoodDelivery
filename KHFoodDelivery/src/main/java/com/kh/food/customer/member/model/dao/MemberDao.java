package com.kh.food.customer.member.model.dao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.kh.food.admin.notice.model.vo.MemberNotice;
import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.customer.member.model.vo.WishList;
import com.kh.food.mark.model.vo.Mark;
import com.kh.food.owner.menu.model.vo.Menu;
import com.kh.food.owner.order.model.vo.Pay;
import com.kh.food.owner.review.model.vo.OwnerReview;
import com.kh.food.owner.store.model.vo.Store;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.qna.model.vo.MemberQnaAttachment;
import com.kh.food.qna.model.vo.MemberQnaReview;
import com.kh.food.review.model.vo.Review;

public interface MemberDao {
	Map<String, Object> selectReviewView(int no);
	List<Map<String, Object>> selectReview(String memberId);
	Map<String, Object> selectReviewCon(int payNum);
	int updateAttach(Map<String,Object> map);
	List<Map<String, String>> selectMemberQnaAttach(int no);	
	int addAttach(MemberQnaAttachment a);
	int addQna(Map<String,Object> map);
	List<Map<String, String>> orderOne(Map<String,String> orList);
	int selectOrderCount(int memberNum);
	List<Member> selectMemberOrder(int memberNum,int cPage,int numPerPage);
	int updateMemberQna(MemberQna mq);
	int deleteMemberQna(int no);
	MemberQna memberDetailQna(int no);
	List<MemberQna> selectmemberQna(String memberId);
	int memberEnroll(Member m);
	int checkId(String memberId);
	Map<String,Object> login(Map<String,String> map);
	int checkNick(String nickName);
	Member selectMember(String memberId);
	int update(Member m);
	List<Menu> popularityMenu(int businessCode);
	List<Store> selectStore(Map<String,Object> map);
	List<Menu> refreshWishList(Map<String,Object> maps);
	int deleteWishList(Map<String,Object> maps);
	String storeP(int businessCode);
	int backWish(String memberId);
	int drop(String memberId);
	List<Store> menuInfo(int businessCode);
	List<Map<String,String>> selectCategoryList(int businessCode);
	int insertWishList(Map<String,Object> menuMap);
	List<WishList> selectWishList(Map<String,Object> maps);
	List<LinkedHashMap<String,String>> bigyoMenuCode(Map<String,Object> maps);
//	int plusMenuCount(Map<String,Object> upCount);
//	int minusMenuCount(Map<String,Object> upCount);
//	int menuCounts(int menuCode);
	int deleteMenuCount(int menuCode);
	List<WishList> plusPrice(Map<String,Object> maps);
	Store minPrice(int businessCode);
	List<WishList> selectSame(Map<String,Object> menuMap);
	int deleteMenuCode(int reMenuCode);
	Store storeList(int businessCode);
//	List<Map<String,String>> selectMenuList(int menuCategoryCode, int businessCode);
	Map<String,String> selectSearchId(Map<String,String> map); //아이디찾기
	Map<String,String> selectConfirmEmail(Map<String,String>map);
	int updatePw(Map<String,String>map);
	List<OwnerReview> selectOwnerRevie(int businessCode);
	List<Map<String,String>> selectMenuList(int menuCategoryCode, int businessCode);
	Menu menuSelect(int menuCode);
	int kakaoEnrollEnd(Member m);
	List<Review> selectReview(int businessCode);
	int menuCount(Map<String,Object> maps);
	// 회원공지사항
	List<MemberNotice> selectMemberNotice(int cPage,int numPerPage);
	// 찜 목록
	List<Store> selectMarkList(String memberId);
	Mark isMark(Map<String,Object> maps);
	int insertReview(Map map);
	int reviewAvg(int businessCode);
	int reviewCount(int businessCode);
	int ownerReviewCount(int businessCode);
	MemberQnaReview selectMemberQnaReview(int no);
	List<Map<String, String>> selectMemberOrderList(int memberNum, int cPage, int numPerPage);
	int selectMemberOrderCount(int memberNum);
	int checkEmail(String memberEmail);
}
