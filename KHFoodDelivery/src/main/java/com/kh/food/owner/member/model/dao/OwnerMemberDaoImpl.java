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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int createAuthKey(String ownerEmail, String key) {
		// TODO Auto-generated method stub
		Owner o = new Owner();
		/*o.setUser_authCode(user_authCode);*/
		o.setOwnerEmail(ownerEmail);

		int result = sqlSession.selectOne("owner.createAuthKey", o);
		
		return result;
	}

	
	
}
