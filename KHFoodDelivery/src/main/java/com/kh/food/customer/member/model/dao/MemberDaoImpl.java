package com.kh.food.customer.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.customer.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int memberEnroll(Member m) {
		
		return sqlSession.insert("member.insertMember",m);
	}
	
	
}
