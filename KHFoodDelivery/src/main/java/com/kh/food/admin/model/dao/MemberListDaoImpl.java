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
	
	public List<Map<String,String>> selectListMember(){
	return sqlSession.selectList("admin.selectListMember");
	}

	@Override
	public List<Map<String, String>> selectListOwner() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.selectListOwner");
	}

	/*@Override
	public int memberDel(int memberNum) {
		// TODO Auto-generated method stub
		return sqlSession.delete("admin.memberDel", memberNum);
	}*/
	
	
}
