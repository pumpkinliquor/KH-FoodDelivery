package com.kh.food.admin.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//회원공지사항리스트
	@Override
	public List<Map<String, String>> selectMemberNoticeList() {
		// TODO Auto-generated method stub
		
		return sqlSession.selectList("admin.selectMemberNoticeList");
	}

	//회원공지사항 뷰
	@Override
	public Map<String, String> selectMemberNotice(int noticeNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("admin.selectMemberNotice",noticeNum);
	}

	@Override
	public List<Map<String, String>> ownerNoticeList() {
		return sqlSession.selectList("ownerMember.ownerNoticeList");
	}

	@Override
	public int deleteMemberNotice(int noticeNum) {
		// TODO Auto-generated method stub
		return sqlSession.delete("admin.deleteMemberNotice", noticeNum);
	}

	
	
	
}
