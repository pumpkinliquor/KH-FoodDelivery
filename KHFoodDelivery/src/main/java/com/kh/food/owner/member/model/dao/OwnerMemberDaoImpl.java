package com.kh.food.owner.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.member.model.vo.Owner;

@Repository
public class OwnerMemberDaoImpl implements OwnerMemberDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertOwner(Owner o) {

		return sqlSession.insert("ownerMember.insertOwner",o);
	}

}
