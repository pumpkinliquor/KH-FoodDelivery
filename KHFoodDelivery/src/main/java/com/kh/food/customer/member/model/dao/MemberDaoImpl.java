package com.kh.food.customer.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.owner.menu.model.vo.Menu;
import com.kh.food.owner.store.model.vo.Store;

@Repository
public class MemberDaoImpl implements MemberDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Store> selectAllStore(){
		return sqlSession.selectList("member.selectAllStore");
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

	@Override
	public List<Map<String, String>> selectMenuList(int menuCategoryCode, int businessCode) {
		Map<String,Object> codes=new HashMap<>();
		codes.put("menuCategoryCode", menuCategoryCode);
		codes.put("businessCode", businessCode);
		return sqlSession.selectList("member.selectMenuList",codes);
	}
	
}
