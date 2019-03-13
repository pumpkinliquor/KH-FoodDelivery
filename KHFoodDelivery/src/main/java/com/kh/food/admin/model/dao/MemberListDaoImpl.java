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
	
	
	//회원 페이징
	@Override
	public int memCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.memCount");
	}



	//사장리스트
	@Override
	public List<Map<String, String>> selectListOwner() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.selectListOwner");
	}
	
	
	//사장 페이징
	@Override
	public int ownCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.ownCount");
	}



	//회원상세보기
	@Override
	public Map<String, String> memberOne(int memberNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.memberOne",memberNum);
	}

	//사장 상세보기
	@Override
	public Map<String, String> ownerOne(int businessCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.ownerOne", businessCode);
	}

	//회원 삭제
	@Override
	public int memberDel(String[] rowCheck) {
		// TODO Auto-generated method stub
		for(int i=0; i<rowCheck.length; i++) {
			int memberNum=Integer.parseInt(rowCheck[i]);
			sqlSession.delete("admin.memberDel",memberNum );			
		}
		return 0;
	}

	//사장 삭제
	@Override
	public int ownerDel(String[] rowCheck) {
		// TODO Auto-generated method stub
		for(int i=0; i<rowCheck.length; i++) {
			int ownerNum=Integer.parseInt(rowCheck[i]);
			sqlSession.delete("admin.ownerDel",ownerNum);
		}
		return 0;
	}

	
	
	

	
}
