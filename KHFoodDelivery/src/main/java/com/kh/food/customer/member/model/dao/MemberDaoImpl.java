package com.kh.food.customer.member.model.dao;

import java.util.HashMap;
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
import com.kh.food.owner.store.model.vo.Store;
import com.kh.food.qna.model.vo.MemberQna;
import com.kh.food.review.model.vo.Review;

@Repository
public class MemberDaoImpl implements MemberDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	

	@Override
	public List<Review> selectReview(int businessCode) {
		return sqlSession.selectList("member.selectReview",businessCode);
	}
	@Override
	public Map<String,String> orderOne(int menuCode) {
		return sqlSession.selectOne("member.orderOne",menuCode);
	}
	
	@Override
	public int selectOrderCount(int memberNum) {
		return sqlSession.selectOne("member.orderCount",memberNum); 
	}
	
	@Override
	public List<Member> selectMemberOrder(int memberNum,int cPage,int numPerPage) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.selectMemberOrder",memberNum,rb);
	}
	
	public int menuCounts(int menuCode) {
		return sqlSession.selectOne("menu.menuCounts", menuCode);
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

	@Override
	public int plusMenuCount(Map<String,Object> upCount) {
		return sqlSession.update("menu.updateMenuCount", upCount);
	}
	
	@Override
	public int minusMenuCount(Map<String,Object> upCount) {
		return sqlSession.update("menu.updateMenuCount", upCount);
	}

	@Override
	public int deleteMenuCount(int menuCode) {
		return sqlSession.delete("menu.deleteMenuCount", menuCode);
	}

	@Override
	public MemberQna memberDetailQna(int no) {
		return sqlSession.selectOne("member.qnaDtail",no);
	}
	@Override
	public List<Store> selectAllStore(int cPage,int numPerPage){
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("member.selectAllStore",null,rb);
	}
	
	@Override
	public List<Store> menuInfo(int businessCode) {
		return sqlSession.selectList("member.selectStore2",businessCode);
	}

	@Override
	public int selectMenuCount() {
		return sqlSession.selectOne("member.selectMenuCount");
	}
	
	@Override
	public int drop(String memberId) {
		return sqlSession.delete("member.drop",memberId);
	}
	@Override
	public List<Store> selectStore(String category,int cPage,int numPerPage){
		RowBounds rb=new RowBounds((cPage-1)*numPerPage,numPerPage);
		return  sqlSession.selectList("member.selectStore",category,rb);
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
	public int checkNick(String nickName) {
		return sqlSession.selectOne("member.checkNick",nickName);
	}

	@Override
	public Map<String,String> login(Map<String,String> map){
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
	public List<Mark> selectMarkList(String memberId) {
		return sqlSession.selectList("member.selectMarkList", memberId);
	}
	
}
