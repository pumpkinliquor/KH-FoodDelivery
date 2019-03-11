package com.kh.food.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class MemberListDaoImpl implements MemberListDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//회원리스트
	public List<Map<String,String>> selectListMember(){
	return sqlSession.selectList("admin.selectListMember");
	}

	//사장리스트
	@Override
	public List<Map<String, String>> selectListOwner() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.selectListOwner");
	}

	//회원상세보기
	@Override
	public Map<String, String> memberOne(int memberNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.memberOne",memberNum);
	}

	
	//사장상세보기
	@Override
	public Map<String, String> ownerOne(String ownerId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.ownerOne", ownerId);
	}

	
	

	
	/*@Override
	public int memberDel(int memberNum) {
		// TODO Auto-generated method stub
		return sqlSession.delete("admin.memberDel", memberNum);
	}*/
	
	
}
