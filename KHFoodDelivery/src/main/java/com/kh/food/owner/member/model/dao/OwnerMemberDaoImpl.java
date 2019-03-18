package com.kh.food.owner.member.model.dao;

import java.util.Map;

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

	@Override
	public Owner selectLogin(String ownerId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ownerMember.selectLogin",ownerId);
	}

	@Override
	public Map<String, String> selectSearchId(Map<String, String> map) {
		return sqlSession.selectOne("ownerMember.selectSearchId",map);
	}

	@Override
	public Map<String, String> selectConfirmIdEmail(Map<String, String> map) {
		return sqlSession.selectOne("ownerMember.selectConfirmIdEmail",map);
	}
	@Override
	public int updateTempPw(Map<String, String> map) {
		return sqlSession.update("ownerMember.updateTempPw",map);
	}

	@Override
	public int ownerCheckId(String ownerId) {
		return sqlSession.selectOne("ownerMember.ownerCheckId",ownerId);
	}

	@Override
	public int lastDate(int ownerNum) {
		return sqlSession.update("ownerMember.lastDate", ownerNum);
	}

	@Override
	public String selectBusiness(String ownerId) {
		return sqlSession.selectOne("ownerMember.selectBusiness", ownerId);
	}



	
	
}
