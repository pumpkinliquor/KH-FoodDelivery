package com.kh.food.owner.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OwnerNoticeDaoImpl implements OwnerNoticeDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	@Override
	public List<Map<String, String>> ownerNoticeList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.selectOwnerNoticeList");
	}
	@Override
	public Map<String, String> selectOwnerNotice(int ownerNoticeNum) {
		// TODO Auto-generated method stub
		System.out.println(ownerNoticeNum+": ㅋ");
		return sqlSession.selectOne("admin.selectOwnerNotice", ownerNoticeNum);
	}

	
	
}
