package com.kh.food.customer.member.model.dao;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class MemberDaoImpl implements MemberDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	
	@Override
	public Map<String, Object> selectReviewView(int no) {
		return sqlSession.selectOne("member.selectReviewView", no);
	}
	@Override
	public List<Map<String, Object>> selectReview(String memberId) {
		return sqlSession.selectList("member.selectReviewList", memberId);
	}
	@Override
	public Map<String, Object> selectReviewCon(int payNum) {
		return sqlSession.selectOne("member.selectReviewCon", payNum);
	}
	@Override
	public int updateAttach(Map<String,Object> map) {
		return sqlSession.update("member.updateAttach",map);
	}
	// 회원 문의 첨부파일
	@Override
	public List<Map<String, String>> selectMemberQnaAttach(int no) {
		return sqlSession.selectList("member.memberQnaAttach", no);
	
	}
	@Override
	public int addAttach(MemberQnaAttachment a) {
		return sqlSession.insert("member.addAttach", a);
	}
	@Override
	public int reviewCount(int businessCode) {
		
		return sqlSession.selectOne("member.reviewCount",businessCode);
	}
	@Override
	public int ownerReviewCount(int businessCode) {
		
		return sqlSession.selectOne("member.ownerReviewCount",businessCode);
	}
	
	@Override
	public Store storeList(int businessCode) {
		
		return sqlSession.selectOne("store.storeList",businessCode);
	}
	@Override
	public String storeP(int businessCode) {
		
		return sqlSession.selectOne("store.storeP",businessCode);
	}
	@Override
	public int reviewAvg(int businessCode) {
		
		return sqlSession.selectOne("member.reviewAvg",businessCode);
	}
	@Override
	public int insertReview(Map map) {
		
		return sqlSession.insert("member.insertReview",map);
	}
	@Override
	public List<OwnerReview> selectOwnerRevie(int businessCode) {
		
		return sqlSession.selectList("store.selectOwnerRevie2",businessCode);
	}
	
	@Override
	public int menuCount(Map<String, Object> maps) {
		return sqlSession.selectOne("menu.menuCount",maps);
	}
	//회원 문의 등록
	@Override
	public int addQna(Map<String,Object> map) {
		
		return sqlSession.insert("member.qnaAdd",map);
	}
	
	//멤버 리뷰 보기
	@Override
	public List<Review> selectReview(int businessCode) {
		return sqlSession.selectList("member.selectReview",businessCode);
	}
	//회원 주문내역
	@Override
	public List<Map<String, String>> orderOne(Map<String,String> orList) {
		return sqlSession.selectList("member.orderOne",orList);
	}
	
	//회원 주문내역 카운트
	@Override
	public int selectOrderCount(int memberNum) {
		return sqlSession.selectOne("member.orderCount",memberNum); 
	}
	//회원 주문내역 전체 보기
	@Override
	public List<Member> selectMemberOrder(int memberNum,int cPage,int numPerPage) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.selectMemberOrder",memberNum,rb);
	}
	
	@Override
	public int backWish(String memberId) {
		return sqlSession.delete("menu.backWish", memberId);
	}
	@Override
	public Store minPrice(int businessCode) {
		return sqlSession.selectOne("menu.selectMinPrice", businessCode);
	}
	
	@Override
	public List<Menu> popularityMenu(int businessCode) {
		return sqlSession.selectList("menu.popularityMenu", businessCode);
	}
	@Override
	public List<WishList> selectSame(Map<String, Object> menuMap) {
		return sqlSession.selectList("menu.selectSame", menuMap);
	}
	public int menuCounts(int menuCode) {
		return sqlSession.selectOne("menu.menuCounts", menuCode);
	}

	@Override
	public int deleteMenuCode(int reMenuCode) {
		return sqlSession.delete("menu.deleteMenuCode", reMenuCode);
	}
	@Override
	public int updateMemberQna(MemberQna mq) {
		return sqlSession.update("member.qnaUpdate",mq);
	}
	@Override
	public int deleteMemberQna(int no) {
		return sqlSession.delete("member.qnaDelete",no);
	}
	
	@Override
	public List<WishList> plusPrice(Map<String, Object> maps) {
		return sqlSession.selectList("menu.plusPrice", maps);
	}
	@Override
	public List<MemberQna> selectmemberQna(String memberId){
		
		return sqlSession.selectList("member.memberQnaList",memberId);
	}
	
	@Override
	public List<WishList> selectWishList(Map<String, Object> maps) {
		return sqlSession.selectList("menu.selectWishList", maps);
	}

	@Override
	public int insertWishList(Map<String, Object> menuMap) {
		System.out.println(menuMap);
		return sqlSession.insert("menu.insertWishList", menuMap);
	}

	//	@Override
//	public int plusMenuCount(Map<String,Object> upCount) {
//		return sqlSession.update("menu.updateMenuCount", upCount);
//	}
//	
//	@Override
//	public int minusMenuCount(Map<String,Object> upCount) {
//		return sqlSession.update("menu.updateMenuCount", upCount);
//	}
//
	@Override
	public int deleteMenuCount(int menuCode) {
		return sqlSession.delete("menu.deleteMenuCount", menuCode);
	}

	@Override
	public List<LinkedHashMap<String,String>> bigyoMenuCode(Map<String, Object> maps) {
		return sqlSession.selectList("menu.bigyoMenuCode", maps);
	}
	@Override
	public MemberQna memberDetailQna(int no) {
		return sqlSession.selectOne("member.qnaDtail",no);
	}
	
	@Override
	public List<Store> menuInfo(int businessCode) {
		return sqlSession.selectList("member.selectStore2",businessCode);
	}
	
	
	
	@Override
	public int deleteWishList(Map<String, Object> maps) {
		return sqlSession.delete("menu.deleteWishList", maps);
	}
	@Override
	public List<Menu> refreshWishList(Map<String, Object> maps) {
		return sqlSession.selectList("menu.refreshWishList", maps);
	}
	@Override
	public int drop(String memberId) {
		return sqlSession.delete("member.drop",memberId);
	}
	//카테고리 별 가게 검색
	@Override
	public List<Store> selectStore(Map<String,Object> map){
		
		return  sqlSession.selectList("member.selectStore",map);
	}

	@Override
	public Member selectMember(String memberId) {
		return sqlSession.selectOne("member.selectMember",memberId);
	}

	@Override
	public int memberEnroll(Member m) {
		System.out.println("dao"+m);
		return sqlSession.insert("member.insertMember",m);
	}
	
	@Override
	public int checkId(String memberId) {
		return sqlSession.selectOne("member.checkId",memberId);
		
	}
	
	@Override
	public int checkEmail(String memberEmail) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.checkEmail", memberEmail);
	}
	@Override
	public int checkNick(String nickName) {
		return sqlSession.selectOne("member.checkNick",nickName);
	}

	@Override
	public Map<String,Object> login(Map<String,String> map){
		return sqlSession.selectOne("member.login",map);
	}
	@Override
	public int update(Member m) {
		return sqlSession.update("member.update",m);
	}

	@Override
	public List<Map<String,String>> selectCategoryList(int businessCode) {
		return sqlSession.selectList("member.selectCategoryList", businessCode);
	}


	//아이디찾기
	@Override
	public Map<String, String> selectSearchId(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectSearchId",map);
		}

	//비밀번호찾기
	@Override
	public Map<String, String> selectConfirmEmail(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectConfirmEmail",map);
	}

	@Override
	public int updatePw(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.updatePw",map);
	}

	
	@Override
	public List<Map<String, String>> selectMenuList(int menuCategoryCode, int businessCode) {
		Map<String,Object> codes=new HashMap<>();
		codes.put("menuCategoryCode", menuCategoryCode);
		codes.put("businessCode", businessCode);
		return sqlSession.selectList("member.selectMenuList",codes);
	}

	@Override
	public Menu menuSelect(int menuCode) {
		return sqlSession.selectOne("menu.menuSelect", menuCode);
	}

	@Override
	public int kakaoEnrollEnd(Member m) {
		return sqlSession.insert("member.kakaoEnrollEnd",m);
	}
	
	// 회원 공지사항
	@Override
	public List<MemberNotice> selectMemberNotice(int cPage,int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.selectMemberNotice", null, rb);
	}
	
	// 찜 목록
	@Override
	public List<Store> selectMarkList(String memberId) {
		return sqlSession.selectList("member.selectMarkList", memberId);
	}
	
	// 찜 했는지 확인
	@Override
	public Mark isMark(Map<String, Object> maps) {
		return sqlSession.selectOne("member.selectIsMark", maps);
	}
	@Override
	public MemberQnaReview selectMemberQnaReview(int no) {
		return sqlSession.selectOne("member.selectMqr", no);
	}

	//나의주문내역 리스트 가져오기
	@Override
	public List<Map<String, String>> selectMemberOrderList(int memberNum, int cPage, int numPerPage) {
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.selectMemberOrderList",memberNum,rb);
	}
	
	@Override
	public int selectMemberOrderCount(int memberNum) {
		return sqlSession.selectOne("member.selectMemberOrderCount",memberNum);
	}	
	
	
}
